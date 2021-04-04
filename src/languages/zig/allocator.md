Lia
—

in short, an allocator is how you ask for memory (and free it again)

https://ziglearn.org/chapter-2/#allocators

you will need to pass an Allocator to ChildProcess.init, if that's what you're using!
here's one way to get one:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
```

the general-purpose allocator is suitable for use in programs. if you're making a library, you probably want to take an allocator from the user and use that.

ok. i assume you are using ChildProcess.init at some point. that needs an Allocator, because it needs the ability to allocate and free memory for its own needs.
if you're writing a program (not a library), i suggest you use a GeneralPurposeAllocator (per above).
if you're writing a library, you should take an allocator argument from your user and pass it to ChildProcess.
same if you use ChildProcess.exec
@clad code speaks better than i do: https://zigbin.io/05bf44
here is an example using an allocator with ChildProcess.exec. hope this helps

you will need to change some *const Allocator to *Allocator
if it's const it won't be able to modify its internal state when you make allocations
i think there'll be some more changes needed too though

##

Lia

You can say `allocator.create(MyNode)` and it'll allocate memory to fit a MyNode and hand it back to you as a `*MyNode`
If you then want to initialise it, you can say `my_node._ = .{ .field_1 = 1, .field_2 = 'x', ... };` (`allocator.destroy(my_node)` will clean that up when you're done with it.)

you will need to pass an Allocator to ChildProcess.init, if that's what you're using!
here's one way to get one:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
```

##

Jolololol
—
30.03.2021
Okay, next question: I have a [][]const u8 where both slices are created by the same allocator. It appears that I have to iterate through the array and call free on each element before freeing the whole thing, otherwise I get memory leaks. Is there a simpler way to free it that's built in?
Tetralux
—
30.03.2021
The standard way you do this is to allocate the slice, and all it's element slices, in an arena allocator, so that you can just deinit the arena and free them all at once.
Doing that also puts all the memory in one block, which makes it quicker to free in the first place, since that's essentially the same as freeing exactly once. (Though, that depends a bit on how much you allocate.)
Specs_guy
—
30.03.2021
The usual approach here is to use an ArrayList to build a slice, and then call toOwnedSlice to get the finished list, and use that.
Jolololol
—
30.03.2021
Maybe I'm confused about how the memory works... So I have an outer array that I allocate first, then I call a function that generates a new []const u8 each time and stores that in an element of the outer array. If I used an arraylist as the outer 'array' and freed that, wouldn't the []const u8s still remain in memory since their pointers weren't explicitly freed?
Tetralux
—
30.03.2021
That's right.
Jolololol
—
30.03.2021
Wouldn't that still be the case if I called .toOwnedSlice on the arraylist and freed the slice?
Tetralux
—
30.03.2021
It would, but the ArrayList helped you to build the slice, and keep track of the allocator used, etc.
Most obviously though, it does the reallocation for you, if you don't know how many items you have, up-front.
(Though you can use .initWithCapacity if you have a clue about a common size.)
(It will reduce reallocations; both because initial-size, and since each reallocation grows quadratically(?) [new_size = old_size * 2 + constant].)
Tetralux
—
30.03.2021
Right. :smile:

So far for me, it's been one of recognition, familiarity, and creativity: recognizing memory management set-ups; familiarity with common allocator types; creativity in thinking of ways allocators could work or ways to adjust your set up to make managing allocation easier/faster.

Generally, allocators are simply about what memory allocate-cleanup pattern you're after, along with how fast you need it done.
So if you understand what allocation set-up you have, and what set-ups are fast, you can go looking for an allocator which is fit-for-purpose -- or indeed, make one yourself :stuck_out_tongue:

For instance: An arena (a.k.a "push buffer") allocates linearly, allocating a block of memory at a time.
They typically allocate a new block when the last one fills up, and are usually set up to only free all blocks at once.
So they're good if you allocate things, and want to deallocate them at all at the same time.
[If you want to free everything except the final result, one might duplicate the final result before freeing the arena, or have it allocated with a different allocator to begin with.]

In contrast, other allocators (e.g Slab, GPA, Heap) will be set up to allocate and free an allocation in an arbitrary order, and so are much more useful for out-of-order freeing. Perhaps like nodes in a tree or linked list, for instance.

A Slab allocator, for instance, is a specialized version of such an allocator, which only allocates and frees a certain size of allocation.
It's especially useful when you are allocating and freeing things of the same type all the time; it's essentially a []T + []bool to tell which slots are empty.
Jolololol
—
30.03.2021
Thanks for writing that up! I'm saving it in my zig notes
Tetralux
—
30.03.2021
I just fixed a couple of things in it, so you might wanna copy it again :stuck_out_tongue: :grin:

Tetralux
—
30.03.2021
Welcome o7

Jolololol
—
30.03.2021
lol will do
fengb
—
30.03.2021
Someone gave a talk on this topic :thinking:
Tetralux
—
30.03.2021
:smirk:
I wonder who that was. :thinking: :smirk:
Luuk
—
30.03.2021
Some old guy :thinking:
Tetralux
—
30.03.2021
@Jolololol Ah yes - And you should also consider watching @fengb Zig Showtime talk on allocators, as well. :wink:
Jolololol
—
30.03.2021
I did, actually!
It just hasn't sunk in yet :slight_smile:
Tetralux
—
30.03.2021
I did wonder :smile:
Jolololol
—
30.03.2021
(It was immensely useful, @fengb)
Tetralux
—
30.03.2021
GingerBill also did a decent write-up on allocators as well, if I haven't told you that before. :rofl:
Jolololol
—
30.03.2021
You did not - do you have a link to it?
Never mind found it
Tetralux
—
30.03.2021
They're here: http://www.gingerbill.org/article/
See the Memory Allocation Strategies ones :wink:

http://www.gingerbill.org/article/2019/02/01/memory-allocation-strategies-001/
