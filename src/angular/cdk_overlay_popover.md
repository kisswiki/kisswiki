- https://netbasal.com/creating-powerful-components-with-angular-cdk-2cef53d81cea
  - using Angular CDK overlay feature to create popover service that exposes an API that allows us to
    - open a popover relative to any origin element
    - render:
      - a custom component
      - template
      - simple text inside it
    - get notified when it’s closed.
  - injecting the Popover service
  - calling the open() method and passing
    - the origin - the DOM element we want our popover to connect to
    - content - a custom component, can be:
      - template
      - component
      - simple text
    - optional data object that will be available inside the component via DI
    - optional width and height
  - Create the Popover Service

```typescript
export type PopoverParams<T> = {
  origin: HTMLElement;
  content: PopoverContent;
  data?: T;
  width?: string | number;
  height: string | number;
};
```
