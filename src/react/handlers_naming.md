From what I can tell from every example I have seen, there is an unwritten rule in the React community about handling form events:

handleX is what you name the function that you pass to the onX prop.

https://redux-form.com/7.2.0/docs/faq/handlevson.md/


Follow conventions found [here](https://reactjs.org/docs/forms.html).
As a rule of a thumb, whenever you need to handle an event, create a handler for that specific event, i.e.

```
onClick     -> handleClick
onMouseOver -> handleMouseOver
onBlur      -> handleBlur
etc.
```