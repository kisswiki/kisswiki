## Type vs Interface in TypeScript

https://blog.bitsrc.io/type-vs-interface-in-typescript-cf3c00bc04ae

Compare and Contrast TypeScript Interfaces and Types

Osusara Kammalawatta

TypeScript usage in the modern software development industry is expanding rapidly with the emergence of the static type-checking concept in JavaScript.

So, the chances are high that you have heard of both Types and Interfaces in TypeScript.

However, it’s possible for novice developers to make mistakes when working with Types and Interfaces as they aren’t familiar with the best practices.

This article will discuss the difference between interfaces and types in TypeScript, along with examples and appropriate use cases to help you get the most out of them.

## Interfaces

Interfaces specify the syntax that each entity must follow.

The interface defines the members of an interface, which are its properties, methods, and events.

Only the members’ declarations are included in the interfaces. The derived class is in charge of defining the members.

The TypeScript compiler uses interfaces for type-checking, and it frequently aids in establishing a standard structure to which the derived classes adhere. We use the interface keyword to create interfaces.

```typescript
interface Person {
  name: string;
  age: number;
}

const john: Person = {
  name: "John",
  age: 26,
}
```

## Types and Type Aliases

In TypeScript, a type of data is defined by its type. There are numerous fundamental types, including string, boolean, and number.

Additionally, TypeScript has advanced types that include a feature known as type aliases.

Type aliases allow us to change the name of a type without really defining a new type. Thus, we use the type keyword to make a new type alias.

```typescript
type Person = {
  name: string;
  age: number;
}

const john: Person = {
  name: "John",
  age: 26,
}
```

## Differences Between Types and Interfaces

Although both Types and Interfaces seem similar in a surface look, there are many differences between them.

For example, interfaces are essentially a means of describing the shapes of data, like an object.

On the other hand, types are definitions of data types, like primitive, intersection, union, tuple, or different types. In this section, we will discuss some key differences between interfaces and types in TypeScript.

### Declaration Merging

When two interfaces with the same name are declared, it can merge these two interfaces.

```typescript
interface Person {
  name: string
}

interface Person {
  age: number
}

const john: Person = {
  name: "John",
  age: 26,
}
```

The TypeScript compiler will generate an error if the type keyword is used to declare two different types with the same variable names.

```typescript
type Person = {
  name: string
}

// This gives Duplicate identifier 'Person' error
type Person = {
  age: number
}
```

### Extends and Intersection

The interfaces can be extended with type or by type alias. One of the best characteristics of the TypeScript interface is its simplicity in extending classes.

```typescript
interface PersonNameInterface { name: string }
interface Person1 extends PersonNameInterface { age: number }

type PersonNameType = { name: string }
interface Person2 extends PersonNameType { age: number }

class PersonClass { name = "Jhon" }
interface Person3 extends PersonClass { age: number }
```

Since type, or type alias, cannot be extended and does not support this functionality, type cannot extend a class.

However, we can combine numerous types into one type to form an intersection type. We can also combine two interfaces to create a new intersection type by using the & keyword.

But it is worth keeping in mind that combining two interfaces cannot create an intersection of interfaces.

```typescript
type PersonNameType = { name: string; }
type Person1 = PersonNameType & { age: number; }

interface PersonNameInterface { name: string; }
type Person2 = PersonNameInterface & { age: number; }

// We can combine two interfaces to create intersection type but cannot create intersection interfaces
interface PersonNameInterface { name: string; }
interface PersonAgeInterface { age: number; }
type Person3 = PersonNameInterface & PersonAgeInterface
```

### Implements and Union

A class can implement an interface or type alias in the same way. But remember that a class and an interface are static blueprints.

As a result, they cannot implement or extend type aliases that refer to union types.

```typescript
interface PersonInterface {
 name: string;
 age: number;
}

class John implements PersonInterface {
 name = "John";
 age = 26;
}

type PersonType = {
 name: string;
 age: number;
};

class Ann implements PersonType {
 name = "Ann";
 age = 26;
}

type UnionType = { name: string; } | { age: number; };

// Gives an error
class Joel implements UnionType {
 name = "Joel";
 age = 2;
}
```

TypeScript’s type does not support implements. We cannot create type aliases with implements that can be used to define variables. But we can create union types.

By combining two interfaces or types, we may create a new union type, which can contain one or more types using the | keyword.

```typescript
type PersonNameType = {
 name: string
};

type PersoneAgeType = {
 age: number
};

type Person1 = PersonNameType | PersoneAgeType;

interface PersonNameInterface {
 name: string
};

interface PersoneAgeInterface {
 age: number
};

type Person2 = PersonNameInterface | PersoneAgeInterface;
```

### Other Types

The type alias can be used for additional types like primitives, unions, and tuples, unlike an interface.

```typescript
// primitive
type Name = string;

// object
type PersonName = { name: string; };
type PersonAge = { y: number; };

// union
type PartialPoint = PersonName | PersonAge;

// tuple
type Data = [number, string];
```

In TypeScript, we can only use types to specify above mentioned “additional types,” not interfaces.

However, we may still use those inside an interface, as in the following example:

```typescript
interface Person {
  name: string
  obj: {}
  union: string | number
  tuple: [string, number]
}
```

## What should We Use?

Use interfaces when:

- A new object or an object method needs to be defined.
- You wish to benefit from declaration merging.

Use types when:

- You need to define a primitive-type alias
- Defining tuple types
- Defining a union
- You must create functions and attempt to overload them in object types through composition.
- Requiring the use of mapped types

In the end, you should carefully consider and assess the situation before deciding whether to use a type alias or an interface.

Types are better for working with functions, complex types, etc.

Interfaces work better with objects and method objects.

## Conclusion

In this article, we went through TypeScript types and interfaces. What we must remember is that there is no clear winner between these two because they are nearly identical.

Since they differ in specific ways, we must carefully evaluate the use cases to decide which should be used. However, the decision of using one over the other ultimately rests with the developer. Thank you for reading!
