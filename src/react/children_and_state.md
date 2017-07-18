```jsx
class FieldEditor extends React.Component { 
  handleChange = event => {
    var text = event.target.value;
    this.props.onChange(this.props.id, text);
  }

  render () {
    return (
      <div className="field-editor">
        <input onChange={this.handleChange} value={this.props.value}/>
      </div>
    );
  }
}

class FormEditor extends React.Component {
  constructor(props) {
    super(props);
    this.state = props.fields
      .reduce((accumulator, el) => {
        accumulator[el] = '';
        return accumulator;
      }, {});
  }
  
  handleFieldChange = (fieldId, value) => {
    this.setState({[fieldId] : value});
  }

  render () {
    var fields = this.props.fields.map(function(field) {
      var props = {
        id: field, 
        onChange: this.handleFieldChange, 
        value: this.state[field]
      }
      return <FieldEditor key={field} {...props} />
    }, this);

    return (
      <div>
        {fields}
        <div>{JSON.stringify(this.state)}</div>
      </div>
    );
  }
}

class App extends React.Component {
  render () {
    var fields = ["field1", "field2", "anotherField"];
    
    return (
      <FormEditor fields={fields}/>
    );
  }
}


ReactDOM.render(<App/>, document.getElementById('root'));
```

http://jsbin.com/cafijis/edit?js,output
