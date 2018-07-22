- https://doc.rust-lang.org/std/process/struct.Command.html
- https://rosettacode.org/wiki/Execute_a_system_command#Rust
- https://www.worthe-it.co.za/programming/2017/08/29/writing-git-hooks-using-rust.html

## Example

```rust
use std::process::Command;
let output = Command::new("/bin/cat")
                     .arg("file.txt")
                     .output()
                     .expect("failed to execute process");

println!("status: {}", output.status);
println!("stdout: {}", String::from_utf8_lossy(&output.stdout));
println!("stderr: {}", String::from_utf8_lossy(&output.stderr));

assert!(output.status.success());
```

- https://stackoverflow.com/questions/21011330/how-do-i-invoke-a-system-command-in-rust-and-capture-its-output/42993724#42993724

## Blocking 

>It should be noted that this is a blocking call, meaning the current task will halt until the completion of the process. This is acceptable for simple calls to the underlying operating system. .output() will handle all the tasks related to piping and spawning for you. https://hoverbear.org/2014/09/07/command-execution-in-rust/
