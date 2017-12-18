in all components where children is being altered (cloned) we need to check first that each item is a fragment first, and if it is - take its children instead of itself.

My understanding is this was an intentional decision.

https://github.com/facebook/react/issues/11859