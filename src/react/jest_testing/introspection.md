When using enzyme:

```javascript
    wrapper.find('DropdownItems input').simulate('click');
    console.log(wrapper.find('DropdownItems').html());
    console.log(wrapper.find('DropdownItems').debug());
    const items = wrapper.find('[id*="downshift-1-item-"]');
```

- http://airbnb.io/enzyme/docs/api/ShallowWrapper/html.html
- http://airbnb.io/enzyme/docs/api/ShallowWrapper/debug.html