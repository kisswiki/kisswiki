- other materials to learn

  - neither. Do Elements of Computing Systems, and augment chapters 10 and 11 with either of the books in the post https://www.reddit.com/r/Compilers/comments/oosy2i/comment/h61bhnj/
    - https://www.coursera.org/learn/build-a-computer/
    - project files from https://www.nand2tetris.org/software
      - https://github.com/itzhak-razi/Elements-of-Computing-Systems-Assignments
      - https://github.com/topics/elements-of-computing-systems
        - https://github.com/Bozar/Nand2Tetris
        - https://github.com/captn3m0/nand2tetris
  - [Writing An Interpreter In Go (2016) | Hacker News](https://news.ycombinator.com/item?id=21626972)
  - https://joeprevite.com/book-review-writing-an-interpreter-in-go/
  - https://www.toptal.com/scala/writing-an-interpreter
  - https://monkeylang.org/
    - list of implementations
  - https://chidiwilliams.com/post/notes-on-crafting-interpreters-go/
  - http://trevorjim.com/parsing-not-solved/
  - https://www.toptal.com/scala/writing-an-interpreter
  - You have a follow-up book, "Writing a Compiler in Go" by the same author, which, despite the title, is a full-fledged book. Honestly, I've not worked through the books, but I have skimmed through both, and I'd recommend doing Thorsten Ball's book directly. I particularly find Nystrom's writing very grating, and his code is not always very clear.

    For instance, Nystrom's blog post about Pratt (as well as the related Bantam parser repo) is filled with too much of fluff and unnecessary abstraction while the actual algorithm is only around 50 odd lines of code. Moreover, his AST code in Crafting Interpreters is, in my opinion, again a misplaced act of abstraction - the AST is much more understandable (especially for a beginner) if spelt out in full instead of using wonky functions to generate them.

    Ball's writing style is more pragmatic, his books contain good testing code, and his explanation of expression parsing was quite ample from what I recall.

    https://www.reddit.com/r/Compilers/comments/oosy2i/comment/h60oa82/

- parts
  - lexer
    - token types
      - special
        - illegal
        - eof
      - ident + liter
        - identifiers
          - all user-defined identifiers
        - literals
      - operators
        - assign
        - plus
      - delimiters
        - comma
        - semicolon
        - parens
          - lparen
          - rparen
        - braces
          - lbrace
          - rbrace
      - keywords
        - function
        - let
    - New()
      - it is not built-in in go. We need to write it ourselves
    - run test
      - code
        ```
        # https://stackoverflow.com/questions/65758349/how-to-run-tests-from-go-project-root-folder/72969365#72969365
        # https://stackoverflow.com/questions/64383545/golang-module-problem-package-xxx-xxxx-is-not-in-goroot/64392759#64392759
        # https://stackoverflow.com/questions/66894200/error-message-go-go-mod-file-not-found-in-current-directory-or-any-parent-dire 67598174#67598174
        # https://stackoverflow.com/questions/68121036/how-to-fix-goroot-problem-in-local-packages-in-mac/68121083#68121083
        # https://go.dev/doc/tutorial/getting-started
        # https://stackoverflow.com/questions/61845013/package-xxx-is-not-in-goroot-when-building-a-go-project/70816877#70816877
        # https://www.digitalocean.com/community/tutorials/how-to-use-go-modules
        # https://www.digitalocean.com/community/tutorials/how-to-use-a-private-go-module-in-your-own-project
        # https://maelvls.dev/go111module-everywhere/
        $ cd 01/src/monkey/
        $ go mod init monkey
        $ go run .
        $ go test ./lexer
        ```
  - parser
  - abstract syntax tree
  - internal object system
  - evaluator
- ch 01
  - code
    - lexer
      - Lexer
        - type Lexer struct {
          - input string
          - position int
          - readPosition int
          - ch byte
        - }
      - New()
        - `func New(input string) *Lexer {`
          - l := &Lexer{input: input}
          - l.readChar()
          - return l
        - }
      - NextToken()\*
        - `func (l *Lexer) NextToken() token.Token {`
          - var tok token.Token
        - }
      - skipWhiteSpace()
      - readChar()
      - peekChar()
      - readIdentifier()
      - readNumber()
      - isLetter()
      - isDigit()
      - newToken()
- github.com/rofrol/monkey-zig
  - lexer.zig
    - Token
      - const Token
        - const Token = struct {};
          - pub const Token = struct {
            - tag
              - tag: Tag,
            - loc
              - loc: Loc,
            - Loc
              - pub const Loc = struct {
                - start: usize,
                - end: usize,
              - };
            - Tag
              - const Tag
                - const Tag = enum {};
                  - pub const Tag = enum {};
                    - pub const Tag = enum {
                      - illegal,
                      - keyword_fn,
                    - };
            - Keywords
              - const Keywords
                - const Keywords = std.CompTimeStringMap();
                  - pub const Keywords = std.CompTimeStringMap(Tag, .{});
                    - pub const Keywords = std.CompTimeStringMap(Tag, .{
                      - .{ "fn", .keyword_fn },
                    - });
          - };
    - Lexer
      - const Lexer
        - const Lexer = struct {};
          - pub const Lexer = struct {};
            - pub const Lexer = struct {
              - input
                - input: []const u8,
              - pos
                - pos: usize = 0,
              - init
                - fn init
                  - fn init(input: [] const u8) {}
                    - fn init(input: []const u8) Lexer {}
                      - pub fn init(input: []const u8) Lexer {}
                        - pub fn init(input: []const u8) Lexer {
                          - return Lexer{};
                            - return Lexer{ .input = input };
                        - }
              - State
                - const State
                  - const State = enum { start };
                    - const State = enum {
                      - start,
                      - plus,
                      - minus,
                    - }
              - next
                - `fn next(self: *Lexer)`
                  - `pub fn next(self: *Lexer) Token {`
                    - token
                      - var token
                        - var token = Token{
                          - .tag
                            - .tag = .start,
                          - .loc
                            - .loc = .{},
                              - .loc = .{
                                - .start
                                  - .start = self.pos,
                                - .end
                                  - .end = undefined,
                              - }
                        - };
                    - state
                      - var state
                        - var state: State
                          - var state: State = .start;
                    - while
                      - while(true) : (self.pos += 1) {
                        - if
                          - if(self.pos >= self.input.len) {
                            - token
                              - token.loc.end = self.pos;
                            - return
                              - return token;
                          - }
                        - c
                          - c = self.input[self.pos];
                        - switch
                          - switch(state) {
                            0 => break,
                            else => break,
                          - }
                      - }
                    - token.loc.end
                      - tokne.loc.end = self.pos;
                    - return
                      - return token;
                  - }
            - };
    - test
      - test "next token - complete program" {
        - input
          - const input
            - const input =
            - \\ let
            - ;
        - l
          - var l
            - var l = Lexer.init(input);
        - Expectation
          - const Expectation
            - const Expectation = struct {
              - .tag
                - .tag: Token.Tag,
              - .literal
                - .literal: []const u8,
            - };
        - expectations
        - for
      - }
  - main.go
