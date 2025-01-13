but unknown isn't assignable to anything but itself and any without a type assertion or a control flow based narrowing

unknown można bez koercji do any przypisać

Much like any, any value is assignable to unknown; however, unlike any, you cannot access any properties on values with the type unknown, nor can you call/construct them. Furthermore, values of type unknown can only be assigned to unknown or any.

czyli też nic nie możesz zrobić z unknown bez koercji

any to wyłączenie sprawdzania przez kompilator, a uknown to musisz powiedzieć kompilatorowi co tam jest

koercja to taka konwersja typu. koercja to krótsze słowo, bo się ukrywa. robi się bez naszej wiedzy 😃

parseInt to konwersja, sami to jawnie wywołujemy

https://stackoverflow.com/questions/51439843/unknown-vs-any
