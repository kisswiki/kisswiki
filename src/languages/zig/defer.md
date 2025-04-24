defer is significantly more error-prone:

- You generally can’t cancel a deferred statement, so if you need that then defer is useless and you’re back on your own. (Unless you add your own tracking, but at least Go’s only wants you to make exactly one function call, unless you add further hacks.) For RAII you’d just move away the resource.
- There’s no way for a callee to enforce cleanup, so if you forget to add the defer clause in every callsite you’re screwed. RAII is controlled by the callee, so it “just works”.
- It’s unclear when deferred statements happen: Go hoists them to the function scope, but ThePhD’s C proposal tracks them for every block scope.

<https://lobste.rs/s/ipvyhu/four_years_jai#c_9ggazy>
