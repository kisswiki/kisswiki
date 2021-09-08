# Today I learned

## 2021-09-07

### Rust and macros

rustc needs to run procedural macros to compute crate's metadata. That means that procedural macros can't be pipelined, and crates using procedural macros are blocked until the proc macro is fully compiled to the binary code.

- https://matklad.github.io/2021/09/04/fast-rust-builds.html
  - via https://www.reddit.com/r/programming/comments/piy1f0/fast_rust_builds/
    - via https://www.reddit.com/r/programming/top

### automatically maintain a repository of code that always passes all the tests

To increase this standardization pressure of CI, I recommend following [not rocket science rule](https://graydon2.dreamwidth.org/1597.html) and setting up a merge robot which guarantees that every state of the main branch passes CI. bors is a particular implementation I use, but there are others.

While it's by far not the biggest reason to use something like bors, it gives two benefits for healthy compile times:

- It ensures that every change goes via CI, and creates pressure to keep CI healthy overall
- The time between leaving r+ comment on the PR and receiving the "PR merged" notification gives you an always on feedback loop. You don't need to specifically time the build, every PR is a build benchmark.

- https://matklad.github.io/2021/09/04/fast-rust-builds.html
  - via https://www.reddit.com/r/programming/comments/piy1f0/fast_rust_builds/
    - via https://www.reddit.com/r/programming/top

## github creates absolutely useless garbage merges

`github creates absolutely useless garbage merges.md`

### Eminem working schedule is 9-5

He comes in at 9am every day to the studio, takes his lunch break at 1, and is out of there by 5pm. It's like a schedule. I didn't expect that from him. The first day I come, I come around 6. Like we're going to do an evening session. I get to the studio, they said "Em's just left!" He said, "I'm out of here!" I said, "I just got to the studio, you coming back here?" He said, "Yeah, I'll be back there at 9am."

He goes into his verse. 5 PM comes. He's halfway in. He's like "Alright bro, I'll see you tomorrow." At this point, I'm like "Yo, this is crazy right?!"

"I just like to be here," said Em. "I treat it like a real job. I don't make it no more than what it's supposed to be. I don't let it stress me out, stay longer than I have to. I got a family, I got a daughter. I want to make time."

I was like "damn, he's right". Some days I'm in the studio three, four days. I don't come out. Don't see my kids, don't call my wife, none of that. I'm sitting here like, [Eminem's way] makes a lot of sense. Ain't nothing gonna change between today and tomorrow.

- https://eminem.news/akon-learned-from-eminem-how-to-work-in-studio.html
- https://southpawers.com/2021/06/26/ed-sheeran-good-habit-eminem/

### CSS and responsive image easiest way

```css
img {
  max-width: 100%;
  max-height: 100%;
}
```

- https://stackoverflow.com/questions/3029422/how-do-i-auto-resize-an-image-to-fit-a-div-container/3029434#3029434
- https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images

```

```
