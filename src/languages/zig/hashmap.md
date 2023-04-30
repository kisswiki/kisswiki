- https://devlog.hexops.com/2022/zig-hashmaps-explained/
- https://ziglearn.org/chapter-2/#hash-maps
- https://zig.news/andrewrk/how-to-use-hash-map-contexts-to-save-memory-when-doing-a-string-table-3l33
- https://www.reddit.com/r/Zig/comments/krnuac/is_it_possible_to_create_hash_maps_at_compile_time/

## Deinit

```zig
var map = std.StringHashMap(void).init(std.testing.allocator);
defer {
    while (map.keyIterator().next()) |key| {
        std.testing.allocator.free(key.*);
    }
    map.deinit();
}
```

- https://stackoverflow.com/questions/70307231/how-to-free-keys-of-stringhashmap/70311639#70311639

```zig
fn releaseDict(allocator: Allocator, dict: *Dict(i16)) void {
    var iter = dict.iterator();
    while (iter.next()) |entry|
        allocator.free(entry.key_ptr.*);
    dict.deinit();
}
```

- https://itnext.io/a-refresh-for-zig-programmers-and-dabblers-d33f02c6a362

## What is this?

Igor Ferreira

```zig
const codons_aminoacids = .{
  .UGU = "Cysteine",
  .UGC = "Cysteine",
  .UUA = "Leucine",
  .UUG = "Leucine",
  .AUG = "Methionine",
  .UUU = "Phenylalanine",
  .UUC = "Phenylalanine",
  .UCU = "Serine",
  .UCC = "Serine",
  .UCA = "Serine",
  .UCG = "Serine",
  .UGG = "Tryptophan",
  .UAU = "Tyrosine",
  .UAC = "Tyrosine",
  .UAA = "STOP",
  .UAG = "STOP",
  .UGA = "STOP"
};

pub fn of_codon(comptime codon: []const u8) error{InvalidCodon}![]const u8 {
  return if ( @hasField(@TypeOf(codons_aminoacids), codon) ) @field(codons_aminoacids, codon)
  else error.InvalidCodon;
}

pub fn of_rna(rna: []const u8) [6]error{InvalidCodon}![]const u8 {
  var aminoacids = [_]error{InvalidCodon}![]const u8{""} ** 6;

  for ([_]u8{0} ** 6) |_, i| {
    aminoacids[i] = of_codon(rna[i * 3..3 * i + 3]);
  }

  return aminoacids;
}

pub fn main() !void {
  print("{s}\n", .{ of_rna("UGGUGUUAUUAAUGGUUU") });
}
```

```bash
[notecomm@localhost pzig]$ zig run teste.zig
./teste.zig:56:33: error: runtime value cannot be passed to comptime arg
    aminoacids[i] = of_codon(rna[i * 3..3 * i + 3]);
                                ^
./teste.zig:56:29: note: referenced here
    aminoacids[i] = of_codon(rna[i * 3..3 * i + 3]);
```

random internet person

i is a runtime value, but of_codon needs a slice at comptime

you might want inline for

Igor Ferreira

inline did not solve

random internet person

huh

oh, because rna is a runtime value, missed that

what you are trying to accomplish is runtime type reflection, which zig does not provide

jumpnbrownweasel

@Igor Ferreira I may be wrong but I have this feeling that you're trying to use a struct as a map like one can in Javascript or Python. That will only work for pure compile time expressions, not at runtime. If you need this at runtime then you have to do it differently -- use a hashmap or map triples to an integer index if the hashmap is too expensive.

random internet person

although, i dunno, std.meta should have a hasField which works at runtime

random internet person

you don’t have to use any of those, what they’re doing works, they just need to use the right things
std.meta is your friend here

jumpnbrownweasel

If the input data is not comptime, how could @hasField work? The types are erased at runtime.

random internet person

inline for works magic. you check for each field at runtime because the loop gets unrolled at comptime

Lia

in other words, you generate a runtime check for each comptime field

jumpnbrownweasel

Sure, if you want a big if/else at runtime, that's the way to do it. I'm only saying you can't use @hasField to do a runtime lookup.

random internet person

no, not with the builtin
which is why std.meta exists
and to be fair, a few of the builtins are redundant now because they can be implemented in std

inline for with std.meta.fields

I don’t think theres an actual implementation in std.meta

Lia

i'll drop a code snippet

```
pub fn of_codon(codon: []const u8) error{InvalidCodon}![]const u8 {
    inline for (std.meta.fields(@TypeOf(codons_aminoacids))) |field| {
        if (std.mem.eql(u8, field.name, codon))
            return @field(codons_aminoacids, field.name);
    }
    return error.InvalidCodon;
}
```

we comptime loop all the fields of codons_aminoacids, comparing the input codon to each field.name, returning the value of that field if it matches

this is unrolled at compile time so in reality the code ends up compiling like this:

```zig
if (std.mem.eql(u8, "UGU", codon))
    return "Cysteine";
if (std.mem.eql(u8, "UGC", codon))
    return "Cysteine";
if (std.mem.eql(u8, "UUA", codon))
    return "Leucine";
...
return error.InvalidCodon;
```

hwchen

I don’t know if this is the best zig way, but I’d probably have codons as an enum, and use std.meta.stringToEnum, then a method to map to an amino_acid enum. I might have missed some context though, sorry if this is a bit off point.

Lia

it's good to think about other ways to do it!

jumpnbrownweasel

Right, if the number of entries is large, a hashmap would be appropriate. I wouldn't use an if/else for more than a few entries, maybe 20 at the most. I assume there are quite a few amino acids, but it all depends what you're doing Igor.

Igor Ferreira

is there any way without using for, but still using struct?

Lia

think about this from the machine’s perspective: how are you going to do a lookup? you either need to check every entry or implement a hash map or something. this is idiomatic zig — it’s not a loop at runtime, it just checks statically against the string names of each of the keys of the strict in order.
what physically would you like your code to do? then we can see if it can be implemented easily or not
this does the equivalent of the series of if statements i included above, which is reasonably optimal for small numbers of struct elements
you could reorder the keys in order of descending prevalence to make average lookup time faster
but if another language lets you do a “simple” lookup, it’s only because it’s hiding an entire hash map or btree behind the lookup
this has every chance of being faster, with much less code
one way or another, you have a string key at runtime and you need to look up what it maps to. either you compare the key to all keys (inline for) or use a hash map or similar structure. but given there’s a finite known small number of codons, i think inline for is probably the nicest solution.

okay, but this begs the question. how does a map let you have direct access? how does it work internally? typically a map will:

1. hash the lookup key (this takes time)
2. look up in a table based in the key modulo some bucket count
3. scan the members of that bucket, comparing each key to the input

or if it’s a tree-based map, it needs to traverse the tree based on the key calculated at (1)

due to the chance of hash collisions all methods will still need to perform a key compare at some point
(possibly multiple if there are multiple collisions)

these data structures that underlie maps shine with larger datasets, but you are unlikely really to notice adifference with 15 or so?

you may find this helpful as a general guide to how maps are implemented in many languages https://www.rubyguidescom/2017/02/hash-tables-explained/
