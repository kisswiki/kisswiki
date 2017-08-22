Another approach it could be setting the default value inside your input, like this:

 ```javascript
 <input name="name" type="text" value={this.state.name || ''} onChange={this.onFieldChange('name').bind(this)}/>
 ```

 https://stackoverflow.com/questions/37427508/react-changing-an-uncontrolled-input/45419538#45419538
