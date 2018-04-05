@here

I’ve looked through ui `*.test.js` and these are the way of testing that I found:

```javascipt
    expect(wrapper).toMatchSnapshot();
    expect(wrapper.find(AppliedFilter).length).toBe(1);
    wrapper.find(AppliedFilter).at(0).find('button').simulate('click');
    expect(resetFilter).toHaveBeenCalled();
    expect(wrapper.find(ButtonLink).prop('disabled')).toBe(false);

    expect(() => (
      <CombinedFilters
        {...defaultProps}
        canRenderFilters={'/companyRelations/companyPortfolio/getCompanyWidePortfolioAvailableFilters'}
        canRenderQuickFilters={'/companyRelations/companyPortfolio/getCompanyWidePortfolioQuickFiltersAsync'}
      />
    )).toThrow();

    wrapper.find(Combobox).simulate('change', args);
    expect(changeField.withArgs(16201).called).toBe(true);
    expect(storeValue.withArgs(16201, 'Ben Santana (Me)').called).toBe(true);

    it('FetchBuyersList called on componentDidMount', () => {
      shallow(
        <AssignedBuyer
          {...defaultProps}
        />,
      );
      expect(fetchBuyersList.called).toBe(true);
    });

    wrapper.find(Combobox).simulate('change', { undefined, id: 1 });
    expect(changeField.called).toBe(true);
    expect(changeField.calledWith([1])).toBe(true);

    expect(wrapper.find(ComboboxComponent).instance().props.renderItem({
      level: 5,
      value: 'some value',
    }, {
      isSelected: true,
      inputValue: null,
    })).toBeDefined();

    expect(wrapper.isEmpty).toBeTruthy();

    wrapper.find(ComboboxComponent).instance().props.onChange(mockedValue);

    expect(changeField).toHaveBeenCalledTimes(1);
    expect(storeValue).toHaveBeenCalledTimes(1);

    expect(wrapper.find('div').at(0).html().includes('environment.svg')).toBe(true);
```

You can mount component in 3 different ways:
- `mount(<Component />)` for Full DOM rendering is ideal for use cases where you have components that may interact with DOM apis, or may require the full lifecycle in order to fully test the component (ie, `componentDidMount` etc.)
- `shallow(<Component />)` for Shallow rendering is useful to constrain yourself to testing a component as a unit, and to ensure that your tests aren’t indirectly asserting on behavior of child components.
- `render` which is used to render react components to static HTML and analyze the resulting HTML structure.

You can still see the underlying “nodes” in a shallow render, so for example, you can get `wrapper.children().length`, etc.

https://stackoverflow.com/questions/38710309/when-should-you-use-render-and-shallow-in-enzyme-react-tests

And another text about shallow rendering:

>Shallow rendering renders only component itself without its children. So if you change something in a child component it won’t change shallow output of your component. Or a bug, introduced to a child component, won’t break your component’s test. It also doesn’t require DOM.

https://hackernoon.com/testing-react-components-with-jest-and-enzyme-41d592c174f