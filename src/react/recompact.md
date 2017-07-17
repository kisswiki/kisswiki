## withState updater doesn't invoke a state changing callback

In the meantime, you may want to use Recompose's setState (Recompose and Recompact are able to work alongside each other).

I had a talk with @neoziro and we agreed that for now, it was better to not support the callback argument of the state updater.

Considering the fact that even React itself recommends using componentDidUpdate() instead, we feel that this feature is not worth the impact it will have on the code base.

https://github.com/neoziro/recompact/issues/59#issuecomment-280020575
