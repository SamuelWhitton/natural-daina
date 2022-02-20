# Daina

## Index

* [Introduction to Daina](#introduction-to-daina)



* [Tutorial](#tutorial)
    + [Comments](#comments)
    + [Entry Point of a Program](#entry-point-of-a-program)
    + [Classes, Types, Objects and Dependancies](#classes-types-objects-and-dependancies)
    + [Inheritance](#inheritance)
    + [Methods and Lambdas](#methods-and-lambdas)
    + [Constructors, Instance Methods and Type Methods](#constructors-instance-methods-and-type-methods)
    + [Class Generics](#class-generics)
    + [Instance Method Visibility](#instance-method-visibility)
    + [Prologue Statements](#prologue-statements)
    + [Method Generics](#method-generics)


* [Specialised Topics](#specialised-topics)
    + [Anonymous Class Objects](#anonymous-class-objects)
    + [Compiler Injections](#compiler-injections)
    + [Compound Expressions and Statements](#compound-expressions-and-statements)
    + [Constructors](#constructors)
        - [Invoking Self Constructors](#invoking-self-constructors)
        - [Using Multiple Constructors](#using-multiple-constructors)
        - [Pointer Constructors](#pointer-constructors)
        - [Statement Order and Execution in Constructors](#statement-order-and-execution-in-constructors)
    + [Data Segments](#data-segments)
    + [Disjoint Types](#disjoint-types)
    + [Flexible Method Expression](#flexible-method-expression)
    + [Generic Specialisation](#generic-specialisation)
        - [Method Generic Specialisation](#method-generic-specialisation)
        - [Class Generic Specialisation](#class-generic-specialisation)
    + [Inheriting from Types with Generics](#inheriting-from-types-with-generics)
    + [Lexical Splitter](#lexical-splitter)
    + [Overloading Class Methods](#overloading-class-methods)
    + [Parent and Child Method Types](#parent-and-child-method-types)
    + [Partial Class Implementations](#partial-class-implementations)
        - [Unimplemented Class Methods](#unimplemented-class-methods)
        - [Assigning Class Methods in Constructors](#assigning-class-methods-in-constructors)
    + [Resolving Conflicts of Multiple Inheritance](#resolving-conflicts-of-multiple-inheritance)
    + [Root Type](#root-type)
    + [Self Reference](#self-reference)
    + [Type Inference](#type-inference)
        - [Type Inference of Method Outputs](#type-inference-of-method-outputs)
        - [Type Inference of Assignments](#type-inference-of-assignments)
        - [Parent Context Type](#parent-context-type)
        - [Self Context Type](#self-context-type)
    + [Type Casting?](#type-casting)
    + [Subtleties of Visibility in Classes with Generics](#subtleties-of-visibility-in-classes-with-generics)
    + [Variables and Mutability?](#variables-and-mutability)
    + [Visibility of Constructor and Type Methods](#visibility-of-constructor-and-type-methods)
    + [Void Identifier](#void-identifier)

always give syntax breakdown
wrap ne wparts of code with start and end
+signify, +the body is empty for now
introduction to language, aim of lanuage and how it is designed, any influences from other languages, using symbols rather then words

## Introduction to Daina

Goals
- Object oriented language with objects, inheritence and polymorphism
- Language with:
  + Inheritance and polymorphism
  + Lambda functions
  + Objects and types
- No invalid memory or state, and no undefined behaviour
- Minimal number of language constructions whilst maximising flexibility in patterns of logic
- Syntax with no keywords, instead using 1 or 2 character tokens



minimal constructions and varience while holding a minimal fucntionality, putting functionality into libraries and class definitions rather then base language
very strict typing so that there is no null or invalid objects, and all object types are correct garenteed, no downcasting, whilst retaining enough flexibility in types so that various structures and logics can be implemented
using symbols rather then words to minimise footprint of lanuage and accentuate the defined types, objects methods etc.
Daina is not useful for low level programming such as microcontrollers, memory menagement etc systems programming, or 



## Tutorial

### Comments
```
@ This is a single line comment that will be ignored in the code
```
```
@@
    This is a multiline comment
    that will be ignored in the code
@@
```

### Entry Point of a Program
This is the minimal definition of a program, sometimes called **main** in other languages.
```
[] {
    *{
        @ The first statement in a program could go here, this is the body of the entry point method of a program
    }
}
```
Whitespace is optional, so the previous example could be written like the following.
```
[]{*{}}
```

### Classes, Types, Objects and Dependancies
The following example shows the minimal definition of a class called **ClassA**. **ClassA** is the identifier of the class and is written between **[ ]** brackets. An identifier can contain one or more alpha numeric characters or underscores.
```
[ClassA] @ This is the header of ClassA
{
    @ This is inside the body of ClassA, it is currently empty
}
```
Adding a second class **ClassB** and a third class **ClassC**.
```
[ClassA] {}

@@ ClassB starts here @@
[ClassB] {
    @ This is inside the body of ClassB, it is currently empty
}
@@ ClassB ends here @@

@@ ClassC starts here @@
[ClassC] {
    @ This is inside the body of ClassC, it is currently empty
}
@@ ClassC ends here @@
```
A class can depend on other classes if it includes a dependancy list. A dependancy list is added to **ClassC** which contains **ClassA** and **ClassB**. A dependancy list is a comma seperated list between **( )** brackets and can only include the identifiers of other classes.
```
[ClassA] {}

[ClassB] {}

[ClassC]
(ClassA, ClassB) @ The dependency list of ClassC
{}
```
**ClassC** is now said to depend on **ClassA** and **ClassB**.

No circular dependancies are allowed in Daina. Therefore the following example is invalid because **ClassA** depends on **ClassC**, which depends on **ClassB**, which depends on **ClassA**...
```
[ClassA] (ClassC) {} @ Invalid; ClassA is depending on itself through ClassC

[ClassB] (ClassA) {}

[ClassC] (ClassB) {}
```
Daina has a reverse dependancy list which restricts which classes depend on the given class. In the following example, **ClassA** can only be depended apon by **ClassB**.
```
[ClassA] ()
-> (ClassB) @ The reverse dependancy list of ClassA
{}

[ClassB] (ClassA) {}
```
An **->** is always written before the reverse dependancy list.

Adding the dependancy **ClassA** to **ClassC** is invalid in this example because **ClassA** can only be depended apon by **ClassB**.
```
[ClassA] () -> (ClassB) {}

[ClassB] (ClassA) {}

[ClassC] (ClassA) {} @ Invalid; only ClassB can depend on ClassA
```
A reverse dependancy must be adhered to strictly, thus in this example the definition of **ClassB** is invalid since it doesn't depend on **ClassA**.
```
[ClassA] () -> (ClassB) {}

[ClassB] () {} @ Invalid; ClassB must depend on ClassA
```
Classes are a template used to create objects. Instance is another word used for object. Instance objects are objects tied to another object/instance (often called instance variable in other languages). The instance object **aObject** is added to **ClassC** in the following example.
```
[ClassA] {}

[ClassB] {}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject @ The newly declared instance object aObject
{
}
```
**[ClassA]** is declared to be the type of **aObject**. Types are used to classify objects. A second instance object **bObject** of type **[ClassB]** is added. Instance objects are always written before the body of the class.
```
[ClassA] {}

[ClassB] {}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject @ The newly declared instance object bObject
{
}
```
To create objects from these classes, constructors must be defined for each class. In the following example, **newA** and **newB** are the constructors for the classes **ClassA** and **ClassB**. Constructors are added to the body of the class, between the **{** **}** brackets.
```
[ClassA] {
    @@ newA constructor starts here @@
    ~ newA *{
         @ Body of the constructor newA
    }
    @@ newA constructor ends here @@
}

[ClassB] {
    @@ newB constructor starts here @@
    ~ newB *{
        @ Body of the constructor newB
    }
    @@ newB constructor ends here @@
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
}
```
Looking in detail at the syntax of the constructor **newA**:
* **~** signifies a constructor
* **newA** is the identifier of the constructor
* **\*** is written before the body of the constructor
* **{}** is the empty body of the constructor

The following example adds the constructor **newC** for **ClassC**. But this constructor is incomplete because **aObject** and **bObject** have not been assigned. A constructor must always assign the instance objects for the class.
```
[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    @@ newC constructor starts here @@
    ~ newC *{
        @ Invalid; aObject and bObject are not assigned
    }
    @@ newC constructor ends here @@
}
```
In the following example, the **newC** constructor is defined correctly by assigning **aObject** and **bObject**.
```
[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA; @ assigning aObject
        .bObject = \[ClassB]:newB; @ assigning bObject
    }
}
```
Looking closely at the first statement that was added:
```
.aObject = \[ClassA]:newA;
```
This statement assigns the instance object **aObject** to the new **[ClassA]** object created by the constructor. Looking at each part individually:

+ **.aObject** refers to the instance object **aObject** (a period is used to refer to an instance object defined within the class). This is similar to other languages which would refer to **self.aObject** or **this.aObject**.
+ **[ClassA]:newA** refers to the constructor **newA** within the class **ClassA**.
+ **=** assigns the left hand side to the right hand side.
+ **\\** represents the invocation of a method and the result is the object returned by the invoked method. In this case **[ClassA]:newA** is invoked.
+ **;** is used to seperate statements.

When a constructor is invoked, it creates a new object, executes all statements in the constructor and returns the new object. Thus **\\[ClassA]:newA** is an invocation of the constructor **newA** within **ClassA**, and so it evaluates to a new object of the type **[ClassA]**.

Similarly the second statement assigns **bObject** to a new **[ClassB]** object:

```
.bObject = \[ClassB]:newB;
```
The entry point is treated like a class, it uses the same syntax for dependancies. It is limited compared to a class and so cannot have constructors and instance objects. In the following example, an entry point is added which depends on **ClassA** and **ClassB**.
```
@@ entry point starts here @@
[] (ClassA, ClassB) {
    *{
        @ Body of the entry point method
    }
}
@@ entry point ends here @@

[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
}
```
We can now refer to **ClassA** and **ClassB** in the entry point method because **ClassA** and **ClassB** are dependancies of the entry point. We create a new local object of the type **[ClassA]** called **foo**.
```
[] (ClassA, ClassB) {
    *{
        [ClassA] foo = \[ClassA]:newA; @ new local object foo
    }
}

[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
}
```

Looking closely at the new statement that was added:
```
[ClassA] foo = \[ClassA]:newA;
```
This statement creates a new local object of the type **[ClassA]** called **foo**. Looking at each part individually:

+ **[ClassA] foo** declares the type and the identifier for the new local object. In this case the declared type is **[ClassA]** and the declared identifier is **foo**.
+ **=** assigns the left hand side to the right hand side.
+ **\\** represents the invocation of a method and the result is the object returned by the invoked method. In this case **[ClassA]:newA** is invoked.
+ **;** is used to seperate statements.


It is possible to assign to a new local object from a previous one. In the following example, **bar** is assigned to the same object as **foo**, such that **bar** and **foo** now refer to the same object.
```
[] (ClassA, ClassB) {
    *{
        [ClassA] foo = \[ClassA]:newA;
        [ClassA] bar = foo; @ bar is assigned to foo
    }
}

[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
}
```
Statements can only refer to local objects after they are defined. The following example is invalid because **bar** is assigned to **foo** but it is defined in the next statement and not before.
```
[] (ClassA, ClassB) {
    *{
        [ClassA] bar = foo; @ Invalid; foo is not defined yet
        [ClassA] foo = \[ClassA]:newA;
    }
}

[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
}
```
The type of each object must be strictly adhered to. In this next example, the type of **bar** is changed to **[ClassB]**. But this is invalid becuase it is assigned to **foo** which is of type **[ClassA]**.
```
[] (ClassA, ClassB) {
    *{
        [ClassA] foo = \[ClassA]:newA;
        [ClassB] bar = foo; @ Invalid; foo and bar are declared as different types
    }
}

[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
}
```
**foo** and **bar** are changed to be type **[ClassC]** and the constructor to **[ClassC]:newC**. All the types match, but this new example is invalid because **ClassC** is not a dependancy.
```
[] (ClassA, ClassB) {
    *{
        [ClassC] foo = \[ClassC]:newC; @ Invalid; ClassC is not a dependancy
        [ClassC] bar = foo;            @ Invalid; ClassC is not a dependancy
    }
}

[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
}
```
Finally **ClassC** is added as a dependancy, now it is valid.
```
[] (ClassA, ClassB, ClassC) { @ ClassC now in the dependancy list
    *{
        [ClassC] foo = \[ClassC]:newC;
        [ClassC] bar = foo;
    }
}

[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
}
```
Classes can have instance methods. An instance method called **greatTask** is added to **ClassC**.
```
[] (ClassA, ClassB, ClassC) {
    *{
        [ClassC] foo = \[ClassC]:newC;
        [ClassC] bar = foo;
    }
}

[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
    @@ greatTask instance method starts here @@
    +++ greatTask *{
        @ Body of the instance method greatTask
    }
    @@ greatTask instance method ends here @@
}
```
Looking in detail at the syntax of the instance method **greatTask**:
* **+++** signifies an instance method
* **greatTask** is the identifier of the instance method
* **\*** is written before the body of the instance method
* **{}** is the empty body of the instance method



An instance method is invoked on an object. The instance method **greatTask** can be invoked on any **[ClassC]** object since it is defined within **ClassC**. In the following example, the **greatTask** instance method is invoked on the object **bar**.
```
[] (ClassA, ClassB, ClassC) {
    *{
        [ClassC] foo = \[ClassC]:newC;
        [ClassC] bar = foo;
        \bar:greatTask; @ greatTask instance method invoked on bar
    }
}

[ClassA] {
    ~ newA *{}
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
    +++ greatTask *{}
}
```
**bar:greatTask** refers to the instance method **greatTask** for the object **bar**. **\bar:greatTask** invokes the instance method **greatTask** on the object **bar**.

In the following example, when **greatTask** is invoked on **bar**, a new method **middlingTask** will be invoked on the **aObject** instance object of **bar**.
```
[] (ClassA, ClassB, ClassC) {
    *{
        [ClassC] foo = \[ClassC]:newC;
        [ClassC] bar = foo;
        \bar:greatTask; @ when greatTask is invoked, middlingTask will be invoked on the aObject of bar
    }
}

[ClassA] {
    ~ newA *{}
    +++ middlingTask *{} @ new middlingTask instance method
}

[ClassB] {
    ~ newB *{}
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
    ~ newC *{
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
    +++ greatTask *{
        \.aObject:middlingTask; @ middlingTask is invoked on the aObject instance object
    }
}
```
Looking closely at the new statement that was added in **greatTask**:
```
\.aObject:middlingTask;
```
This statement invokes the instance object **middlingTask** on the instance object **aObject**. The **aObject** instance object is from the same object invoked by the outer method **greatTask**. Looking at each part individually:


+ **.aObject** refers to the instance object **aObject** (a period is used to refer to an instance object defined within the class). This is similar to other languages which would refer to **self.aObject** or **this.aObject**.
+ **:middlingTask** refers to the instance method **middlingTask** for the object written before the colon. In other words, **.aObject:middlingTask** refers to the instance method **middlingTask** on the instance object **aObject**.
+ **\\** represents the invocation of a method and the result is the object returned by the invoked method. In this case **.aObject:middlingTask** is invoked and no object is returned.
+ **;** is used to seperate statements.


In summary:

+ Classes can have instance methods, instance objects and constructors.
+ Classes and the entry point can only refer to other classes which they have as a dependancy.
+ Circular dependancies are not allowed.
+ Reverse dependancy lists allow dependancies to be restricted to a limited set of other classes.
+ A constructor must assign all instance objects.
+ Types must be adhered to strictly, and so instance objects and local objects cannot be assigned with the wrong type.

### Inheritance

To showcase inheritance, first we will start with the following classes of **Bird** and **Dog**.
```
[Dog] {
    ~ createDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}

[Bird] {
    ~ createBird *{}
    +++ sleep *{}
    +++ eat *{}
    +++ chirp *{}
}
```
**[Dog]** has instance methods **sleep**, **eat**, **bark** and a constructor **createDog**. **[Bird]** has instance methods **sleep**, **eat**, **chirp** and a constructor **createBird**. In the entry point method we create a **[Dog]** **muffles**, a **[Bird]** **chandler**, and call some instance methods of **muffles** and **chandler**.
```
[] (Dog, Bird) {
    *{
        [Dog] muffles = \[Dog]:createDog;
        \muffles:bark;
        \muffles:eat;
        \muffles:sleep;
        [Bird] chandler = \[Bird]:createBird;
        \chandler:chirp;
        \chandler:eat;
        \chandler:sleep;
    }
}

[Dog] {
    ~ createDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}

[Bird] {
    ~ createBird *{}
    +++ sleep *{}
    +++ eat *{}
    +++ chirp *{}
}
```
There is overlap between a **[Dog]** and a **[Bird]** as both have methods for **sleep** and **eat**. In the following example, we create the class **Animal** and use inheritance to copy **sleep** and **eat** from **Animal** into **Dog** and **Bird**. In other words, **Dog** and **Bird** inherit the instance methods **sleep** and **eat** from **Animal**.
```
[] (Dog, Bird) {
    *{
        [Dog] muffles = \[Dog]:createDog;
        \muffles:bark;   @ invokes bark from the Dog class
        \muffles:eat;    @ invokes eat from the Animal class
        \muffles:sleep;  @ invokes sleep from the Animal class
        [Bird] chandler = \[Bird]:createBird;
        \chandler:chirp; @ invokes chirp from the Bird class
        \chandler:eat;   @ invokes eat from the Animal class
        \chandler:sleep; @ invokes sleep from the Animal class
    }
}

[Animal] {
    +++ sleep *{}
    +++ eat *{}
}

[Dog :[Animal]] (Animal) { @ Dog is inheriting from [Animal]
    ~ createDog *{}
    +++ bark *{}
}

[Bird :[Animal]] (Animal) { @ Bird is inheriting from [Animal]
    ~ createBird *{}
    +++ chirp *{}
}
```
Writing **:[Animal]** after the name of a class means that the class will inherit the methods from **[Animal]**. So **Dog** and **Bird** are both inheriting the instance methods **sleep** and **eat** from **[Animal]**. For example when **\muffles:sleep;** is executed, the **sleep** instance method from **[Animal]** is invoked on **muffles** and when **\chandler:sleep;** is executed, the same instance method is invoked on **chandler**. 

A class must invoke a constructor from the inherited parent class within its constructor. In other words, the constructors **createDog** and **createBird** must invoke a constructor from **[Animal]**. In the following example we correctly implement **createBird** and **createDog** by invoking a constructor **createAnimal** from the **Animal** class.
```
[] (Dog, Bird) {
    *{
        [Dog] muffles = \[Dog]:createDog;
        \muffles:bark;
        \muffles:eat;
        \muffles:sleep;
        [Bird] chandler = \[Bird]:createBird;
        \chandler:chirp;
        \chandler:eat;
        \chandler:sleep;
    }
}

[Animal] {
    ~ createAnimal *{} @ the createAnimal constructor
    +++ sleep *{}
    +++ eat *{}
}

[Dog :[Animal]] (Animal) {
    ~ createDog *{
        \$~createAnimal; @ invoking the constructor createAnimal from [Animal]
    }
    +++ bark *{}
}

[Bird :[Animal]] (Animal) {
    ~ createBird *{
        \$~createAnimal; @ invoking the constructor createAnimal from [Animal]
    }
    +++ chirp *{}
}
```
**$~createAnimal** refers to the parent constructor with the name **createAnimal**. The statement **\\$~createAnimal;** will invoke the **createAnimal** parent constructor on the object being constructed. 
For example when **[Bird]:createBird** is invoked:

 1. first a new **[Bird]** object is created
 2. then **createAnimal** is invoked on the new **[Bird]**
 3. finally the new **[Bird]** is returned

Similarly, consider the statement **[Dog] muffles = \[Dog]:createDog;**: 

 1. first a new **[Dog]** is created
 2. then **createAnimal** will be invoked on the new **[Dog]**
 3. finally the new **[Dog]** is returned which is afterwards assigned to the identifier **muffles**

An inherited instance method can be overriden and replaced with a new method. In the following example, **eat** is overriden in the **Bird** class.
```
[] (Dog, Bird) {
    *{
        [Dog] muffles = \[Dog]:createDog;
        \muffles:bark;
        \muffles:eat;
        \muffles:sleep;
        [Bird] chandler = \[Bird]:createBird;
        \chandler:chirp;
        \chandler:eat;
        \chandler:sleep;
    }
}

[Animal] {
    ~ createAnimal *{}
    +++ sleep *{}
    +++ eat *{}
}

[Dog :[Animal]] (Animal) {
    ~ createDog *{
        \$~createAnimal;
    }
    +++ bark *{}
}

[Bird :[Animal]] (Animal) {
    ~ createBird *{
        \$~createAnimal;
    }
    +++ chirp *{}
    @@ overriden eat instance method starts here @@
    |+++ eat *{
        \:chirp;
        \$:eat;
    }
    @@ overriden eat instance method ends here @@
}
```
Breaking down the new **eat** method:
```
|+++ eat *{
    \:chirp;
    \$:eat;
}
```

+ **|** is used to signify overriding an instance method.
+ **:chirp** refers to the instance method called **chirp** within the enclosing class. **\\:chirp;** invokes **chirp** on the same object as the enclosing method. In other languages, this is sometimes refered to as calling a method on self and might be written as **self.chirp()** or **this.chirp()**.
+ **$:eat** refers to the instance method called **eat** within the parent class. **\\$:eat;** invokes the **eat** method from **Animal** on the same object as the enclosing method. In other languages, this is sometimes refered to as calling a method on super and might be written as **super.eat()**.

When **\chandler:eat;** is executed, instead of invoking the instance method **eat** from **[Animal]**, the **eat** method from **Bird** is invoked. Nothing has changed for the statement **\muffles:eat;**, the same instance method **eat** from **[Animal]** is invoked on **muffles**.

Since **Dog** is inheriting from **[Animal]**, an object of type **[Dog]** is considered to also be an object of type **[Animal]**. And similarly a **[Bird]** is also an object of type **[Animal]**. In the following example, the declared type of **muffles** and **chandler** is changed to **[Animal]**
```
[] (Dog, Bird, Animal) {
    *{
        [Animal] muffles = \[Dog]:createDog;
        \muffles:bark;
        \muffles:eat;
        \muffles:sleep;
        [Animal] chandler = \[Bird]:createBird;
        \chandler:chirp;
        \chandler:eat;
        \chandler:sleep;
    }
}

[Animal] {
    ~ createAnimal *{}
    +++ sleep *{}
    +++ eat *{}
}

[Dog :[Animal]] (Animal) {
    ~ createDog *{
        \$~createAnimal;
    }
    +++ bark *{}
}

[Bird :[Animal]] (Animal) {
    ~ createBird *{
        \$~createAnimal;
    }
    +++ chirp *{}
    |+++ eat *{
        \:chirp;
        \$:eat;
    }
}
```
All the same instance methods are called like before, however there is an issue with the following two statements:
```
\muffles:bark;
```
```
\chandler:chirp;
```
These statements are no longer valid since **muffles** and **chandler** are now declared to be the type **[Animal]**, and the class **Animal** does not define the instance methods **bark** or **chirp**. To solve this issue, we introduce a new instance method **makeNoise** in **Animal** and then override this method in both **Dog** and **Bird**.
```
[] (Dog, Bird, Animal) {
    *{
        [Animal] muffles = \[Dog]:createDog;
        \muffles:makeNoise;
        \muffles:eat;
        \muffles:sleep;
        [Animal] chandler = \[Bird]:createBird;
        \chandler:makeNoise;
        \chandler:eat;
        \chandler:sleep;
    }
}

[Animal] {
    ~ createAnimal *{}
    +++ sleep *{}
    +++ eat *{}
    +++ makeNoise *{} @ makeNoise instance method
}

[Dog :[Animal]] (Animal) {
    ~ createDog *{
        \$~createAnimal;
    }
    +++ bark *{}
    @@ overriden makeNoise instance method starts here @@
    |+++ makeNoise *{
        \:bark;
    }
    @@ overriden makeNoise instance method ends here @@
}

[Bird :[Animal]] (Animal) {
    ~ createBird *{
        \$~createAnimal;
    }
    +++ chirp *{}
    |+++ eat *{
        \:chirp;
        \$:eat;
    }
    @@ overriden makeNoise instance method starts here @@
    |+++ makeNoise *{
        \:chirp;
    }
    @@ overriden makeNoise instance method ends here @@
}
```
**\\muffles:makeNoise;** will invoke **makeNoise** from **[Dog]** thus invoking **bark**, and **\\chandler:makeNoise;** will invoke **makeNoise** from **[Bird]** thus invoking **chirp**. Although **muffles** and **chandler** are declared as the type **[Animal]**, they are also a **[Dog]** and a **[Bird]** and so the overriding methods are called instead, this is commonly called polymorphism.

In the following example, the **makeNoise**, **eat** and **sleep** instance methods are replaced by a new instance method called **eatSleepRoutine** which invokes **makeNoise**, **eat** and **sleep**.
```
[] (Dog, Bird, Animal) {
    *{
        [Animal] muffles = \[Dog]:createDog;
        \muffles:eatSleepRoutine;  @ invoking eatSleepRoutine instead of makeNoise, eat and sleep
        [Animal] chandler = \[Bird]:createBird;
        \chandler:eatSleepRoutine; @ invoking eatSleepRoutine instead of makeNoise, eat and sleep
    }
}

[Animal] {
    ~ createAnimal *{}
    +++ sleep *{}
    +++ eat *{}
    +++ makeNoise *{}
    @@ eatSleepRoutine instance method starts here @@
    +++ eatSleepRoutine *{
        \:makeNoise;
        \:eat;
        \:sleep;
    }
    @@ eatSleepRoutine instance method ends here @@
}

[Dog :[Animal]] (Animal) {
    ~ createDog *{
        \$~createAnimal;
    }
    +++ bark *{}
    |+++ makeNoise *{
        \:bark;
    }
}

[Bird :[Animal]] (Animal) {
    ~ createBird *{
        \$~createAnimal;
    }
    +++ chirp *{}
    |+++ eat *{
        \:chirp;
        \$:eat;
    }
    |+++ makeNoise *{
        \:chirp;
    }
}
```
Consider the **eatSleepRoutine** instance method:
```
+++ eatSleepRoutine *{
    \:makeNoise;
    \:eat;
    \:sleep;
}
```
If any of the instance methods **makeNoise** **eat** **sleep** are overriden, then **\\:makeNoise**, **\\:eat** and **\\:sleep** will invoke the overriden methods. The statement **\muffles:eatSleepRoutine;** will invoke the **makeNoise** method from the **Dog** class and the **eat** **sleep** methods from the **Animal** class. The statement **\chandler:eatSleepRoutine;** will invoke the **makeNoise** **eat** methods from the **Bird** class and the **sleep** method from the **Animal** class.

Daina allows a class to inherit from more then one other class. In the following example, the **eat** and **sleep** instance methods have been taken from **Animal** and put into new classes **HungryCreature** and **SleepyCreature**. The **Animal** class inherits from both **[HungryCreature]** and **[SleepyCreature]**.
```
[] (Dog, Bird, Animal) {
    *{
        [Animal] muffles = \[Dog]:createDog;
        \muffles:eatSleepRoutine;
        [Animal] chandler = \[Bird]:createBird;
        \chandler:eatSleepRoutine;
    }
}

@@ HungryCreature class starts here @@
[HungryCreature] {
    ~ createHungryCreature *{}
    +++ eat *{}
}
@@ HungryCreature class ends here @@

@@ SleepyCreature class starts here @@
[SleepyCreature] {
    ~ createSleepyCreature *{}
    +++ sleep *{}
}
@@ SleepyCreature class ends here @@

[Animal :[HungryCreature] :[SleepyCreature]] (SleepyCreature, HungryCreature) { @ inheriting from [HungryCreature] and [SleepyCreature]
    ~ createAnimal *{
        \$~createHungryCreature;  @ HungryCreature constructor
        \$$~createSleepyCreature; @ SleepyCreature constructor
    }
    +++ makeNoise *{}
    +++ eatSleepRoutine *{
        \:makeNoise;
        \:eat;
        \:sleep;
    }
}

[Dog :[Animal]] (Animal) {
    ~ createDog *{
        \$~createAnimal;
    }
    +++ bark *{}
    |+++ makeNoise *{
        \:bark;
    }
}

[Bird :[Animal]] (Animal) {
    ~ createBird *{
        \$~createAnimal;
    }
    +++ chirp *{}
    |+++ eat *{
        \:chirp;
        \$:eat;
    }
    |+++ makeNoise *{
        \:chirp;
    }
}
```
Consider the new header of the **Animal** class:
```
[Animal :[HungryCreature] :[SleepyCreature]] (SleepyCreature, HungryCreature) {
```
Each parent is added to the class by writing **:** and then the parent to be inherited. The parents are added one at a time after the class name. For the **Animal** class, the first parent is **[HungryCreature]** and the second parent is **[SleepyCreature]**.

Consider the new **createAnimal** constructor of the **Animal** class:
```
~ createAnimal *{
    \$~createHungryCreature;
    \$$~createSleepyCreature;
}
```
In the **createAnimal** constructor, constructors from the parents **[HungryCreature]** and **[SleepyCreature]** are invoked. **$~createHungryCreature** refers to the constructor **createHungryCreature** in the first parent **[HungryCreature]**. **$$~createSleepyCreature** refers to the constructor **createSleepyCreature** in the second parent **[SleepyCreature]**. **$** is used to refer to the first parent, **$$** is used to refer to the second parent, **$$$** would refer to the third parent and so on...

In summary:

+ Inheritance can be used to copy all the methods from an existing class into a new class.
+ A class can inherit from multiple parent classes.
+ Within a constructor, a constructor from each inherited parent must be invoked.
+ An object can be represented as any of its parent types.
+ Instance methods copied from a parent can be overriden.

### Methods and Lambdas

A method is a basic building block of code which has

 * zero or more input objects
 * a method body with zero or more executable statements
 * and optionally an output object.

A method is written with the following components in order:

1. **\*** is always written first
2. optionally; an input object list surrounded by **()**
3. optionally; **->** followed by the type of the output object
4. the method body
5. optionally; **->** followed by the output expression

Consider the following example method which takes two inputs of the type **[A]** and returns the second input:

```
*([A]firstInput,[A]secondInput)->[A]{
    [B] output = secondInput;
} -> output
```

Breaking down the syntax of the example method:

1. **\*** is written first
2. **([A]firstInput,[A]secondInput)** is the input list sourrounded by **()**. The inputs are comma seperated and declare the type and name of each input. In this case there are two input objects, **firstInput** and **secondInput**, both are of type **[A]**.
3. **-> [A]** indicates that the output is of type **[A]**.
4. **{ [B] output = secondInput; }** is the method body containing one statement assigning a local object **output** to the input object **secondInput**.
5. **-> output** indicates the output object is the local object named **output**. Since the local object is assigned to the input object **secondInput**, the output of the method will be the second input object.

There are many type of methods which can be expressed in Daina, here are just a few more examples:

1. A method with no inputs or outputs:

```
*{
    @ an empty method body
}
```

2. A method with a single input object but no output. The input is called **aInput** and is of type **[A]**:

```
*([A]aInput){}
```

3. A method with two inputs and an output. The **->[B]** denotes that the output object is of type **[B]**. The **-> bInput** denotes that the input object called **bInput** is the output:

```
*([A]aInput,[B]bInput)->[B]{
} -> bInput
```

4. A method with an output but no inputs. The output object called **aOutput** is a local object declared inside the method body:

```
*->[A]{
    [A] aOutput = \[A]:newA;
} -> aOutput
```

5. A method returning an object which is determined by the result of an expression. The result of **\\[A]:newA** is the output. This method is equivalent to the previous example:

```
*->[A]{} -> \[A]:newA
```

A method can be encasulated as a object, which is commonly called a lambda in other languages. The following example shows statements assigning the previous example methods as lambda objects:
```
[] (A, B) {
    *{
        [->] method1 = *{
                @ an empty method body
            };

        [[A]->] method2 = *([A]aInput){};

        [[A][B]->[B]] method3 = *([A]aInput,[B]bInput)->[B]{
            } -> bInput;

        [->[A]] method4 = *->[A]{
                [A] aOutput = \[A]:newA;
            } -> aOutput;

        [->[A]] method5 = *->[A]{} -> \[A]:newA;
    }
}
```
Each of the lambda objects in the above example has a lambda type. A lambda type describes the input types and the output type. For example, the type **[[A][B][C]->[D]]** is the type of a lambda object with the input types **[A]**, **[B]**, **[C]** (in that order) and a **[D]** output type.

Methods are invoked by writing **\\**, then the method, and then each of the input objects in order. The result of a method invocation is the output object (if there is an output). We add an example invocation for each of the lambda methods from the previous example.
```
[] (A, B) {
    *{
        [->] method1 = *{
                @ an empty method body
            };

        [[A]->] method2 = *([A]aInput){};

        [[A][B]->[B]] method3 = *([A]aInput,[B]bInput)->[B]{
            } -> bInput;

        [->[A]] method4 = *->[A]{
                [A] aOutput = \[A]:newA;
            } -> aOutput;

        [->[A]] method5 = *->[A]{} -> \[A]:newA;

        [A] inputA = \[A]:newA;
        [B] inputB = \[B]:newB;

        @@ example invocations start here @@
        \method1;                                   @ Invoking method1
        \method2 inputA;                            @ Invoking method2
        [B] method3Output = \method3 inputA inputB; @ Invoking method3
        [A] method4Output = \method4;               @ Invoking method4
        [A] method5Output = \method5;               @ Invoking method5
        @@ example invocations end here @@
    }
}
```
Some observations can be made about the outputs of **method3**, **method4** and **method5** in the above example:

+ **method3Output** refers to the same object as **inputB**, because when invoking **method3** the second input is the output.
+ **method4Output** refers to a new **[A]** object created when **method4** is invoked.
+ **method5Output** refers to a new **[A]** object created when **method5** is invoked.
+ **method4Output**, **method5Output** and **inputA** all refer to different **[A]** objects.

The inputs of a method can be of any type including a lambda object. In other words, the input to a method can be another method. In the following example, the lambda object **chooseTool** has an input lambda object called **choiceOutOfTwoTools**.
```
[] (Tool) {
    *{
        [[[Tool][Tool]->[Tool]][Tool][Tool]->[Tool]] chooseTool = *([[Tool][Tool]->[Tool]] choiceOutOfTwoTools, [Tool] firstTool, [Tool] secondTool) -> [Tool] {
                [Tool] chosenTool = \choiceOutOfTwoTools firstTool secondTool;
            } -> chosenTool;
    }
}

[Tool] {
    ~ newTool *{}
}
```
The intent of the **chooseTool** method is to choose a **[Tool]** out of the inputs **firstTool** and **secondTool**. The input lambda object **choiceOutOfTwoTools** takes two **[Tool]**'s as input and returns one as the output. In the following example, lambda objects **chooseFirst** and **chooseSecond** are used to pick between a **[Saw]** and a **[Hammer]**.
```
[] (Tool, Hammer, Saw) {
    *{
        [[[Tool][Tool]->[Tool]][Tool][Tool]->[Tool]] chooseTool = *([[Tool][Tool]->[Tool]] choiceOutOfTwoTools, [Tool] firstTool, [Tool] secondTool) -> [Tool] {
                [Tool] chosenTool = \choiceOutOfTwoTools firstTool secondTool;
            } -> chosenTool;
        [Tool] hammer = \[Hammer]:newHammer;
        [Tool] saw = \[Saw]:newSaw;
        [[Tool][Tool]->[Tool]] chooseFirst = *([Tool] first, [Tool] second) -> [Tool] {} -> first;
        [[Tool][Tool]->[Tool]] chooseSecond = *([Tool] first, [Tool] second) -> [Tool] {} -> second;
        [Tool] firstTool = \chooseTool chooseFirst hammer saw;   @ choosing the hammer
        [Tool] secondTool = \chooseTool chooseSecond hammer saw; @ choosing the saw
    }
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}
```
The result; **firstTool** is the object **hammer**, and **secondTool** is the object **saw**.

Inside the body of a lambda method all outside objects can be refered to. In other words, a lambda method is not isolated from the outside world. In this example, the **chooseHammerOrSaw** lambda method refers to the local objects **hammer** and **saw** which were defined outside of the lambda method.
```
[] (Tool, Hammer, Saw) {
    *{
        [Hammer] hammer = \[Hammer]:newHammer;
        [Saw] saw = \[Saw]:newSaw;
        [[[Hammer][Saw]->[Tool]]->[Tool]] chooseHammerOrSaw = *([[Hammer][Saw]->[Tool]] choice) -> [Tool] {
                [Tool] chosenTool = \choice hammer saw;
            } -> chosenTool;
    }
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}
```
The following example shows usages of **chooseHammerOrSaw**.
```
[] (Tool, Hammer, Saw) {
    *{
        [Hammer] hammer = \[Hammer]:newHammer;
        [Saw] saw = \[Saw]:newSaw;
        [[[Hammer][Saw]->[Tool]]->[Tool]] chooseHammerOrSaw = *([[Hammer][Saw]->[Tool]] choice) -> [Tool] {
                [Tool] chosenTool = \choice hammer saw;
            } -> chosenTool;
        [[Hammer][Saw]->[Tool]] chooseHammer = *([Hammer] h, [Saw] s) -> [Tool] {} -> h;
        [[Hammer][Saw]->[Tool]] chooseSaw = *([Hammer] h, [Saw] s) -> [Tool] {} -> s;
        [Tool] hammerChoice = \chooseHammerOrSaw chooseHammer;
        [Tool] sawChoice = \chooseHammerOrSaw chooseSaw;
    }
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}
```
The result is that **hammerChoice** is the same as the object **hammer**, and **sawChoice** is the same as the object **saw**.

The names of local objects and inputs must be unique and are not allowed to conflict with one another. In the previous example, the method declarations for **chooseHammer** and **chooseSaw** both have inputs called **h** and **s**, but these do not conflict because inputs are only accessable within the respective methods. In the following example, the identifiers **h** and **s** are replaced with **hammer** and **saw**, these conflict with the original **hammer** and **saw** which were declared outside the lambda methods.
```
[] (Tool, Hammer, Saw) {
    *{
        [Hammer] hammer = \[Hammer]:newHammer; @ original definition of hammer
        [Saw] saw = \[Saw]:newSaw;             @ original definition of saw
        [[[Hammer][Saw]->[Tool]]->[Tool]] chooseHammerOrSaw = *([[Hammer][Saw]->[Tool]] choice) -> [Tool] {
                [Tool] chosenTool = \choice hammer saw;
            } -> chosenTool;
        [[Hammer][Saw]->[Tool]] chooseHammer = *([Hammer] hammer, [Saw] saw) -> [Tool] {} -> hammer; @ Invalid; hammer and saw are already declared
        [[Hammer][Saw]->[Tool]] chooseSaw = *([Hammer] hammer, [Saw] saw) -> [Tool] {} -> saw;       @ Invalid; hammer and saw are already declared
        [Tool] hammerChoice = \chooseHammerOrSaw chooseHammer;
        [Tool] sawChoice = \chooseHammerOrSaw chooseSaw;
    }
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}
```

The entry point method is a special method which has no inputs or output and can only reside inside the entry point class:
```
@@ entry point class starts here @@@
[] {
    @@ entry point method starts here @@@
    *{
    }
    @@ entry point method ends here @@@
}
@@ entry point class ends here @@@
```

In summary:

+ A method has zero or more inputs objects, a body with statements, and an optional output object.
+ Methods are invoked by writing **\\**, then the method, and then each of the input objects. The result of a method invocation is the output object.
+ A method can be encapsulated as a lambda object.
+ A method can refer to objects which were previously declared outside of the method.


### Constructors, Instance Methods and Type Methods

There are three kinds of methods that can be attached to a class; constructors, instance methods and type methods.

Constructors can have input objects but can't have an explict output object. Instead, a constructor's output object is always a new object of the class. In the following example, a constructor called **newHatContainer** is declared for **[HatContainer]** which takes an input **hatInput** and assigns it as the instance object **hat**.
```
[HatContainer] (Hat)
    [Hat] hat
{
    @@ newHatContainer constructor starts here @@
    ~ newHatContainer *([Hat] hatInput) {
        .hat = hatInput;
    }
    @@ newHatContainer constructor ends here @@
}

[Hat] {
    ~ newHat *{}
}
```
The syntax of a constructor is comprised of three components:

1. **~**
2. An identifier for the constructor. In this case the identifier is **newHatContainer**.
3. A method described by the Daina method syntax. In this case the method takes an input **hatInput** and assigns it as the instance object **hat**.

A new object **hatContainer** is created by invoking the constructor **[HatContainer]:newHatContainer** with the input **someHat**.
```
[] (Hat, HatContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat; @ new object
    }
}

[HatContainer] (Hat)
    [Hat] hat
{
    ~ newHatContainer *([Hat] hatInput) {
        .hat = hatInput;
    }
}

[Hat] {
    ~ newHat *{}
}
```
The instance object **hat** within **hatContainer** now refers to the same object as **someHat**.

Instance methods can have inputs objects and an output object. Instance methods are invoked on an object of the class and can access the instance objects and methods of the object it is invoked on. We add an instance method **getHat** which returns the **hat** instance object from a **[HatContainer]**.
```
[] (Hat, HatContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
    }
}

[HatContainer] (Hat)
    [Hat] hat
{
    ~ newHatContainer *([Hat] hatInput) {
        .hat = hatInput;
    }
    @@ getHat instance method starts here @@
    +++ getHat *->[Hat]{}->.hat
    @@ getHat instance method starts here @@
}

[Hat] {
    ~ newHat *{}
}
```
The syntax of an instance method is comprised of three components:

1. **+++**
2. An identifier for the instance method. In this case the identifier is **getHat**.
3. A method described by the Daina method syntax. In this case the method returns the **hat** instance object.

The **hat** object in **hatContainer** is retrieved and assigned to the identifier **hatTakenFromContainer**.
```
[] (Hat, HatContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getHat; @ retrieved object
    }
}

[HatContainer] (Hat)
    [Hat] hat
{
    ~ newHatContainer *([Hat] hatInput) {
        .hat = hatInput;
    }
    +++ getHat *->[Hat]{}->.hat
}

[Hat] {
    ~ newHat *{}
}
```
**hatTakenFromContainer** is now referring to the same object as **someHat**.

Type methods (similar to static or class methods in other object oriented languages) can have input objects and an output object. A type method is not attached to any object and is instead invoked similar to a constructor. A type method **createHatContainer** is added which creates and returns a new **[HatContainer]** object by invoking the original constructor.
```
[] (Hat, HatContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getHat;
    }
}

[HatContainer] (Hat)
    [Hat] hat
{
    @@ createHatContainer type method starts here @@
    :: createHatContainer *([Hat] hat) -> [HatContainer] {
        [HatContainer] newHatContainer = \[HatContainer]:newHatContainer hat;
    } -> newHatContainer
    @@ createHatContainer type method ends here @@

    ~ newHatContainer *([Hat] hatInput) {
        .hat = hatInput;
    }
    +++ getHat *->[Hat]{}->.hat
}

[Hat] {
    ~ newHat *{}
}
```
The syntax of a type method is comprised of three components:

1. **::**
2. An identifier for the type method. In this case the identifier is **createHatContainer**.
3. A method described by the Daina method syntax. In this case the method takes an input **hat** and returns a new **[HatContainer]** containing **hat**.

Type methods are invoked with the same syntax as a constructor. In the following example, we invoke the **createHatContainer** type method to create a new object called **hatContainer2**.
```
[] (Hat, HatContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getHat;
        [HatContainer] hatContainer2 = \[HatContainer]:createHatContainer someHat; @ new object
    }
}

[HatContainer] (Hat)
    [Hat] hat
{
    :: createHatContainer *([Hat] hat) -> [HatContainer] {
        [HatContainer] newHatContainer = \[HatContainer]:newHatContainer hat;
    } -> newHatContainer

    ~ newHatContainer *([Hat] hatInput) {
        .hat = hatInput;
    }
    +++ getHat *->[Hat]{}->.hat
}

[Hat] {
    ~ newHat *{}
}
```
Constructor and type methods look similar when invoked, but a type method can have any output.

In the following example, we add type method **getHatFromHatContainer** which retrives the **hat** instance object from a **[HatContainer]**. Then we invoke this method and name the output **hatTakenFromContainer2**.
```
[] (Hat, HatContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getHat;
        [HatContainer] hatContainer2 = \[HatContainer]:createHatContainer someHat;
        [Hat] hatTakenFromContainer2 = \[HatContainer]:getHatFromHatContainer hatContainer2; @ using type method getHatFromHatContainer
    }
}

[HatContainer] (Hat)
    [Hat] hat
{
    :: createHatContainer *([Hat] hat) -> [HatContainer] {
        [HatContainer] newHatContainer = \[HatContainer]:newHatContainer hat;
    } -> newHatContainer

    @@ getHatFromHatContainer type method starts here @@
    :: getHatFromHatContainer *([HatContainer] hatContainer) -> [Hat] {
        [Hat] hatFromHatContainer = \hatContainer:getHat;
    } -> hatFromHatContainer
    @@ getHatFromHatContainer type method ends here @@

    ~ newHatContainer *([Hat] hatInput) {
        .hat = hatInput;
    }
    +++ getHat *->[Hat]{}->.hat
}

[Hat] {
    ~ newHat *{}
}
```
**someHat**, **hatTakenFromContainer** and **hatTakenFromContainer2** are all refering to the same object.

In summary:

+ Instance methods and type methods have zero or more inputs objects and an optional output object. Whereas constructors have zero or more inputs and the output is always a new object of the class.
+ An instance method is invoked on a object. Whereas type methods and constructors are not invoked on an object.
+ An instance method can access the instance objects and methods of the object it is invoked on.
+ Instance methods, type methods and constructors are invoked by writing **\\**, then the method, and then each of the input objects. The result of a method invocation is the output object.


### Class Generics

Consider the previous example of a **[HatContainer]**.
```
[] (Hat, HatContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getHat;
    }
}

[HatContainer] (Hat)
    [Hat] hat
{
    ~ newHatContainer *([Hat] hatInput) {
        .hat = hatInput;
    }
    +++ getHat *->[Hat]{}->.hat
}

[Hat] {
    ~ newHat *{}
}
```
In the following example, a **[ShoeContainer]** is defined which is very similar to a **[HatContainer]** but contains a **[Shoe]** instead of a **[Hat]**. A **[ShoeContainer]** called **shoeContainer** is also added which is similar to the **hatContainer**.
```
[] (Hat, HatContainer, Shoe, ShoeContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getHat;

        [Shoe] someShoe = \[Shoe]:newShoe;
        [ShoeContainer] shoeContainer = \[ShoeContainer]:newShoeContainer someShoe; @ added shoeContainer
        [Shoe] shoeTakenFromContainer = \shoeContainer:getShoe;
    }
}

@@ ShoeContainer class starts here @@
[ShoeContainer] (Shoe)
    [Shoe] shoe
{
    ~ newShoeContainer *([Shoe] shoeInput) {
        .shoe = shoeInput;
    }
    +++ getShoe *->[Shoe]{}->.shoe
}
@@ ShoeContainer class ends here @@

[HatContainer] (Hat)
    [Hat] hat
{
    ~ newHatContainer *([Hat] hatInput) {
        .hat = hatInput;
    }
    +++ getHat *->[Hat]{}->.hat
}

[Shoe] {
    ~ newShoe *{}
}

[Hat] {
    ~ newHat *{}
}
```
Using class generics we can combine **ShoeContainer** and **HatContainer** into a single class. In the following example, we introduce a new class **Container** with a class generic type **[&CONTAINED_OBJECT]** and use this new class to replace **ShoeContainer** and **HatContainer**.
```
[] (Hat, Shoe, Container) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [Container<[Hat]>] hatContainer = \[Container<[Hat]>]:newContainer someHat;     @ [Container<[Hat]>] replaces [HatContainer]
        [Hat] hatTakenFromContainer = \hatContainer:getContainedObject;

        [Shoe] someShoe = \[Shoe]:newShoe;
        [Container<[Shoe]>] shoeContainer = \[Container<[Shoe]>]:newContainer someShoe; @ [Container<[Shoe]>] replaces [ShoeContainer]
        [Shoe] shoeTakenFromContainer = \shoeContainer:getContainedObject;
    }
}

@@ Container class starts here @@
[Container < CONTAINED_OBJECT > ]
    [&CONTAINED_OBJECT] containedObject
{
    ~ newContainer *([&CONTAINED_OBJECT] objectToBeContained) {
        .containedObject = objectToBeContained;
    }
    +++ getContainedObject *->[&CONTAINED_OBJECT]{}->.containedObject
}
@@ Container class ends here @@

[Shoe] {
    ~ newShoe *{}
}

[Hat] {
    ~ newHat *{}
}
```
**< CONTAINED_OBJECT >** is written after the class name **Container** to declare the class generic type **[&CONTAINED_OBJECT]**. A class generic type is always represented with an **&** symbol. **[Container<[Hat]>]** is similar to **[HatContainer]** and represents the **Container** class where every usage of **[&CONTAINED_OBJECT]** is instantiated with **[Hat]**. Similarly, **[Container<[Shoe]>]** is like to **[ShoeContainer]** and represents instantiating **[&CONTAINED_OBJECT]** with **[Shoe]**.

In the following example, the **Container** class is shown but **[&CONTAINED_OBJECT]** is substituted with **[Hat]** to give a visual representation of **[Container<[Hat]>]**.
```
[Container < CONTAINED_OBJECT > ]
    [Hat] containedObject
{
    ~ newContainer *([Hat] objectToBeContained) {
        .containedObject = objectToBeContained;
    }
    +++ getContainedObject *->[Hat]{}->.containedObject
}
```
Similarly, **[&CONTAINED_OBJECT]** is substituted with **[Shoe]** to give a visual representation of **[Container<[Shoe]>]**.
```
[Container < CONTAINED_OBJECT > ]
    [Shoe] containedObject
{
    ~ newContainer *([Shoe] objectToBeContained) {
        .containedObject = objectToBeContained;
    }
    +++ getContainedObject *->[Shoe]{}->.containedObject
}
```
**[Container<[Hat]>]** and **[Container<[Shoe]>]** are incompatible types. In other words, it is invalid to assign a **[Container<[Hat]>]** object as a **[Container<[Shoe]>]** object and vise versa. For example, the following assignment of **shoeContainer** and **hatContainer** is invalid.
```
[] (Hat, Shoe, Container) {
    *{
        [Shoe] someShoe = \[Shoe]:newShoe;
        [Container<[Shoe]>] shoeContainer = \[Container<[Hat]>]:newContainer someShoe; @ Invalid; a [Container<[Hat]>] is not a [Container<[Shoe]>]
        [Hat] someHat = \[Hat]:newHat;
        [Container<[Hat]>] hatContainer = \[Container<[Shoe]>]:newContainer someHat;   @ Invalid; a [Container<[Shoe]>] is not a [Container<[Hat]>]
    }
}

[Container < CONTAINED_OBJECT > ]
    [&CONTAINED_OBJECT] containedObject
{
    ~ newContainer *([&CONTAINED_OBJECT] objectToBeContained) {
        .containedObject = objectToBeContained;
    }
    +++ getContainedObject *->[&CONTAINED_OBJECT]{}->.containedObject
}

[Shoe] {
    ~ newShoe *{}
}

[Hat] {
    ~ newHat *{}
}
```
Although **[Container<[Hat]>]** and **[Container<[Shoe]>]** are incompatible types, not all **Container** types are incompatible. In the following example, **[Container<[Hat]>]** **hatContainer** is assigned to a **[Container<[BowlerHat]>]** object, where **BowlerHat** inherits from **Hat**.
```
[] (Hat, BowlerHat, Container) {
    *{
        [BowlerHat] someBowlerHat = \[BowlerHat]:newBowlerHat;
        [Container<[Hat]>] hatContainer = \[Container<[BowlerHat]>]:newContainer someBowlerHat; @ hatContainer is assigned to a [Container<[BowlerHat]>] object
        [Hat] hatTakenFromContainer = \hatContainer:getContainedObject;
    }
}

[Container < CONTAINED_OBJECT > ]
    [&CONTAINED_OBJECT] containedObject
{
    ~ newContainer *([&CONTAINED_OBJECT] objectToBeContained) {
        .containedObject = objectToBeContained;
    }
    +++ getContainedObject *->[&CONTAINED_OBJECT]{}->.containedObject
}

[BowlerHat :[Hat]] (Hat) {
    ~ newBowlerHat *{
        \$~newHat;
    }
}

[Hat] {
    ~ newHat *{}
}
```
In the above example, **someBowlerHat** and **hatTakenFromContainer** represent the same object. In general, class types with a generic instantiation are compatible if the instantiated types are compatible. Applying this to **Container**, if **[G]** is a parent type of **[H]** then **[Container<[G]>]** is a parent type of **[Container<[H]>]**. In the prior example, **[Hat]** is a parent type of **[BowlerHat]** and so **[Container<[Hat]>]** is a parent type of **[Container<[BowlerHat]>]**.

A class can have more then one generic type. We define a **Tuple** object containing the instance objects **first** and **second**, corresponding to the class generic types **[&FIRST]** and **[&SECOND]**.
```
[Tuple < FIRST, SECOND > ]
    [&FIRST] first
    [&SECOND] second
{
    ~ newTuple *([&FIRST] firstInput, [&SECOND] secondInput) {
        .first = firstInput;
        .second = secondInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second
}
```
**< FIRST, SECOND >** is written after the **Tuple** class name to declare the class generic types **[&FIRST]** and **[&SECOND]**. Any number of class generics types can be declared for a class by writing identifiers in a comma seperated list. In the following example, a **Tuple** object called **bananaAndApple** is declared which contains a **[Banana]** and an **[Apple]**.
```
[] (Tuple, Banana, Apple) {
    *{
        [Banana] banana = \[Banana]:newBanana;
        [Apple] apple = \[Apple]:newApple;
        [Tuple<[Banana][Apple]>] bananaAndApple = \[Tuple<[Banana][Apple]>]:newTuple banana apple;
    }
}

[Tuple < FIRST, SECOND > ]
    [&FIRST] first
    [&SECOND] second
{
    ~ newTuple *([&FIRST] firstInput, [&SECOND] secondInput) {
        .first = firstInput;
        .second = secondInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second
}

[Fruit] {
    ~ newFruit *{}
}

[Apple] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana] (Fruit) {
    ~ newBanana *{\$~newFruit;}
}
```
The type of **bananaAndApple** is **[Tuple<[Banana][Apple]>]**; between the **< >** is written the list of types instantiating the corresponding class generics types. Regarding **[Tuple<[Banana][Apple]>]**, the first type **[Banana]** instantiates the first class generic type **[&FIRST]**, the second type **[Apple]** instantiates the second class generic type **[&SECOND]**. When a object with generic types is declared, all the class generic types must be instantiated.

In the following example, we change **Tuple** into **Triple** which contains a third instance object corresponding to a third class generic type, and define a corresponding object **[Triple<[Banana][Apple][Grape]>]** **bananaAndAppleAndGrape**.
```
[] (Triple, Banana, Apple, Grape) {
    *{
        [Banana] banana = \[Banana]:newBanana;
        [Apple] apple = \[Apple]:newApple;
        [Grape] grape = \[Grape]:newGrape;
        [Triple<[Banana][Apple][Grape]>] bananaAndAppleAndGrape = \[Triple<[Banana][Apple][Grape]>]:newTriple banana apple grape;
    }
}

[Triple < FIRST, SECOND, THIRD > ]
    [&FIRST] first
    [&SECOND] second
    [&THIRD] third
{
    ~ newTriple *([&FIRST] firstInput, [&SECOND] secondInput, [&THIRD] thirdInput) {
        .first = firstInput;
        .second = secondInput;
        .third = thirdInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second
    +++ getThird *->[&THIRD]{}->.third
}

[Fruit] {
    ~ newFruit *{}
}

[Apple] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana] (Fruit) {
    ~ newBanana *{\$~newFruit;}
}

[Grape] (Fruit) {
    ~ newGrape *{\$~newFruit;}
}
```
Any type can be used to instantiate a class generic type, including a type which itself has generic types. Embedded generics are demonstrated in the following example; an object **[Tuple<[Banana][Tuple<[Apple][Grape]>]>]** **bananaAndAppleAndGrape** is created which contains a **[Banana]** and a **[Tuple<[Apple][Grape]>]**.
```
[] (Tuple, Banana, Apple, Grape) {
    *{
        [Banana] banana = \[Banana]:newBanana;
        [Apple] apple = \[Apple]:newApple;
        [Grape] grape = \[Grape]:newGrape;
        [Tuple<[Apple][Grape]>] appleAndGrape = \[Tuple<[Apple][Grape]>]:newTuple apple grape;
        [Tuple<[Banana][Tuple<[Apple][Grape]>]>] bananaAndAppleAndGrape = \[Tuple<[Banana][Tuple<[Apple][Grape]>]>]:newTuple banana appleAndGrape;
    }
}

[Tuple < FIRST, SECOND > ]
    [&FIRST] first
    [&SECOND] second
{
    ~ newTuple *([&FIRST] firstInput, [&SECOND] secondInput) {
        .first = firstInput;
        .second = secondInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second
}

[Fruit] {
    ~ newFruit *{}
}

[Apple] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana] (Fruit) {
    ~ newBanana *{\$~newFruit;}
}

[Grape] (Fruit) {
    ~ newGrape *{\$~newFruit;}
}
```
In general, class types with a generic instantiation are compatible if the instantiated types are compatible, this also applies to types with multiple generic instantiations. Since **[Fruit]** is a parent type of **[Banana]**, **[Apple]** and **[Grape]**, the following are parent types of **[Tuple<[Banana][Tuple<[Apple][Grape]>]>]**:

+ **[Tuple<[Fruit][Tuple<[Apple][Grape]>]>]**
+ **[Tuple<[Banana][Tuple<[Fruit][Grape]>]>]**
+ **[Tuple<[Banana][Tuple<[Apple][Fruit]>]>]**
+ **[Tuple<[Fruit][Tuple<[Fruit][Grape]>]>]**
+ **[Tuple<[Fruit][Tuple<[Apple][Fruit]>]>]**
+ **[Tuple<[Banana][Tuple<[Fruit][Fruit]>]>]**
+ **[Tuple<[Fruit][Tuple<[Fruit][Fruit]>]>]**

The following example shows some valid assignments using parent types of the **bananaAndAppleAndGrape** object.
```
[] (Tuple, Banana, Apple, Grape, Fruit) {
    *{
        [Banana] banana = \[Banana]:newBanana;
        [Apple] apple = \[Apple]:newApple;
        [Grape] grape = \[Grape]:newGrape;
        [Tuple<[Apple][Grape]>] appleAndGrape = \[Tuple<[Apple][Grape]>]:newTuple apple grape;
        [Tuple<[Banana][Tuple<[Apple][Grape]>]>] bananaAndAppleAndGrape = \[Tuple<[Banana][Tuple<[Apple][Grape]>]>]:newTuple banana appleAndGrape;

        @@ valid assignments start here @@
        [Tuple<[Banana][Tuple<[Fruit][Fruit]>]>] bananaAnd2Fruits = bananaAndAppleAndGrape;
        [Tuple<[Fruit][Tuple<[Apple][Fruit]>]>] 2FruitsAndAnApple = bananaAndAppleAndGrape;
        [Tuple<[Fruit][Tuple<[Fruit][Fruit]>]>] 3Fruits = 2FruitsAndAnApple;
        @@ valid assignments end here @@
    }
}
```
For a type to be a parent, every generic instantiation must be a parent or equivalent. So for example, **[Tuple<[Fruit][Apple]>]** is not a parent or child type of **[Tuple<[Apple][Fruit]>]**, because **[Fruit]** is a parent of **[Apple]** but **[Apple]** is not a parent of **[Fruit]**. Following are some invalid assignments added alongside the previous examples.
```
[] (Tuple, Banana, Apple, Grape, Fruit) {
    *{
        [Banana] banana = \[Banana]:newBanana;
        [Apple] apple = \[Apple]:newApple;
        [Grape] grape = \[Grape]:newGrape;
        [Tuple<[Apple][Grape]>] appleAndGrape = \[Tuple<[Apple][Grape]>]:newTuple apple grape;
        [Tuple<[Banana][Tuple<[Apple][Grape]>]>] bananaAndAppleAndGrape = \[Tuple<[Banana][Tuple<[Apple][Grape]>]>]:newTuple banana appleAndGrape;

        @@ valid assignments start here @@
        [Tuple<[Banana][Tuple<[Fruit][Fruit]>]>] bananaAnd2Fruits = bananaAndAppleAndGrape;
        [Tuple<[Fruit][Tuple<[Apple][Fruit]>]>] 2FruitsAndAnApple = bananaAndAppleAndGrape;
        [Tuple<[Fruit][Tuple<[Fruit][Fruit]>]>] 3Fruits = 2FruitsAndAnApple;
        @@ valid assignments end here @@

        @@ invalid assignments start here @@
        [Tuple<[Banana][Tuple<[Apple][Fruit]>]>] bananaAndAppleAndFruit = 2FruitsAndAnApple; @ Invalid; a [Fruit] is not a [Banana] (even though we know that the actual object here is a [Banana] on the inside)
        [Tuple<[Fruit][Tuple<[Fruit][Grape]>]>] 2FruitsAndAGrape = 3Fruits;                  @ Invalid; a [Fruit] is not a [Grape]
        [Tuple<[Banana][Tuple<[Fruit][Fruit]>]>] 2FruitsAndABanana = 2FruitsAndAnApple;      @ Invalid; an [Apple] is a [Fruit], but a [Fruit] is not a [Banana]
        @@ invalid assignments end here @@
    }
}
```
Generic types can also be used within the type methods of a class. The same rules apply to type methods, all generic types must be instantiated. In the following example, a type method **tripleFromTuple** is added to the **Triple** class and is used to transform **bananaAppleGrapeAsATuple** into **bananaAppleGrapeAsATriple**.
```
[] (Tuple, Triple, Banana, Apple, Grape) {
    *{
        [Banana] banana = \[Banana]:newBanana;
        [Apple] apple = \[Apple]:newApple;
        [Grape] grape = \[Grape]:newGrape;
        [Tuple<[Apple][Grape]>] appleGrape = \[Tuple<[Apple][Grape]>]:newTuple apple grape;
        [Tuple<[Banana][Tuple<[Apple][Grape]>]>] bananaAppleGrapeAsATuple = \[Tuple<[Banana][Tuple<[Apple][Grape]>]>]:newTuple banana appleGrape;
        [Triple<[Banana][Apple][Grape]>] bananaAppleGrapeAsATriple = \[Triple<[Banana][Apple][Grape]>]:tripleFromTuple bananaAppleGrapeAsATuple;
    }
}

[Triple < FIRST, SECOND, THIRD > ] (Tuple)
    [&FIRST] first
    [&SECOND] second
    [&THIRD] third
{
    :: tripleFromTuple *([Tuple<[&FIRST][Tuple<[&SECOND][&THIRD]>]>] tuple) -> [Triple<[&FIRST][&SECOND][&THIRD]>] {
        [&FIRST] first = \tuple:getFirst;
        [Tuple<[&SECOND][&THIRD]>] secondAndThird = \tuple:getSecond;
        [&SECOND] second = \secondAndThird:getFirst;
        [&THIRD] third = \secondAndThird:getSecond;
        [Triple<[&FIRST][&SECOND][&THIRD]>] triple = \[Triple<[&FIRST][&SECOND][&THIRD]>]:newTriple first second third;
    } -> triple

    ~ newTriple *([&FIRST] firstInput, [&SECOND] secondInput, [&THIRD] thirdInput) {
        .first = firstInput;
        .second = secondInput;
        .third = thirdInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second
    +++ getThird *->[&THIRD]{}->.third
}

[Tuple < FIRST, SECOND > ]
    [&FIRST] first
    [&SECOND] second
{
    ~ newTuple *([&FIRST] firstInput, [&SECOND] secondInput) {
        .first = firstInput;
        .second = secondInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second
}

[Fruit] {
    ~ newFruit *{}
}

[Apple] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana] (Fruit) {
    ~ newBanana *{\$~newFruit;}
}

[Grape] (Fruit) {
    ~ newGrape *{\$~newFruit;}
}
```
Lamba types can instantiate class generic types. In the following example, **aTupleOfLambdaObjects** is declared.
```
[] (Tuple, Triple, Banana, Apple, Grape) {
    *{
        [->[Apple]] createAnApple = *->[Apple]{} -> \[Apple]:newApple;
        [[Banana]->[Grape]] getAGrapeFromABanana = *([Banana] banana)->[Grape] {} -> \[Grape]:newGrape;
        [Tuple<[->[Apple]][[Banana]->[Grape]]>] aTupleOfLambdaObjects = \[Tuple<[->[Apple]][[Banana]->[Grape]]>]:newTuple createAnApple getAGrapeFromABanana;
    }
}

[Tuple < FIRST, SECOND > ]
    [&FIRST] first
    [&SECOND] second
{
    ~ newTuple *([&FIRST] firstInput, [&SECOND] secondInput) {
        .first = firstInput;
        .second = secondInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second
}

[Fruit] {
    ~ newFruit *{}
}

[Apple] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana] (Fruit) {
    ~ newBanana *{\$~newFruit;}
}

[Grape] (Fruit) {
    ~ newGrape *{\$~newFruit;}
}
```

In summary:

+ Any number of class generic types can be declared for a class, and then used anywhere inside the class.
+ A class generic type can be instantiated by any type, including another generic type or a lambda type.
+ All class generic types are instantiated when invoking a constructor, invoking a type method or declaring a type.
+ If one of the generic instantiations of a class type is a parent type, the class type also is a parent type. For example, if **[C]** is a parent type of **[B]** then **[Tuple<[A][C]>]** is a parent type of **[Tuple<[A][B]>]**.


### Instance Method Visibility

The visibility of an instance method determines in which contexts it can be invoked. Some other languages with this concept have keywords such as 'public', 'private' and 'protected' to determine in which parts of the code can a given instance method be accessed. A Daina instance method has three aspects of visibility that can be set independantly:

+ Externally (can be either visible or invisible)
+ Type (can be either visible or invisible)
+ Inherited (can be either visible or invisible)

The instance method visibility is indicated with three **+** (meaning visible) or **-** (meaning hidden); for external visibility, type visibility and inherited visibility respectively. Following are eight example instance methods showing all possible combinations of visibility.
```
[VisibilityExamples] {
    --+ fooA *{} @ fooA is externally invisible, type invisible and inherited visibly
    -+- fooB *{} @ fooB is externally invisible, type visible and inherited invisibly
    +-- fooC *{} @ fooC is externally visible, type invisible and inherited invisibly
    +++ fooD *{} @ fooD is externally visible, type visible and inherited visibly
    --- fooE *{} @ fooE is externally invisible, type invisible and inherited invisibly
    ++- fooF *{} @ fooF is externally visible, type visible and inherited invisibly
    +-+ fooG *{} @ fooG is externally visible, type invisible and inherited visibly
    -++ fooH *{} @ fooH is externally invisible, type visible and inherited visibly
}
```

When an instance method is marked with **---**, it is considered minimally visible and can only be accessed by other instance methods or constructors within the same object and class. An instance method can always be accessed by other instance methods or constructors within the same object and class. **---** is equivalent to 'private' in some other languages. The following example shows a minimally visible instance method called **cabbage** within the class **Ni**.
```
[Ni] {
    --- cabbage *{}
    ~ newNi *{
        \:cabbage;
    }
    +++ foo *{
        \:cabbage;
    }
}
```
Since **cabbage** is marked as **---**, it can only be accessed within **newNi** or **foo** since these are the only other constructor and instance method of **Ni**. It is not possible to access a **---** instance method in child classes. In the following example, **Nu** inherits from **Ni** but cannot access **cabbage**.
```
[Ni] {
    --- cabbage *{}
    ~ newNi *{
        \:cabbage;
    }
    +++ foo *{
        \:cabbage;
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage; @ Invalid; cabbage is invisible here
    }
}
```
It is not possible to access **cabbage** outside the class **Ni**, and it is also not possible to access **cabbage** for a different **[Ni]** object inside the class **Ni**.
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; cabbage is invisible here
    }
}

[Ni] {
    --- cabbage *{}
    ~ newNi *{
        \:cabbage;
    }
    +++ foo *{
        \:cabbage;
    }
    +++ bar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; inside the class Ni, but ni's cabbage method is invisible here
    }
    :: sha *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; inside the class Ni, but ni's cabbage method is invisible here
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage; @ Invalid; cabbage is invisible here
    }
}
```
Since **cabbage** can't be accessed inside the child class **Nu**, it is not possible to override **cabbage**.
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; cabbage is invisible here
    }
}

[Ni] {
    --- cabbage *{}
    ~ newNi *{
        \:cabbage;
    }
    +++ foo *{
        \:cabbage;
    }
    +++ bar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid, inside the class Ni, but ni's cabbage method is invisible here
    }
    :: sha *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; inside the class Ni, but ni's cabbage method is invisible here
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage;   @ Invalid; cabbage is invisible here
    }
    |--- cabbage *{} @ Invalid; cabbage is invisible here and thus cannot be overriden
}
```
If the visibility of **cabbage** is changed to **-+-** it gains type visibility. The change from **---** is that **cabbage** can now be accessed on any **[Ni]** object inside the **Ni** class.
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; cabbage is invisible here
    }
}

[Ni] {
    -+- cabbage *{}  @ (+ type visibility) cabbage now has type visibility
    ~ newNi *{
        \:cabbage;
    }
    +++ foo *{
        \:cabbage;
    }
    +++ bar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage method can be accessed due to type visibility
    }
    :: sha *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage method can be accessed due to type visibility
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage;   @ Invalid; cabbage is invisible here
    }
    |-+- cabbage *{} @ Invalid; cabbage is invisible here and thus cannot be overriden
}
```
If the visibility of **cabbage** is changed to **++-** it gains external visibility. The change from **-+-** is that **cabbage** can now be accessed on any **[Ni]** object outside the **Ni** class.
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage can now be accessed due to external visibility
    }
}

[Ni] {
    ++- cabbage *{}  @ (+ external visibility) cabbage now has external and type visibility
    ~ newNi *{
        \:cabbage;
    }
    +++ foo *{
        \:cabbage;
    }
    +++ bar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage;
    }
    :: sha *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage;
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage;   @ Invalid; cabbage is invisible here
    }
    |++- cabbage *{} @ Invalid; cabbage is invisible here and thus cannot be overriden
}
```
If the visibility of **cabbage** is changed to **+++** it gains inherited visibility. The change from **++-** is that **cabbage** can now be overriden and accessed inside a child, such as a **[Nu]** object.
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage;
    }
}

[Ni] {
    +++ cabbage *{}  @ (+ inherited visibility) cabbage now has external, type and inherited visibility
    ~ newNi *{
        \:cabbage;
    }
    +++ foo *{
        \:cabbage;
    }
    +++ bar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage;
    }
    :: sha *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage;
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage;   @ Now valid; cabbage is now visibile here due to inherited visibility
    }
    |+++ cabbage *{} @ Now valid; cabbage is now visibile here due to inherited visibility and thus can be overriden
}
```
When overriding an instance method, the visibility can be the same or more visible then before, but not less visible. In the following example, **cabbage1** and **cabbage2** are correctly overriden, but **cabbage3** and **cabbage4** are invalidly overriden because they are overriden with missing visibilities from the original methods.
```
[Ni] {
    ~ newNi *{}
    --+ cabbage1 *{}
    -++ cabbage2 *{}
    +-+ cabbage3 *{}
    +++ cabbage4 *{}
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    |+++ cabbage1 *{} @ Valid
    |-++ cabbage2 *{} @ Valid
    |-++ cabbage3 *{} @ Invalid; requires external visibility since cabbage3 from Ni has external visibility
    |+-+ cabbage4 *{} @ Invalid; requires type visibility since cabbage4 from Ni has type visibility
}
```
Most combinations of visibilities would not be used very often and dont usually need to be considered. The following are the most common:

+ **---** only allows access within the same object and class, it is similar to the private modifer in some other languages.
+ **+++** allows access everywhere, it is similar to the public modifer in some other languages.
+ **--+** allows access within the same object and child objects which inherit the method, it is similar to the protected modifer in some other languages.

There are some abbreviations avaliable:

+ **-** is an abbreviation for **---**
+ **+** is an abbreviation for **--+**
+ **++** is an abbreviation for **+++**


### Prologue Statements

A prologue statement allows prior statments to be written afterwards. A prologue statement is designated with an exclaimation mark (**!**). The following example uses **!** to designate the next statement as a prologue statment.
```
[] (Dog) {
    *{
        \elis:bark
            ! [Dog] elis = \[Dog]:newDog;
    }
}

[Dog] {
    ~ newDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}
```
Which is equivalent to:
```
[] (Dog) {
    *{
        [Dog] elis = \[Dog]:newDog;
        \elis:bark;
    }
}

[Dog] {
    ~ newDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}
```
A prologue statement can be a group of statements surrounded by **{}**.
```
[] (Dog) {
    *{
        \elis:bark
            !{
                [Dog] elis = \[Dog]:newDog;
                \elis:sleep;
                \elis:eat;
            }
    }
}

[Dog] {
    ~ newDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}
```
Which is equivalent to:
```
[] (Dog) {
    *{
        [Dog] elis = \[Dog]:newDog;
        \elis:sleep;
        \elis:eat;
        \elis:bark;
    }
}

[Dog] {
    ~ newDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}
```
A prologue statement can also be written at the end of a method body, which places it just before the statements in the method body.
```
[] (Dog) {
    *{
        \elis:bark;
        \jay:bark;
        \elma:bark;
    }
        !{
            [Dog] elis = \[Dog]:newDog;
            [Dog] jay = \[Dog]:newDog;
            [Dog] elma = \[Dog]:newDog;
        }
}

[Dog] {
    ~ newDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}
```
Which is equivalent to:
```
[] (Dog) {
    *{
        [Dog] elis = \[Dog]:newDog;
        [Dog] jay = \[Dog]:newDog;
        [Dog] elma = \[Dog]:newDog;
        \elis:bark;
        \jay:bark;
        \elma:bark;
    }
}

[Dog] {
    ~ newDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}
```
Prologue statements can be embedded in other prologue statements.
```
[] (Dog) {
    *{
        \elis:bark
            !{
                [Dog] elis = \[Dog]:newDog;
                \elis:sleep
                    ! \elis:eat;
            }
    }
}

[Dog] {
    ~ newDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}
```
Which is equivalent to:
```
[] (Dog) {
    *{
        [Dog] elis = \[Dog]:newDog;
        \elis:eat;
        \elis:sleep;
        \elis:bark;
    }
}

[Dog] {
    ~ newDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}
```
Declarations in prologue statements are only visible to the statement or group of statements which had **!** written after it. The following example is invalid becuase the local object **jay** is not visible to the statement **\jay:sleep;**.
```
[] (Dog) {
    *{
        \jay:bark   @ Valid; jay is visible here
            ! [Dog] jay = \[Dog]:newDog;
        \jay:sleep; @ Invalid; jay is not visible here
    }
}

[Dog] {
    ~ newDog *{}
    +++ sleep *{}
    +++ eat *{}
    +++ bark *{}
}
```


### Method Generics

Method generics allow the output type of a method to be based on the inputs. The following method **identity** simply returns the input as the output.
```
[] {
    *{
        [['A]->['A]] identity = *(['A] input)->['A] {} -> input;
    }
}
```
The type **['A]** represents a method generic type with the name **A**. **['A]** can represent any type. When **identity** is invoked, the type of **['A]** is determined and all **['A]**'s are replaced with this type. Thus when **identity** is invoked, the output type is determined by the input type. Following are some examples of invoking **identity**.
```
[] (Hammer, Saw, Cat) {
    *{
        [['A]->['A]] identity = *(['A] input)->['A] {} -> input;
        [Cat] cat = \[Cat]:newCat;
        [Saw] saw = \[Saw]:newSaw;
        [Hammer] hammer = \[Hammer]:newHammer;
        [Cat] theSameCat = \identity cat;
        [Saw] theSameSaw = \identity saw;
        [Hammer] theSameHammer = \identity hammer;
    }
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}

[Cat] {
    ~ newCat *{\$~newCat;}
}
```
Methods can have multiple method generic types. In the following example, the output type of **chooseFirstOption** is determined by the first input, and the output type of **chooseSecondOption** is determined by the second input.
```
[] (Hammer, Saw, Cat) {
    *{
        [['A]['B]->['A]] chooseFirstOption = *(['A] first, ['B] second)->['A] {} -> first;
        [['A]['B]->['B]] chooseSecondOption = *(['A] first, ['B] second)->['B] {} -> second;
        [Cat] cat = \[Cat]:newCat;
        [Saw] saw = \[Saw]:newSaw;
        [Hammer] hammer = \[Hammer]:newHammer;
        [Cat] theSameCat = \chooseFirstOption cat saw;
        [Saw] theSameSaw = \chooseSecondOption cat saw;
        [Hammer] theSameHammer = \chooseFirstOption hammer cat;
    }
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}

[Cat] {
    ~ newCat *{\$~newCat;}
}
```
A method can use the same method generic type multiple times, but the uses of the same method generic type must all have a common parent. In the following example, the output type of **chooseFirstOption** is determined by the common type of both inputs.
```
[] (Hammer, Saw, Cat) {
    *{
        [['A]['A]->['A]] chooseFirstOption = *(['A] first, ['A] second)->['A] {} -> first;
        [Cat] cat = \[Cat]:newCat;
        [Saw] saw = \[Saw]:newSaw;
        [Hammer] hammer = \[Hammer]:newHammer;
        [Cat] theSameCat = \chooseFirstOption cat saw;          @ Invalid; [Saw] is not a [Cat], ['A] cant be determined
        [Tool] theSameSaw = \chooseFirstOption saw hammer;      @ Valid; [Tool] is a common type between [Saw] and [Hammer], ['A] is [Tool]
        [Hammer] theSameHammer = \chooseFirstOption hammer saw; @ Invalid; ['A] is [Tool], therefore the output type is [Tool] not [Hammer]
    }
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}

[Cat] {
    ~ newCat *{\$~newCat;}
}
```
Method generic types can be used in lambda object inputs. In the following example, **invokeLambda** invokes a lambda object **inputLambda** and returns the result.
```
[] (Hammer, Saw, Cat) {
    *{
        [[->['A]]->['A]] invokeLambda = *([->['A]] inputLambda)->['A] {
                ['A] result = \inputLambda;
            } -> result;

        [->[Cat]] createACat = *->[Cat] {} -> \[Cat]:newCat;
        [->[Saw]] createASaw = *->[Saw] {} -> \[Saw]:newSaw;
        [->[Hammer]] createAHammer = *->[Hammer] {} -> \[Hammer]:newHammer;

        [Cat] cat = \invokeLambda createACat;
        [Cat] aSecondCat = \invokeLambda createACat;
        [Saw] saw = \invokeLambda createASaw;
        [Hammer] hammer = \invokeLambda createAHammer;
    }
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}

[Cat] {
    ~ newCat *{\$~newCat;}
}
```
Consider the tuple class used previously.
```
[Tuple < FIRST, SECOND > ]
    [&FIRST] first
    [&SECOND] second
{
    ~ newTuple *([&FIRST] firstInput, [&SECOND] secondInput) {
        .first = firstInput;
        .second = secondInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second
}
```
Method generic types can be used for methods inside a class. The instance method **changeFirst** is added, which returns a new **[Tuple]** with the first object replaced with the input.
```
[Tuple < FIRST, SECOND > ]
    [&FIRST] first
    [&SECOND] second
{
    ~ newTuple *([&FIRST] firstInput, [&SECOND] secondInput) {
        .first = firstInput;
        .second = secondInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second

    +++ changeFirst *(['NEW_FIRST] newFirst) -> [Tuple<['NEW_FIRST][&SECOND]>] {
    } -> \[Tuple<['NEW_FIRST][&SECOND]>]:newTuple newFirst .second
}
```
The following example demostrates the use of **changeFirst**, changing **hammerAndSaw** into **catAndSaw**.
```
[] {
    *{
        [Hammer] hammer = \[Hammer]:newHammer;
        [Saw] saw = \[Saw]:newSaw;
        [Tuple<[Hammer][Saw]>] hammerAndSaw = \[Tuple<[Hammer][Saw]>]:newTuple hammer saw;
        [Cat] cat = \[Cat]:newCat;
        [Tuple<[Cat][Saw]>] catAndSaw = \hammerAndSaw:changeFirst cat;
    }
}

[Tuple < FIRST, SECOND > ]
    [&FIRST] first
    [&SECOND] second
{
    ~ newTuple *([&FIRST] firstInput, [&SECOND] secondInput) {
        .first = firstInput;
        .second = secondInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second

    +++ changeFirst *(['NEW_FIRST] newFirst) -> [Tuple<['NEW_FIRST][&SECOND]>] {
    } -> \[Tuple<['NEW_FIRST][&SECOND]>]:newTuple newFirst .second
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}

[Cat] {
    ~ newCat *{\$~newCat;}
}
```
In the following example, we add a similar method called **changeSecond**, and change **catAndSaw** into **catAndHammer**.
```
[] {
    *{
        [Hammer] hammer = \[Hammer]:newHammer;
        [Saw] saw = \[Saw]:newSaw;
        [Tuple<[Hammer][Saw]>] hammerAndSaw = \[Tuple<[Hammer][Saw]>]:newTuple hammer saw;
        [Cat] cat = \[Cat]:newCat;
        [Tuple<[Cat][Saw]>] catAndSaw = \hammerAndSaw:changeFirst cat;
        [Tuple<[Cat][Hammer]>] catAndHammer = \hammerAndSaw:changeSecond hammer;
    }
}

[Tuple < FIRST, SECOND > ]
    [&FIRST] first
    [&SECOND] second
{
    ~ newTuple *([&FIRST] firstInput, [&SECOND] secondInput) {
        .first = firstInput;
        .second = secondInput;
    }
    +++ getFirst *->[&FIRST]{}->.first
    +++ getSecond *->[&SECOND]{}->.second

    +++ changeFirst *(['NEW_FIRST] newFirst) -> [Tuple<['NEW_FIRST][&SECOND]>] {
    } -> \[Tuple<['NEW_FIRST][&SECOND]>]:newTuple newFirst .second

    +++ changeSecond *(['NEW_SECOND] newSecond) -> [Tuple<[&FIRST]['NEW_SECOND]>] {
    } -> \[Tuple<[&FIRST]['NEW_SECOND]>]:newTuple .first newSecond
}

[Tool] {
    ~ newTool *{}
}

[Hammer] (Tool) {
    ~ newHammer *{\$~newTool;}
}

[Saw] (Tool) {
    ~ newSaw *{\$~newTool;}
}

[Cat] {
    ~ newCat *{\$~newCat;}
}
```

In summary:

+ A method can have any number of method generic types.
+ Method generic types can be used in the input and output of a method.
+ When a method is invoked, the method generic types are determined by the input types.
+ Method generic types can be used to dynamically choose the output type when a method is invoked.





## Specialised Topics



### Anonymous Class Objects

An anonymous class object is created from an existing class, but where instance methods can be overriden for the new object.

not isolated from the outside world

An anonymous class is a class with no name, only one constructor, inherits from one or more parents and can override and implement instance methods. An anonymous class object creates a new object from an anonymous class which inherits from other classes, but does not

```
[] (Animal) {
    *{
        [Animal] aDog = [:[Animal]] {
                \$~newAnimal;
                \:sleep;
                |+++ makeNoise *{
                    \:bark;
                }
                |+++ eat *{
                    \:eatDogFood;
                }
                - bark *{}
                - eatDogFood *{}
            }

        [Animal] aBird = [:[Animal]] {
                \$~newAnimal;
                \:tweet;
                |+++ makeNoise *{
                    \:tweet;
                }
                |+++ eat *{
                    \:eatBirdFood;
                }
                - tweet *{}
                - eatBirdFood *{}
            }
    }
}

[Animal] {
    ~ newAnimal *{}
    +++ makeNoise *{}
    +++ eat *{}
    +++ sleep *{}
}
```


### Compiler Injections


### Compound Expressions and Statements
=Compound Expressions and Statements
group of statements


### Constructors

#### Invoking Self Constructors

#### Using Multiple Constructors

#### Pointer Constructors

#### Statement Order and Execution in Constructors


### Data Segments


### Disjoint Types


### Flexible Method Expression
=Flexible Method Expression
flexibal method bodies, class method definitions, entry point definitions
Lambda methods (reffering to instance type and constructors and how they become lambdas)
self references and parent references in lambdas or as lambdas


### Generic Specialisation

#### Method Generic Specialisation

#### Class Generic Specialisation


### Inheriting from Types with Generics
=Inheriting from Types with Generics
overriding
parent generic type
overriding with parent generic type


### Lexical Splitter


### Overloading Class Methods


### Parent and Child Method Types
=Parent and Child Method Types
including overriding with child method types


### Partial Class Implementations

#### Unimplemented Class Methods

#### Assigning Class Methods in Constructors


### Resolving Conflicts of Multiple Inheritance
=Resolving Conflicts of Multiple Inheritance
disjoint types as output object, one function to join multiple


### Root Type


### Self Reference


### Type Inference

#### Type Inference of Method Outputs

#### Type Inference of Assignments

#### Parent Context Type

#### Self Context Type


### Type Casting


### Subtleties of Visibility in Classes with Generics
=Subtleties of Visibility in Classes with Generics
type visibility


### Variables and Mutability
lack of these in lanugaue level


### Visibility of Constructor and Type Methods


### Void Identifier





---
***

