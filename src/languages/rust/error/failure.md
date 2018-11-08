- https://www.reddit.com/r/rust/comments/8lt8k6/do_i_really_need_failureerrorchain/
- https://www.reddit.com/r/rust/comments/833mw4/redefining_failure_review_of_failure_crate/

>Also, you're somewhat wrong about failure not giving any benefit to the enum Error { ... } cases. Firstly, it lets you capture backtaces easily. Secondly, it provides auto-derives for both the Fail and Display traits, which can eliminate quite a bit of said boiler plate in some cases. https://www.reddit.com/r/rust/comments/8dvldm/why_rusts_error_handling_is_awesome/dxqib3e/

Long term goal will be that failure does what std error becomes and provides convenient derives and utiltities. https://www.reddit.com/r/rust/comments/92kozl/feedback_needed_upcoming_failure_012_release/e36pinv/
