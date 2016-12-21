>>The logic of every Elm program will break up into three cleanly separated parts: model, update, view
>
>That assertion is erroneous. You would be missing a couple of important parts:
- the logic that decides which state you are in so you can properly compute the view and enable the actions associated to the state 
- the next action predicate
>
>One can achieve a much better decoupling between the view and the model by introducing the concept of State to hold that kind of logic, otherwise you would have to fit it either in the view or in the model. The concept of "State" is critical to achieve that decoupling. The view then becomes a pure state representation, and hence a pure function of the model.
>
>I didn't make up these semantics, they are coming directly from TLA+. TLA+ is used at Amazon to correct the most complex defects in AWS. 
>
>As a side note, some people like to call "control state" what I call state and they prefer using the word "state" to describe the content of the model. For me a model is just a set of property values with rules that decides whether some values are acceptable or not. The Model does not know anything about actions and state. Above the model, there are the (control) State and the Actions. Below is the usual CRUD to data stores. Above the (control) State and the Actions is/are the State Representation(s) (say in the REST sense, but not from a Resource-Oriented point of view).
>
>-- https://www.infoq.com/articles/no-more-mvc-frameworks
