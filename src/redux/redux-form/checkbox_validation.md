```jsx
import React from "react";
import { Field, reduxForm, SubmissionError } from "redux-form";

const Checkbox = ({ input, meta: { touched, error } }) => (
  <div style={{ border: touched && error ? "1px solid red" : "none" }}>
    <input type="checkbox" {...input} />
    <label>Terms and conditions</label>
  </div>
)

const SimpleForm = ({ handleSubmit, onSubmit }) => (
  <form onSubmit={handleSubmit(onSubmit)}>
    <Field
      name="termsAndConditions"
      component={Checkbox}
    />
    <div>
      <button type="submit">Submit</button>
    </div>
  </form>
)

const onSubmit = values => {
  if (!values.termsAndConditions) {
    throw new SubmissionError({ 
      termsAndConditions: 'Field required' 
    })
  }

  console.log('Form submitted')
}

export default reduxForm({
  form: "simple",
  onSubmit
})(SimpleForm);
```



- https://stackoverflow.com/questions/47295357/redux-form-checkbox-validation