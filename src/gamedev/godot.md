- [Godot Tutorial] Basic Breakout! [P1] https://www.youtube.com/watch?v=ntYjl_obUDo&list=PL9FzW-m48fn1iR6WL4mjXtGi8P4TaPIAp
- https://www.reddit.com/r/godot/comments/3gnkd7/blockpop_an_open_source_breakout_clone_made_with/

## Signal

```gd
func _ready():
    add_user_signal("test_signal")
    self.connect("test_signal",self,"signal_test_function")
    emit_signal("test_signal")

func signal_test_function():
    print("signal test")
```

https://www.reddit.com/r/godot/comments/3g1gc2/is_the_signal_keyword_already_implemented_or_is/
