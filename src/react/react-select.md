## floating label

```jsx
import ReactSelect, { components } from 'react-select';
const CustomValueContainer = (props) => {
    return (
        <components.ValueContainer {...props}>
        <components.Placeholder {...props}>
            {props.selectProps.placeholder}
        </components.Placeholder>
        {React.Children.map(props.children, child =>
            child && child.type !== components.Placeholder ? child : null
        )}
        </components.ValueContainer>
    );
}

    //...
    <ReactSelect
    //...

    styles={{...selectStyles,
            valueContainer: (provided, state) => ({
            ...provided,
            overflow: 'visible',
            padding: '18px 0',
            marginTop: 4,
            }),
            placeholder: (provided, state) => ({
            ...provided,
            margin: 0,
            position: 'absolute',
            top: (state.hasValue || state.selectProps.inputValue) ? 12 : '50%',
            transition: 'top 0.1s, font-size 0.1s',
            fontSize: (state.hasValue || state.selectProps.inputValue) && 10
        })
    }}
    components={{
        ValueContainer: CustomValueContainer
    }}
```

- When defining replacement components, it is important to do so outside the scope of rendering the Select. Defining a -placement component directly in the components prop can cause issues. https://react-select.com/-mponents#defining-components
- https://github.com/JedWatson/react-select/issues/2152#issuecomment-470889515
- https://github.com/JedWatson/react-select/issues/2143#issuecomment-500617325
- https://github.com/JedWatson/react-select/issues/4221#issuecomment-700617916
- https://stackoverflow.com/questions/61895814/keeping-placeholder-on-react-select
- https://react-select.com/components#defining-components

## style a select element

- https://stackoverflow.com/questions/62824482/styling-a-select-element-from-react-select
