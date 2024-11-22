# Daina


# Index


* [Introduction to Daina](#introduction-to-daina)


* [Tutorial](#tutorial)

    + [Comments](#comments)
    + [Entry Point of a Program](#entry-point-of-a-program)
    + [Classes, Types, Objects and Dependancies](#classes-types-objects-and-dependancies)
    + [Inheritance](#inheritance)
    + [Methods and Lambdas](#methods-and-lambdas)
    + [Constructors, Instance Methods and Type Methods](#constructors-instance-methods-and-type-methods)
    + [Instance Method Visibility](#instance-method-visibility)
    + [Class Generics](#class-generics)
    + [Prologue Statements](#prologue-statements)
    + [Method Generics](#method-generics)

* [Specialised Topics](#specialised-topics)

    + [Anonymous Class Objects](#anonymous-class-objects)
    + [Compiler Injections](#compiler-injections)
    + [Compound Expressions and Statements](#compound-expressions-and-statements)
    + [Constructors](#constructors)
        - [Using Multiple Constructors](#using-multiple-constructors)
        - [Invoking Self Constructors](#invoking-self-constructors)
        - [Pointer Constructors](#pointer-constructors)
        - [Statement Ordering in Constructors](#statement-ordering-in-constructors)
    + [Data Segments](#data-segments)
    + [Disjoint Types](#disjoint-types)
    + [Duplicate Inheritance](#duplicate-inheritance)
    + [Flexible Method Expression](#flexible-method-expression)
    + [Inheriting from Types with Generics](#inheriting-from-types-with-generics)
    + [Lexical Splitter](#the-lexical-splitter)
    + [Literals](#literals)
    + [Object Proxy](#object-proxy)
    + [Overloading and Underloading](#overloading-and-underloading)
        - [Overloading Class Methods](#overloading-class-methods)
        - [Underloading Class Methods](#underloading-class-methods)
    + [Parent and Child Lambda Types](#parent-and-child-lambda-types)
    + [Partial Class Implementations](#partial-class-implementations)
        - [Unimplemented Instance Methods](#unimplemented-instance-methods)
        - [Assigning Instance Methods in Constructors](#assigning-instance-methods-in-constructors)
    + [Rising and Falling Generics](#rising-and-falling-generics)
    + [Root Type](#root-type)
    + [Self Reference](#self-reference)
    + [Type Inference](#type-inference)
        - [Type Inference of Method Outputs](#type-inference-of-method-outputs)
        - [Type Inference of Assignments](#type-inference-of-assignments)
        - [Type Inference of Class Generics](#type-inference-of-class-generics)
        - [Type Inference of Unimplemented Class Methods](#type-inference-of-unimplemented-class-methods)
        - [Parent Context Type](#parent-context-type)
        - [Self Context Type](#self-context-type)
    + [Type Casting](#type-casting)
    + [Scope](#scope)
    + [Variables and Mutability](#variables-and-mutability)
    + [Visibility and Inheritance of Constructors and Type Methods](#visibility-and-inheritance-of-constructors-and-type-methods)
    + [Void Identifier](#void-identifier)

* [Grammar](#grammar)

    + [Whitespace](#whitespace)
    + [Composite Tokens](#composite-tokens)
        - [Data Segment Anchor](#data-segment-anchor)
        - [Identifier](#identifier)
        - [Parent Identifier](#parent-identifier)
    + [Simple Tokens](#simple-tokens)
        - [Ampersand](#ampersand), [Apostrophe](#apostrophe), [Arrow](#arrow), [Arrow Brackets](#arrow-brackets), [Asterisk](#asterisk), [Backslash](#backslash), [Backtick](#backtick), [Caret](#caret), [Colon](#colon), [Comma](#comma), [Curly Brackets](#curly-brackets), [Double Colon](#double-colon), [Double Pipe](#double-pipe), [Double Strudel](#double-strudel), [Equals Sign](#equals-sign), [Exclamation Mark](#exclamation-mark), [Forward Slash](#forward-slash), [Full Stop](#full-stop), [Method Visibility Indicators](#method-visibility-indicators), [Percent Sign](#percent-sign), [Pipe](#pipe), [Question Mark](#question-mark), [Round Brackets](#round-brackets), [Semicolon](#semicolon), [Square Brackets](#square-brackets), [Strudel](#strudel), [Tilde](#tilde), [Triple Less Than](#triple-less-than)
    + [Syntax](#syntax)
        - [Root](#root)
        - [Lexical Splitter](#lexical-splitter)
        - [Mutiline Comment](#mutiline-comment)
        - [Singleline Comment](#singleline-comment)
        - [Class](#class)
        - [Entry Point Class](#entry-point-class)
        - [Generic Declaration List](#generic-declaration-list)
        - [Type](#type)
        - [Dependancy Structure](#dependancy-structure)
        - [Object Declaration](#object-declaration)
        - [Class Method](#class-method)
        - [Compiler Injection](#compiler-injection)
        - [Expression](#expression)
        - [Internal Context Identifier](#internal-context-identifier)
        - [Data Segment](#data-segment)
        - [Assignment Statement](#assignment-statement)
        - [Statement Body](#statement-body)
        - [Method Expression](#method-expression)
        - [Method Invocation](#method-invocation)
        - [Internal Instance Method](#internal-instance-method)
        - [Internal Instance Object](#internal-instance-object)
        - [Anonymous Class Object](#anonymous-class-object)
        - [Prologue Statement](#prologue-statement)
        - [Statement](#statement)
    + [Syntax Summary](#syntax-summary)



---

# Introduction to Daina

Foundationally objects, methods and classes

Goals
- Object oriented language with objects, inheritence and polymorphism
- Language with:
  + Inheritance and polymorphism
  + Lambda functions
  + Objects and types
- No invalid memory or state, and no undefined behaviour
- Minimal number of language constructions whilst maximising flexibility in patterns of logic
- Syntax with no keywords, instead using 1 or 2, 3 character tokens
- literals explicitly seperated from the language
- Minimise abiguity .....
- no invalid inheritances/no invalid disjoijnt types
- emergent complexity but not definitional  complexity
- no fail syntax always solutions, i.e. no fail multi inheritance
- allow 'transformations of' abstractions as much as possible i.e. prevent as few as possble
- can known entrie language (small set of things) means less mistakes and unknowns
- have no or few exceptions for constructs^

```

class
object
method
data segment
compiler injection



ss
always give syntax breakdown
wrap ne wparts of code with start and end
+signify, +the body is empty for now
introduction to language, aim of lanuage and how it is designed, any influences from other languages, using symbols rather then words



minimal constructions and varience while holding a minimal fucntionality, putting functionality into libraries and class definitions rather then base language
very strict typing so that there is no null or invalid objects, and all object types are correct garenteed, no downcasting, whilst retaining enough flexibility in types so that various structures and logics can be implemented
using symbols rather then words to minimise footprint of lanuage and accentuate the defined types, objects methods etc.
Daina is not useful for low level programming such as microcontrollers, memory menagement etc systems programming, or 
```

---

# Tutorial

## Comments
```
@ This is a single line comment that will be ignored in the code
```
```
@@
    This is a multiline comment
    that will be ignored in the code
@@
```

## Entry Point of a Program
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

## Classes, Types, Objects and Dependancies
The following example shows the minimal definition of a class called **ClassA**. **ClassA** is the identifier of the class and is written between **[ ]** brackets. An identifier is comprised of one or more alpha numeric characters or underscores (examples: ClassA, Foo1, 12Foo, _foo, 123, 2_foo_1).
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

No circular dependancies are allowed. Therefore the following example is invalid because **ClassA** depends on **ClassC**, which depends on **ClassB**, which depends on **ClassA**...
```
[ClassA] (ClassC) {} @ Invalid; ClassA is depending on itself through ClassC

[ClassB] (ClassA) {}

[ClassC] (ClassB) {}
```
A reverse dependancy list restricts which classes depend on the given class. In the following example, **ClassA** can only be depended apon by **ClassB**.
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
A class can only reference other classes it depends on, **ClassC** can make references to both **ClassA** and **ClassB**. But this does not mean that **ClassA** and **ClassB** can make references to **ClassC**. For example, adding the following **cObject** to **ClassB** is invalid:
```
[ClassA] {}

[ClassB] 
    [ClassC] cObject @ Invalid; ClassB does not depend on ClassC
{
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
{
}
```
The type of **aObject** is declared to be **[ClassA]**. Types are used to classify objects. A second instance object **bObject** of type **[ClassB]** is added. Instance objects are always written before the body of the class.
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

+ **.aObject** refers to the instance object **aObject** (a full stop is used to refer to an instance object defined within the class). This is similar to other languages which would refer to **self.aObject** or **this.aObject**.
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


+ **.aObject** refers to the instance object **aObject** (a full stop is used to refer to an instance object defined within the class). This is similar to other languages which would refer to **self.aObject** or **this.aObject**.
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

## Inheritance

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
**[Dog]** has instance methods **sleep**, **eat**, **bark** and a constructor **createDog**. **[Bird]** has instance methods **sleep**, **eat**, **chirp** and a constructor **createBird**. In the entry point method we create a **[Dog]** **muffles**, a **[Bird]** **chandler**, and invoke some instance methods of **muffles** and **chandler**.
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
Writing **:[Animal]** after the name of a class means that the class will inherit the methods from **[Animal]**, we say that **[Animal]** is a parent of **[Dog]** and **[Dog]** is a child of **[Animal]**. So **Dog** and **Bird** are both inheriting the instance methods **sleep** and **eat** from **[Animal]**. For example when **\muffles:sleep;** is executed, the **sleep** instance method from **[Animal]** is invoked on **muffles** and when **\chandler:sleep;** is executed, the same instance method is invoked on **chandler**. 

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
        \$eat;
    }
    @@ overriden eat instance method ends here @@
}
```
Breaking down the new **eat** method:
```
|+++ eat *{
    \:chirp;
    \$eat;
}
```

+ **|** is used to signify overriding an instance method.
+ **:chirp** refers to the instance method called **chirp** within the enclosing class. **\\:chirp;** invokes **chirp** on the same object as the enclosing method. In other languages, this is sometimes refered to as calling a method on self and might be written as **self.chirp()** or **this.chirp()**.
+ **$eat** refers to the instance method called **eat** within the parent class. **\\$eat;** invokes the **eat** method from **Animal** on the same object as the enclosing method. In other languages, this is sometimes refered to as calling a method on super and might be written as **super.eat()**.

When **\chandler:eat;** is executed, instead of invoking the instance method **eat** from **[Animal]**, the **eat** method from **Bird** is invoked. Nothing has changed for the statement **\muffles:eat;**, the same instance method **eat** from **[Animal]** is invoked on **muffles**.

Since **[Dog]** is inheriting from **[Animal]** and thus **[Animal]** is a parent of **[Dog]**, an object of type **[Dog]** is considered to also be an object of type **[Animal]**. And similarly a **[Bird]** is also an object of type **[Animal]**. In the following example, the declared type of **muffles** and **chandler** is changed to **[Animal]**
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
        \$eat;
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
        \$eat;
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
        \$eat;
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

A class can inherit from more then one other class. In the following example, the **eat** and **sleep** instance methods have been taken from **Animal** and put into new classes **HungryCreature** and **SleepyCreature**. The **Animal** class inherits from both **[HungryCreature]** and **[SleepyCreature]**.
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
        \$eat;
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


Inputs and outputs will be described later, but it is important to note here; output and input types must match when overriding a method. The following example shows valid and invalid overrides for a **sleep** method with an output and an **eat** method with inputs: 
```
[Animal] (Food, Time) {
    +++ sleep *() -> [Time] {} -> \[Time]:tenMinutes
    +++ eat *([Food] food, [Time] timeToEat) {}
}

[Dog :[Animal]] (Animal, Food, Time) {
    |+++ sleep *() -> [Time] {} -> \$sleep              @ Valid override
    |+++ eat *([Food] food, [Time] foodEatingTime) {}   @ Valid override
}

[Bird :[Animal]] (Animal, Food, Time) {
    |+++ sleep *{}                                      @ Invalid override; [Time] output is required
    |+++ eat *([Time] foodEatingTime, [Food] food) {}   @ Invalid override; [Food],[Time] inputs are required but [Time],[Food] were provided
}

[Food] {}

[Time] {
    ~ tenMinutes *{}
}
```

The properties of parent types are transitive. In other words, if **[A]** is a parent of **[B]** and **[B]** is a parent of **[C]**, then **[A]** is a parent of **[C]**. In the following example, **[HungryCreature]** and **[SleepyCreature]** are parents of **[Animal]**, **[Animal]** is a parent of **[Dog]**, thus a **[Dog]** is a **[HungryCreature]** and a **[SleepyCreature]**.
```
[] (Dog, HungryCreature, SleepyCreature) {
    *{
        [HungryCreature] dogA = \[Dog]:createDog;
        [SleepyCreature] dogB = \[Dog]:createDog;
    }
}

[Dog :[Animal]] (Animal) {
    ~ createDog *{
        \$~createAnimal;
    }
}

[Animal :[HungryCreature] :[SleepyCreature]] (SleepyCreature, HungryCreature) {
    ~ createAnimal *{
        \$~createHungryCreature;
        \$$~createSleepyCreature;
    }
}

[HungryCreature] {
    ~ createHungryCreature *{}
}

[SleepyCreature] {
    ~ createSleepyCreature *{}
}
```


In summary:

+ Inheritance can be used to copy all the methods from an existing class into a new class.
+ A class can inherit from multiple parent classes.
+ Within a constructor, a constructor from each inherited parent must be invoked.
+ An object can be represented as any of its parent types.
+ Instance methods copied from a parent can be overriden.
+ Output and input types must match when overriding a method.

## Methods and Lambdas

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

There are many type of methods which can be expressed, here are just a few more examples:

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
It is important to note; the output expression is always evaluated when the method expression is invoked, it is never evaluated when the method is defined. In other words, the output is expression is bound to the method.


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


## Constructors, Instance Methods and Type Methods

There are three kinds of methods that can be attached to a class; constructors, instance methods and type methods. As a collective, these kind of methods are called class methods.

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
3. A method described by the method syntax. In this case the method takes an input **hatInput** and assigns it as the instance object **hat**.

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
3. A method described by the method syntax. In this case the method returns the **hat** instance object.

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
3. A method described by the method syntax. In this case the method takes an input **hat** and returns a new **[HatContainer]** containing **hat**.

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



## Instance Method Visibility

The visibility of an instance method determines in which contexts it can be invoked. Some other languages with this concept have keywords such as 'public', 'private' and 'protected' to determine in which parts of the code can a given instance method be accessed. An instance method has three aspects of visibility that can be set independantly:

+ Externally (can be either visible or invisible)
+ Class (can be either visible or invisible)
+ Inherited (can be either visible or invisible)

The instance method visibility is indicated with three **+** (meaning visible) or **-** (meaning hidden); for external visibility, class visibility and inherited visibility respectively. Following are eight example instance methods showing all possible combinations of visibility.
```
[VisibilityExamples] {
    --+ fooA *{} @ fooA is externally invisible, class invisible and inherited visibly
    -+- fooB *{} @ fooB is externally invisible, class visible and inherited invisibly
    +-- fooC *{} @ fooC is externally visible, class invisible and inherited invisibly
    +++ fooD *{} @ fooD is externally visible, class visible and inherited visibly
    --- fooE *{} @ fooE is externally invisible, class invisible and inherited invisibly
    ++- fooF *{} @ fooF is externally visible, class visible and inherited invisibly
    +-+ fooG *{} @ fooG is externally visible, class invisible and inherited visibly
    -++ fooH *{} @ fooH is externally invisible, class visible and inherited visibly
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
It is not possible to access **cabbage** outside the class **Ni**, and it is also not possible to access **cabbage** for a different **[Ni]** object inside the class **Ni**:
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
        \:cabbage;   @ Invalid; cabbage is invisible here
    }
    :: nar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; cabbage is invisible here
    }
}
```
Since **cabbage** can't be accessed inside the child class **Nu**, it is not possible to override **cabbage**:
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
    :: nar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; cabbage is invisible here
    }
    |--- cabbage *{} @ Invalid; cabbage is invisible here and thus cannot be overriden
}
```
If the visibility of **cabbage** is changed to **-+-** it gains class visibility. The change from **---** is that **cabbage** can now be accessed on any **[Ni]** object inside the **Ni** class:
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; cabbage is invisible here
    }
}

[Ni] {
    -+- cabbage *{}  @ (+ class visibility) cabbage now has class visibility
    ~ newNi *{
        \:cabbage;
    }
    +++ foo *{
        \:cabbage;
    }
    +++ bar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage method can be accessed due to class visibility
    }
    :: sha *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage method can be accessed due to class visibility
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage;   @ Invalid; cabbage is invisible here
    }
    :: nar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid; cabbage is invisible here
    }
    |-+- cabbage *{} @ Invalid; cabbage is invisible here and thus cannot be overriden
}
```
If the visibility of **cabbage** is changed to **++-** it gains external visibility. The change from **-+-** is that **cabbage** can now be accessed on any **[Ni]** object outside the **Ni** class:
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage can now be accessed due to external visibility
    }
}

[Ni] {
    ++- cabbage *{}  @ (+ external visibility) cabbage now has external and class visibility
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
    :: nar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage can now be accessed due to external visibility
    }
    |++- cabbage *{} @ Invalid; cabbage is invisible here and thus cannot be overriden
}
```
If the visibility of **cabbage** is changed to **+++** it gains inherited visibility. The change from **++-** is that **cabbage** can now be overriden and accessed inside a child, such as a **[Nu]** object:
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage;
    }
}

[Ni] {
    +++ cabbage *{}  @ (+ inherited visibility) cabbage now has external, class and inherited visibility
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
        \:cabbage;   @ Now valid; cabbage is now visible here due to inherited visibility
    }
    :: nar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage;
    }
    |+++ cabbage *{} @ Now valid; cabbage is now visible here due to inherited visibility and thus can be overriden
}
```


If an inherited method lacks inherited visibility, then it cannot be accessed inside or outside the class. In the following example, the class **Nu** inherits instance method **cabbage** which has both external and class visibility, however it cannot be invoked on a **[Nu]** object because it does not have inherited visibility.
```
[] (Nu) {
    *{
        [Nu] nu = \[Nu]:newNu;
        \nu:cabbage; @ Invalid; nu's cabbage is invisible here outside the Nu class (requires external and inherited visibility)
    }
}

[Ni] {
    ++- cabbage *{}  @ cabbage has external and class visibility
    ~ newNi *{}
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    :: nar *{
        [Nu] nu = \[Nu]:newNu;
        \nu:cabbage; @ Invalid; nu's cabbage is invisible here inside the Nu class (requires class and inherited visibility)
    }
}
```
In the following example, the **[Nu]** objects are reassigned as **[Ni]** objects on which the **cabbage** instance method can be invoked because it has external and class visibility.
```
[] (Nu) {
    *{
        [Nu] nu = \[Nu]:newNu;
        \nu:cabbage; @ Invalid; nu's cabbage is invisible here outside the Nu class (requires external and inherited visibility)
        [Ni] ni = nu;
        \ni:cabbage; @ Valid; ni's cabbage is visible here (due to external visibility)
    }
}

[Ni] {
    ++- cabbage *{}  @ cabbage has external and class visibility
    ~ newNi *{}
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    :: nar *{
        [Nu] nu = \[Nu]:newNu;
        \nu:cabbage; @ Invalid; nu's cabbage is invisible here inside the Nu class (requires class and inherited visibility)
        [Ni] ni = nu;
        \ni:cabbage; @ Valid; ni's cabbage is visible here (due to class visibility)
    }
}
```



If an inherited method has class and inherited visibility but not external visibility, then it can be accessed inside the class but not outside the class. In the following example, the class **Nu** inherits instance method **cabbage** which has both class and inherited visibility and so it can be invoked on a **[Nu]** object inside the **Nu** class but not outside the **Nu** class.
```
[] (Nu) {
    *{
        [Nu] nu = \[Nu]:newNu;
        \nu:cabbage; @ Invalid; nu's cabbage is invisible here outside the Nu class (requires external and inherited visibility)
    }
}

[Ni] {
    -++ cabbage *{}  @ cabbage has class and inherited visibility
    ~ newNi *{}
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    :: nar *{
        [Nu] nu = \[Nu]:newNu;
        \nu:cabbage; @ Valid; nu's cabbage is visible here inside the Nu class (due to class and inherited visibility)
    }
}
```
If an inherited method has external and inherited visibility but not class visibility, then it can be accessed outside the class but not inside the class. In the following example, the class **Nu** inherits instance method **cabbage** which has both external and inherited visibility and so it can be invoked on a **[Nu]** object outside the **Nu** class but not inside the **Nu** class.
```
[] (Nu) {
    *{
        [Nu] nu = \[Nu]:newNu;
        \nu:cabbage; @ Valid; nu's cabbage is invisible here outside the Nu class (due to external and inherited visibility)
    }
}

[Ni] {
    +-+ cabbage *{}  @ cabbage has class and inherited visibility
    ~ newNi *{}
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    :: nar *{
        [Nu] nu = \[Nu]:newNu;
        \nu:cabbage; @ Invalid; nu's cabbage is invisible here inside the Nu class (requires class and inherited visibility)
    }
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
    |+-+ cabbage4 *{} @ Invalid; requires class visibility since cabbage4 from Ni has class visibility
}
```
A method without inherited visibility cannot be overriden, however it will not conflict with methods in a child class. In the following example, **cabbage1**, **cabbage2** **cabbage3** and **cabbage4** are implemented again in **Nu** but do not conflict with the original methods.
```
[Ni] {
    ~ newNi *{}
    ++- cabbage1 *{}
    +-- cabbage2 *{}
    -+- cabbage3 *{}
    --- cabbage4 *{}
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    --- cabbage1 *{} @ Valid; no conflict
    +++ cabbage2 *{} @ Valid; no conflict
    --+ cabbage3 *{} @ Valid; no conflict
    +-+ cabbage4 *{} @ Valid; no conflict
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


## Class Generics


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

[Apple :[Fruit]] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana :[Fruit]] (Fruit) {
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

[Apple :[Fruit]] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana :[Fruit]] (Fruit) {
    ~ newBanana *{\$~newFruit;}
}

[Grape :[Fruit]] (Fruit) {
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

[Apple :[Fruit]] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana :[Fruit]] (Fruit) {
    ~ newBanana *{\$~newFruit;}
}

[Grape :[Fruit]] (Fruit) {
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
For a type of the **Tuple** class to be a parent, every generic instantiation must be a parent or equivalent. So for example, **[Tuple<[Fruit][Apple]>]** is not a parent or child type of **[Tuple<[Apple][Fruit]>]**, because **[Fruit]** is a parent of **[Apple]** but **[Apple]** is not a parent of **[Fruit]**. Following are some invalid assignments added alongside the previous examples.
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

[Apple :[Fruit]] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana :[Fruit]] (Fruit) {
    ~ newBanana *{\$~newFruit;}
}

[Grape :[Fruit]] (Fruit) {
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

[Apple :[Fruit]] (Fruit) {
    ~ newApple *{\$~newFruit;}
}

[Banana :[Fruit]] (Fruit) {
    ~ newBanana *{\$~newFruit;}
}

[Grape :[Fruit]] (Fruit) {
    ~ newGrape *{\$~newFruit;}
}
```

It is possible to inherit from classes which use class generics. When inheriting with class generics, all the generics must be instantiated the same as when using class generics outside of inheritance. In the following example, **UnwrapPresent** inherits from **[Transformation<[Wrapped<[Present]>][Present]>]** and therefore **[Transformation<[Wrapped<[Present]>][Present]>]** is a parent type of **[UnwrapPresent]**.
```
[] (Transformation, Wrapped, UnwrapPresent, Present) {
    *{
        [Present] originalPresent = \[Present]:new;
        [Wrapped<[Present]>] wrappedPresent = \[Wrapped<[Present]>]:wrap originalPresent;
        [Transformation<[Wrapped<[Present]>][Present]>]] unwrapPresent = \[UnwrapPresent]:new;
        [Present] unwrappedPresent = \unwrapPresent wrappedPresent;
    }
}

[UnwrapPresent :[Transformation<[Wrapped<[Present]>][Present]>]] (Transformation, Wrapped, Present) {

    ~ new *{
        \$~as *([Wrapped<[Present]>] wrappedPresent) -> [Present] {
            [Present] present = \wrappedPresent:getInnerObject;
        } -> present;
    } 
}

[Transformation<A,B>] 
    [[&A]->[&B]] transform
{
    ~ as *([[&A]->[&B]] transform) {
        .transform = transform;
    }

    ++ transform *([&A] a) -> [&B] {} -> \.transform a
}

[Wrapped< E >] 
    [&E] innerObject
{
    ~ wrap *([&E] object) {
        .innerObject = object;
    }

    getInnerObject *->[&E] {} -> innerObject
}

[Present] {
    ~ new *{}
}
```
When the constructor **as** is invoked inside the class **UnwrapPresent**, the input parameter type is **[[Wrapped<[Present]>]->[Present]]** since **[&A]** was instantiated to **[Wrapped<[Present]>]** and **[&B]** to **[Present]**.

Generic types from the inheriting class can be used in the generic type instantiation of the inherited class. **UnwrapPresent** is modified to become **Unwrap< E >** with the generic type **[&E]** replacing **[Present]**: 
```
[] (Transformation, Wrapped, Unwrap, Present, Apple) {
    *{
        [Present] originalPresent = \[Present]:new;
        [Wrapped<[Present]>] wrappedPresent = \[Wrapped<[Present]>]:wrap originalPresent;
        [Transformation<[Wrapped<[Present]>][Present]>]] unwrapPresent = \[Unwrap<[Present]>]:new;
        [Present] unwrappedPresent = \unwrapPresent wrappedPresent;

        [Apple] originalApple = \[Apple]:new;
        [Wrapped<[Apple]>] wrappedApple = \[Wrapped<[Apple]>]:wrap originalApple;
        [Transformation<[Wrapped<[Apple]>][Apple]>]] unwrapApple = \[Unwrap<[Apple]>]:new;
        [Apple] unwrappedApple = \unwrapApple wrappedApple;
    }
}

[Unwrap< E > :[Transformation<[Wrapped<[&E]>][&E]>]] (Transformation, Wrapped) {

    ~ new *{
        \$~as *([Wrapped<[&E]>] wrappedObject) -> [&E] {
            [&E] innerObject = \wrappedPresent:getInnerObject;
        } -> innerObject;
    } 
}

[Transformation<A,B>] 
    [[&A]->[&B]] transform
{
    ~ as *([[&A]->[&B]] transform) {
        .transform = transform;
    }

    ++ transform *([&A] a) -> [&B] {} -> \.transform a
}

[Wrapped< E >] 
    [&E] innerObject
{
    ~ wrap *([&E] object) {
        .innerObject = object;
    }

    getInnerObject *->[&E] {} -> innerObject
}

[Present] {
    ~ new *{}
}

[Apple] {
    ~ new *{}
}
```
A class type of the inheriting class itself can be used in the generic type instantiation of the inherited class. In the following example, **Boolean** inherits from **[Comparable<[Boolean]>]** and overrides an instance method **compareTo**.
```
[] (Boolean, Comparable, ComparisonResult) {
    *{
        [Boolean] true = \[Boolean]:true;
        [Boolean] false = \[Boolean]:false;
        [ComparisonResult] result = \true:compareTo false;
    }
}

[Boolean :[Comparable<[Boolean]>]] (Comparable, ComparisonResult) 
    [['A]['A]->['A]] ifTrueIfFalse
{
    ~ true *{
        .ifTrueIfFalse = *(['A] ifTrue, ['A] ifFalse) -> ['A] {} -> ifTrue;
        \$~new;
    }

    ~ false *{
        .ifTrueIfFalse = *(['A] ifTrue, ['A] ifFalse) -> ['A] {} -> ifFalse;
        \$~new;
    }

    ++ ifTrueIfFalse *(['A] ifTrue, ['A] ifFalse) -> ['A] {
    } -> \.ifTrueIfFalse ifTrue ifFalse


    |++ compareTo *([Boolean] otherBoolean) -> [ComparisonResult] {
    } -> (\otherBoolean:ifTrueIfFalse (\:ifTrueIfFalse eq notEq) (\:ifTrueIfFalse notEq eq))
        !{
            [ComparisonResult] eq = \[ComparisonResult]:equal;
            [ComparisonResult] notEq = \[ComparisonResult]:notEqual;
        }
}


[Comparable<A>] (ComparisonResult) {
    ~ new *{}
    ++ compareTo *([&A] a) -> [ComparisonResult] {} -> \[ComparisonResult]:unknown
}

[ComparisonResult] {
    ~ equal *{}
    ~ notEqual *{}
    ~ unknown *{}
}
```
Complex compound types can be used in the generic instantiation of the inherited type. In the following example, **FunctionComposition< D, E, F >** inherits from **[Transformation<[[&E]->[&F]][[&D]->[&F]]>]**.
```
[FunctionComposition< D, E, F > :[Transformation<[[&E]->[&F]][[&D]->[&F]]>]] (Transformation) {

    ~ as *([[&D]->[&E]] function) {
        \$~as *([[&E]->[&F]] composingFunction) -> [[&D]->[&F]] {
            [[&D]->[&F]] finalFunction = *([&D] d) -> [&F] {
                [&E] e = \function d;
                [&F] f = \composingFunction e;
            } -> f;
        } -> finalFunction;
    } 
}

[Transformation<A,B>] 
    [[&A]->[&B]] transform
{
    ~ as *([[&A]->[&B]] transform) {
        .transform = transform;
    }

    ++ transform *([&A] a) -> [&B] {} -> \.transform a
}
```


In summary:

+ Any number of class generic types can be declared for a class, and then used anywhere inside the class.
+ A class generic type can be instantiated by any type, including another generic type or a lambda type.
+ All class generic types are instantiated when invoking a constructor, invoking a type method or declaring a type.
+ Class types with a generic instantiation are compatible if the instantiated types are compatible. Using the afromentioned **Tuple** as an example, if **[C]** is a parent type of **[B]** then **[Tuple<[A][C]>]** is a parent type of **[Tuple<[A][B]>]**.
+ A class with generics can be inherited, each of the generic types must be instantiated.



## Prologue Statements

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


## Method Generics

Method generics allow the output type of a method to be based on the inputs. The following method **identity** simply returns the input as the output.
```
[] {
    *{
        [['A]->['A]] identity = *(["A] input)->["A] {} -> input;
    }
}
```
The type **['A]** represents a method generic with the name **A** inside a method type, called a loose method generic. The type **["A]** represents a method generic with the name **A** inside a method definition, called a bound method generic (other method generics are described as unbound). When **identity** is invoked, the type of **['A]** is determined and all the **["A]**'s are replaced with this type. Thus when **identity** is invoked, the output type is determined by the input type. Following are some examples of invoking **identity**.
```
[] (Hammer, Saw, Cat) {
    *{
        [['A]->['A]] identity = *(["A] input)->["A] {} -> input;
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
        [['A]['B]->['A]] chooseFirstOption = *(["A] first, ["B] second)->["A] {} -> first;
        [['A]['B]->['B]] chooseSecondOption = *(["A] first, ["B] second)->["B] {} -> second;
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
The names of method generics are interchangable, in other words, what matters is their position in a type or method. In the following example, in the type of **chooseFirstOption** **['A]**, **['B]** becomes **['C]**, **['D]** and in the definition of **chooseSecondOption** **["A]** is swapped with **["B]**. Nothing functionally has changed from the previous example:
```
[] (Hammer, Saw, Cat) {
    *{
        [['C]['D]->['C]] chooseFirstOption = *(["A] first, ["B] second)->["A] {} -> first;
        [['A]['B]->['B]] chooseSecondOption = *(["B] first, ["A] second)->["A] {} -> second;
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

A method can use the same method generic type multiple times, in which case, the method generic type is determined by the closest common parent. In the following example, the output type of **chooseFirstOption** is determined by the common type of both inputs.
```
[] (Hammer, Saw, Cat) {
    *{
        [['A]['A]->['A]] chooseFirstOption = *(["A] first, ["A] second)->["A] {} -> first;
        [Cat] cat = \[Cat]:newCat;
        [Saw] saw = \[Saw]:newSaw;
        [Hammer] hammer = \[Hammer]:newHammer;
        [Cat] theSameCat = \chooseFirstOption cat saw;          @ Invalid; [Saw] is not a [Cat]
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


Method generic types can be used in compound types such as class generic instantiations and lambda types. In the following example, **invokeLambda** invokes a lambda object **inputLambda** and returns the result.
```
[] (Hammer, Saw, Cat) {
    *{
        [[->['A]]->['A]] invokeLambda = *([->["A]] inputLambda)->["A] {
                ["A] result = \inputLambda;
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
Method generic types can be used in class methods. The instance method **changeFirst** is added, which returns a new **[Tuple]** with the first object replaced with the input.
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

    +++ changeFirst *(["NEW_FIRST] newFirst) -> [Tuple<["NEW_FIRST][&SECOND]>] {
    } -> \[Tuple<["NEW_FIRST][&SECOND]>]:newTuple newFirst .second
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

    +++ changeFirst *(["NEW_FIRST] newFirst) -> [Tuple<["NEW_FIRST][&SECOND]>] {
    } -> \[Tuple<["NEW_FIRST][&SECOND]>]:newTuple newFirst .second
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

    +++ changeFirst *(["NEW_FIRST] newFirst) -> [Tuple<["NEW_FIRST][&SECOND]>] {
    } -> \[Tuple<["NEW_FIRST][&SECOND]>]:newTuple newFirst .second

    +++ changeSecond *(["NEW_SECOND] newSecond) -> [Tuple<[&FIRST]["NEW_SECOND]>] {
    } -> \[Tuple<[&FIRST]["NEW_SECOND]>]:newTuple .first newSecond
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

A lambda object with method generics can be used as the input to another method. In the following example, **apply** takes a input lambda with type **[['A]->['A]]** and applies this to the input **foo**.

```
[] {
    *{
        [['E][[''A]->[''A]]->['E]] apply = *(["E] foo, [['A]->['A]] inputLambda) -> ["E] {
            ["E] result = \inputLambda foo;
        } -> result;
    }
}

``` 
A lambda type **[['A]->['A]]** in the input is represented as **[[''A]->[''A]]** in the enclosing method type, thus we get **[['E][[''A]->[''A]]->['E]]** as the type of **apply**. The general rule is; method generics in the input are represented by method generics with one more **'** in the enclosing type.

In the following example, **inputLambda** of type **[['E][[''A]->[''A]]->['E]]** is written as **[[''E][['''A]->['''A]]->[''E]]** in the enclosing lambda type for **apply2**.
```
[] {
    *{
        [['M][[''E][['''A]->['''A]]->[''E]]->['M]] apply2 = *(["M] foo, [['E][[''A]->[''A]]->['E]] inputLambda) -> ["M] {
            [['Q]->['Q]] identity = *(["Q] input)->["Q] {} -> input;
            ["M] result = \inputLambda foo identity;
        } -> result;
    }
}

``` 
The previously establish rule where lambda generic names are interchangable still applies, **apply** and **apply2** are rewritten with equivalent method types:
```
[] {
    *{
        [['N][[''P]->[''P]]->['N]] apply = *(["E] foo, [['A]->['A]] inputLambda) -> ["E] {
            ["E] result = \inputLambda foo;
        } -> result;

        [['DOG][[''PIG][['''CAT]->['''CAT]]->[''PIG]]->['DOG]] apply2 = *(["M] foo, [['E][[''A]->[''A]]->['E]] inputLambda) -> ["M] {
            [['Q]->['Q]] identity = *(["Q] input)->["Q] {} -> input;
            ["M] result = \inputLambda foo identity;
        } -> result;
    }
}

``` 
The number of **'**'s of a method generic can be called the binding level of a method generic. The binding level cannot exceed the number of lambda methods it is embedded within. In the following example, the types of **[[['''A]->['''A]]->]** and **[[''A]->[''A]]** are both invalid due to the high binding levels.
```
[] {
    *{
        [[['''A]->['''A]]->] invalidMethod = *([[''A]->[''A]] inputLambda) {}; @ Invalid binding levels for invalidMethod and inputLambda
    }
}

``` 

When lamdba expressions defined as outputs or inputs have unbound method generics, these method generics are independant from the other inputs and outputs. This means that the identifiers are also independant. In the following example, **method** has two inputs and one output of type **[['A]->['A]]**. The declared type of **method** can be written as **[[[''M]->[''M]][[''Q]->[''Q]]->[[''U]->[''U]]]**, **[[[''P]->[''P]][[''P]->[''P]]->[[''P]->[''P]]]** or **[[[''G]->[''G]][[''A]->[''A]]->[[''K]->[''K]]]** which are all equivalent.
```
[] {
    *{
        [[[''M]->[''M]][[''Q]->[''Q]]->[[''U]->[''U]]] method = *([['A]->['A]] inputLambda1, [['A]->['A]] inputLambda2) -> [['A]->['A]] {} -> inputLambda2;
        [[[''P]->[''P]][[''P]->[''P]]->[[''P]->[''P]]] method2 = method;
        [[[''G]->[''G]][[''A]->[''A]]->[[''K]->[''K]]] method3 = method2;
    }
}

```
The same rules apply when the type becomes more complex and other ingredients are added to the mix. We change the previous example such that the lambdas are now inside the class generic of **Container**:
```
[] (Container) {
    *{
        [[Container<[[''M]->[''M]]>][Container<[[''Q]->[''Q]]>]->[Container<[[''U]->[''U]]>]] method = *([Container<[[''A]->[''A]]>] inputLambda1, [Container<[[''A]->[''A]]>] inputLambda2) -> [Container<[[''A]->[''A]]>] {} -> inputLambda2;
        [[Container<[[''P]->[''P]]>][Container<[[''P]->[''P]]>]->[Container<[[''P]->[''P]]] method2 = method;
        [[Container<[[''G]->[''G]]>][Container<[[''A]->[''A]]>]->[Container<[[''K]->[''K]]] method3 = method2;
    }
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

```
The independance of inputs and the output does not apply when dealing with bound method generics. The type **[[['P]->['P]][['P]->['P]]->[['P]->['P]]]** is not equivalent to **[[['M]->['M]][['Q]->['Q]]->[['U]->['U]]]** as shown in the following example, because the inputs and the output are bound method generics.
```
[] {
    *{
        [[['P]->['P]][['P]->['P]]->[['P]->['P]]] method = *([["A]->["A]] inputLambda1, [["A]->["A]] inputLambda2) -> [["A]->["A]] {} -> inputLambda2;
        [[['M]->['M]][['Q]->['Q]]->[['U]->['U]]] method2 = method; @ Invalid; type is not equivalent since ['P]'s depend on each other
    }
}

```
In fact, a lambda of type **[[['M]->['M]][['Q]->['Q]]->[['U]->['U]]]** is impossible to create since the output type is bound and it is not found in any of the inputs, so where would the object come from?



In summary:

+ A method can have any number of method generic types.
+ Method generic types can be used in the input and output of a method.
+ When a method is invoked, the method generic types are determined by the input types.
+ Method generic types can be used to dynamically choose the output type when a method is invoked.
+ The names of method generics are interchangable.
+ Binding levels can be used to input a lambda with method generics into another method.

---

# Specialised Topics



## Anonymous Class Objects

An anonymous class object is created by inheriting from an existing class or classes, instance methods can be overriden for the new object, the whole class structure is contained within a single expression and its creation does not require defining a new class.

Consider the following example where **aDog** and **aBird** are created from **Dog** and **Bird** classes and have a common parent **Animal**.
```
[] (Dog, Bird, Animal) {
    *{
        [Animal] aDog = \[Dog]:createDog;
        [Animal] aBird = \[Bird]:createBird;
    }
}

[Dog :[Animal]] (Animal) {
    ~ createDog *{
        \$~createAnimal;
        \:sleep;
    }
    |++ makeNoise *{
        \:bark;
    }
    |++ eat *{
        \:eatDogFood;
    }
    - bark *{}
    - eatDogFood *{}
}

[Bird :[Animal]] (Animal) {
    ~ createBird *{
        \$~createAnimal;
    }
    |++ makeNoise *{
        \:chirp;
    }
    |++ eat *{
        \:eatBirdFood;
    }
    - chirp *{}
    - eatBirdFood *{}
}

[Animal] {
    ~ createAnimal *{}
    ++ makeNoise *{}
    ++ eat *{}
    ++ sleep *{}
}
```
In this next example, **aDog** and **aBird** are created as anonymous class objects which inherit from **Animal**. This **aDog** and **aBird** are both equivalent to the **aDog** and **aBird** objects from the previous example.
```
[] (Animal) {
    *{
        [Animal] aDog = [:[Animal]] {
                \$~createAnimal;
                \:sleep;
                |++ makeNoise *{
                    \:bark;
                }
                |++ eat *{
                    \:eatDogFood;
                }
                - bark *{}
                - eatDogFood *{}
            };

        [Animal] aBird = [:[Animal]] {
                \$~createAnimal;
                \:tweet;
                |++ makeNoise *{
                    \:tweet;
                }
                |++ eat *{
                    \:eatBirdFood;
                }
                - tweet *{}
                - eatBirdFood *{}
            };
    }
}

[Animal] {
    ~ createAnimal *{}
    ++ makeNoise *{}
    ++ eat *{}
    ++ sleep *{}
}
```

Consider the expression which creates the anonymous class object **aDog** from the previous example:
```
[:[Animal]] {
    \$~createAnimal;
    \:sleep;
    |++ makeNoise *{
        \:bark;
    }
    |++ eat *{
        \:eatDogFood;
    }
    - bark *{}
    - eatDogFood *{}
}
```
The header **[:[Animal]]** declares that the anonymous class object inherits from **[Animal]**.
The body comprises the construction first and the class methods directly after:
```
[:[Animal]] {
    @@ construction starts here @@
    \$~createAnimal;
    \:sleep;
    @@ construction ends here @@

    @@ class methods start here @@
    |++ makeNoise *{
        \:bark;
    }
    |++ eat *{
        \:eatDogFood;
    }
    - bark *{}
    - eatDogFood *{}
    @@ class methods end here @@
}
```
The construction part of the body acts like the internals of a constructor and is used to construct the anonymous class object, all the normal rules of a constructor apply. In this example the construction is equivalent to the **createDog** constructor:
```
~ createDog *{
    \$~createAnimal;
    \:sleep;
}
```
The class methods in the body of an anonymous class object must be overriding a method from a parent class. New instance methods can be defined, but they must have the minimum visibility (**---**). Type methods and constructors are not allowed. The anonymous class object cannot be a partial implementation itself, but it can inherit from a partial constructor and override unimplemented class methods ([see partial class implementations](#partial-class-implementations)) like in the following example:
```
[] (Animal) {
    *{
        [Animal] aDog = [:[Animal]] {
                \$~createAnimal;
                \:sleep;
                ||++ makeNoise *{
                    \:bark;
                }
                ||++ eat *{
                    \:eatDogFood;
                }
                - bark *{}
                - eatDogFood *{}
            };

        [Animal] aBird = [:[Animal]] {
                \$~createAnimal;
                \:tweet;
                ||++ makeNoise *{
                    \:tweet;
                }
                ||++ eat *{
                    \:eatBirdFood;
                }
                - tweet *{}
                - eatBirdFood *{}
            };
    }
}

[Animal] {
    ~ createAnimal *{}
    ++ makeNoise [->]
    ++ eat [->]
    ++ sleep [->]
}
```
An anonymous class object can inherit from multiple parents the same as regular class. The resulting type of the anonymous class object is a disjoint type composed of each of the parent types ([see disjoint types](#disjoint-types)). In the following example, an anonymous class object called **abc** inherits from **[A]**, **[B]** and **[C]**.
```
[] (A, B, C) {
    *{
        [[A]/[B]/[C]] abc = [:[A]:[B]:[C]] {
                \$~createA;
                \$$~createB;
                \$$$~createC;
                ||++ doAThing *{}
                ||++ doBThing *{}
                ||++ doCThing *{}
            };
    }
}

[A] {
    ~ createA *{}
    ++ doAThing [->]
}

[B] {
    ~ createB *{}
    ++ doBThing [->]
}

[C] {
    ~ createC *{}
    ++ doCThing [->]
}
```
An anonymous class object can refer to external local objects inside the anonymous class object structure. In the following example, an anonymous class object **a** refers to local object **foo**, and anonymous class object **aProvider** refers to local object **a**.
```
[] (A, Provider) {
    *{
        [->] foo = *{};

        [A] a = [:[A]] {
                \$~createA;
                ||++ doAThing *{
                    \foo; 
                }
            };

        [Provider<[A]>] aProvider = [:[Provider<[A]>]] {
                \$~init;
                ||++ provide *->[A]{}-> a
            };

        \(\aProvider:provide):doAThing;
    }
}

[A] {
    ~ createA *{}
    ++ doAThing [->]
}

[Provider<E>] {
    ~ init *{}
    ++ provide [->[&E]]
}
```
In the above example, **\\(\\aProvider:provide):doAThing;** will invoke the local lambda method **foo**.


## Compiler Injections

A compiler injection is a statement which allows the injection of arbitrary data to the compiler. A compiler injection can be written as a statement inside a class method or inside the body of a class. A compiler injection is interpreted at an individual compilers discression. A compiler can choose to disallow a compiler injection statement based on any criteria.

The following is an example of a class **Foo** which contains a compiler injection in the type method **bar**.
```
[Foo] {
    :: bar *{
        @@ start of compiler injection @@
        <<< Assembly 
            ##
                mov ax, 7c0h
                mov gs, ax
                mov ax, cx
                mov bx, 160d
                mul bx
                mov di, ax
            ##;
        @@ end of compiler injection @@
    }
}
```
There are three components to a compiler injection:

+ **<<<** always begins a compiler injection
+ an identifier; in this example the identifier was **Assembly**
+ a data segment ([see data segments](#data-segments))
 
In the previous example the data segment contained a set of assembly instructions:
```
                mov ax, 7c0h
                mov gs, ax
                mov ax, cx
                mov bx, 160d
                mul bx
                mov di, ax
```
A compiler could interperate this compiler injection as a compiler directive to inject these instructions into the resulting binary wherever the type method **bar** is invoked. This is just an example of a theoretical compiler, there is no requirement for any compiler to allow or interperate the aformentioned compiler injection in this way.

The following is an example of a compiler injection within the body of a class **Bumblebees**.
```
[Bumblebees] {
    <<< OverwriteImplementation 
        ##
                .' '.            __
       .        .   .           (__\_
        .         .         . -{{_(|8)
          ' .  . ' ' .  . '     (__/
         
           ,,     ,,     ,,
           oo    _oo_   ,oo,
          /==\   /==\   /==\
         (/==\) (/==\) (/==\)
           \/     \/     \/

        ##;
}
```


## Compound Expressions and Statements

Any expression which evaluates to a method can be invoked as a compound expression. For example, the following shows a lambda expression created and invoked in the same statement.
```
[] (A) {
    *{
        [A] a = \ *-> [A] { [A] newA = \[A]:new; } -> newA;
    }
}

[A] {
    ~ new *{}
}
```
The method **\*-> [A] { [A] newA = \\[A]:new; } -> newA** is an expression which creates a lambda object, this lambda object is then invoked and the result is assgned to **a**. The following is equivalent to the previous example but without using a compound expression and instead assigning the lambda object to **createA** first before invoking it.
```
[] (A) {
    *{
        [->[A]] createA = *-> [A] { [A] newA = \[A]:new; } -> newA;
        [A] a = \ createA;
    }
}

[A] {
    ~ new *{}
}
```
Round brackets **()** can be used to group expressions to make a statement more clear. An expression surrounded by round brackets **()** must always evaluate to an object. In the following example, the previous compound statement is rewritten with round brackets for more visual clarity.
```
[] (A) {
    *{
        [A] a = \ (*-> [A] { [A] newA = \[A]:new; } -> newA);
    }
}

[A] {
    ~ new *{}
}
```
Round brackets **()** can also be used to control the evalutation for a compound expression. In the following example, one expression outputs **outputA** and the other outputs **outputB**. Both expressions have the same components, but by varying the bracketing surrounding **\\[Foo]:bar** different methods are invoked.
```
[] (A, B, Foo) {
    *{
        [A] inputA = \[A]:new;
        [A] outputA = \(\[Foo]:bar) inputA;
        [B] outputB = \(\[Foo]:bar inputA);
    }
}

[Foo] {
    :: bar * -> [[A]->[A]] {
            [[A]->[A]] outputTheInput = *([A] a) -> [A] {} -> a;
        } -> outputTheInput

    :: bar *([A] a) -> [->[B]] {
        [B] b = \[B]:new;
        [->[B]] outputTheNewB = * -> [B] {} -> b;
    } -> outputTheNewB
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}
```
The type method **bar** is overloaded ([see overloading class methods](#overloading-and-underloading-class-methods)) so when the brackets surround **(\\[Foo]:bar)** the first **bar** is invoked because no inputs are given when invoking **bar**, and when brackets surround **(\\[Foo]:bar inputA)** the second **bar** is invoked because the input **inputA** is given when invoking **bar**. When no brackets are used to determine the order of evaluation then the order of evaluation always favours grouping expressions as large as possible from the last invocation (i.e. **\\a b c \\d e \\f g** will be evalutated the same as **(\\a b c (\\d e (\\f g)))** and **\\a b c (\\d e) \\f g** with be evalutated like **(\\a b c (\\d e) (\\f g))**). The brackets are removed from the previous example which causes the second **bar** to be invoked:
```
[] (A, B, Foo) {
    *{
        [A] inputA = \[A]:new;
        [B] outputB = \\[Foo]:bar inputA;
    }
}

[Foo] {
    :: bar * -> [[A]->[A]] {
            [[A]->[A]] outputTheInput = *([A] a) -> [A] {} -> a;
        } -> outputTheInput

    :: bar *([A] a) -> [->[B]] {
        [B] b = \[B]:new;
        [->[B]] outputTheNewB = * -> [B] {} -> b;
    } -> outputTheNewB
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}
```

When a method is invoked the inputs are always evaluated from left to right. In the following example, the method **foo** is executed before the method **bar** and the method **see** is executed after the method **bar**.
```
[] (A, B, C) {
    *{
        [->[A]] foo = * -> [A] {} -> \[A]:new;
        [->[B]] bar = * -> [B] {} -> \[B]:new;
        [->[C]] see = * -> [C] {} -> \[C]:new;
        \(*([A]a,[B]b,[C]c){}) (\foo) (\bar) (\see);
    }
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}

[C] {
    ~ new *{}
}
```

Curly brackets **{}** can be used to create a group of statements. The statements within a statement group are always executed in the order that they appear from the first to the last. In the following example, the following 3 statements which define local objects **foo**, **bar** and **see** appear inside a statement group:
```
[] (A, B, C) {
    *{
        @@ start of statement group @@
        {
            [->[A]] foo = * -> [A] {} -> \[A]:new;
            [->[B]] bar = * -> [B] {} -> \[B]:new;
            [->[C]] see = * -> [C] {} -> \[C]:new;
        }
        @@ end of statement group @@
    }
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}

[C] {
    ~ new *{}
}
```
The local objects within the group are not visible outside the statement group, thus the following is invalid:
```
[] (A, B, C) {
    *{
        {
            [->[A]] foo = * -> [A] {} -> \[A]:new;
            [->[B]] bar = * -> [B] {} -> \[B]:new;
            [->[C]] see = * -> [C] {} -> \[C]:new;
        }
        [A] a = \foo; @ Invalid; foo is not visible here
        [B] b = \bar; @ Invalid; bar is not visible here
        [C] c = \see; @ Invalid; see is not visible here
    }
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}

[C] {
    ~ new *{}
}
```
Statement groups can refer to objects outside the group, thus the following is valid:
```
[] (A, B, C) {
    *{
        [->[A]] foo = * -> [A] {} -> \[A]:new;
        [->[B]] bar = * -> [B] {} -> \[B]:new;
        [->[C]] see = * -> [C] {} -> \[C]:new;
        {
            [A] a = \foo; @ Valid; foo is visible here
            [B] b = \bar; @ Valid; bar is visible here
            [C] c = \see; @ Valid; see is visible here
        }
    }
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}

[C] {
    ~ new *{}
}
```
A statement group is itself considered a statement, and thus a statement group can contain other statement groups like in the following example:
```
[] (A, B, C) {
    *{
        @@ start of statement group @@
        {
            [->[A]] foo = * -> [A] {} -> \[A]:new;
            [->[B]] bar = * -> [B] {} -> \[B]:new;
            [->[C]] see = * -> [C] {} -> \[C]:new;
            @@ start of statement group within statement group @@
            {
                [A] a = \foo;
                [B] b = \bar;
                [C] c = \see;
            }
            @@ end of statement group within statement group @@
        }
        @@ end of statement group @@
    }
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}

[C] {
    ~ new *{}
}
```
A statement in a statement group cannot evaulate to an object. The body of a method expression and the body of a prologue statement are both considered statement groups and thus also conform to this rule. The following example shows three statements which are invalid because they each evaluate to an object.
```
[] (A, B, C) {
    *{
        {
            [->[A]] foo = * -> [A] {} -> \[A]:new;
            [->[B]] bar = * -> [B] {} -> \[B]:new;
            [->[C]] see = * -> [C] {} -> \[C]:new;
            \foo; @ Invalid; invocation returns an [A] object, a statement cannot evalutate to an object
            \bar; @ Invalid; invocation returns a [B] object, a statement cannot evalutate to an object
            \see; @ Invalid; invocation returns a [C] object, a statement cannot evalutate to an object
        }
        
    }
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}

[C] {
    ~ new *{}
}
```
If the intent of the code is to ignore the result of an expression, then the previous example can be rewritten using the [root type](#root-type) and [void identifier](#void-identifier):
```
[] (A, B, C) {
    *{
        {
            [->[A]] foo = * -> [A] {} -> \[A]:new;
            [->[B]] bar = * -> [B] {} -> \[B]:new;
            [->[C]] see = * -> [C] {} -> \[C]:new;
            [] _ = \foo; @ Valid; does not evaluate to an object, the [A] result of the invocation is captured
            [] _ = \bar; @ Valid; does not evaluate to an object, the [B] result of the invocation is captured
            [] _ = \see; @ Valid; does not evaluate to an object, the [C] result of the invocation is captured
        }
        
    }
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}

[C] {
    ~ new *{}
}
```

Object methods can be refered to in a compound expression. In the following example, **getB** is invoked on an object which itself was created by invoking the method **[A]:new** in the same expression.
```
[] (A, B) {
    *{
        [B] b = \(\[A]:new):getB;
    }
}

[A] (B) {
    ~ new *{}
    ++ getB * -> [B] {} -> (\[B]:new)
}

[B] () {
    ~ new *{}
}
```
[Type casting](#type-casting) can be used inside a compound expression:
```
[] (A, B) {
    *{
        [B] b = \[B](\[A]:new):getAnotherB;
    }
}

[A :[B]] (B) {
    ~ new *{
        \$~new;
    }
}

[B] () {
    ~ new *{}
    + getAnotherB * -> [B] {} -> (\[B]:new)
}
```
Prologue statements can be attached to any expression within a compound expression:
```
[] (A, B) {
    *{
        [B] b = \(a ! {[A] a = \[A]:new}):getB;
    }
}

[A] (B) {
    ~ new *{}
    ++ getB * -> [B] {} -> (\[B]:new)
}

[B] () {
    ~ new *{}
}
```
An [object proxy](#object-proxy) can be used inside a compund expression, and can form an object proxy of an object resulting from an expression:
```
[] (B) {
    *{
        [[[B]/[->[B]]]/[->[[B]/[->[B]]]]] bProxyProxy = *- (*- \[B]:new);
    }
}

[B] () {
    ~ new *{}
}
```

All the different expressions can be combined in a compound way. Various constructs have different binding strength. The following list shows constructs in order of binding strength from weakest to strongest.


1. **!** binding to the preceeding expression and the following statement (as in a prologue statement for an expression)
2. **=** binding to the left hand side and the next expression, **\\** binding to the following one or more expressions (as in invoking a method and the corresponding inputs), **->** binding to the next expression (as in the output of a method), **\*-** binding to the next expression (as in the object of which to form an object proxy) and **\*** binding to the lone statement body of a method which may be preceeded by a method input list ([see flexible method expression](#flexible-method-expression))
3. **:** binding to the following identifier and sometimes the preceeding type or expression (as in a type method or an instance method)
cast
4. A type (such as **[Foo]**) binding to an object name in an assignment or to an expression as in [type casting](#type-casting).
5. All other symbols; such as **.**, **$**, **$$**, **:~**, **~** and **$$~**

**=**, **\\**, **->**, **\*** and **\*-** ([object proxy](#object-proxy)) have the same binding strength. 

A construct will bind stronger then a preceeding construct at the same binding level indicated by the above list. In other words, an **!** will bind stronger then all other **!** which preceeded it, and a **->** will bind stronger then all other **\\** which preceeded it.

Following are a series of 8 compound expressions.
```
*->[->[A]]{}->*->[A]{}->a
*->[A]{}->\ b :c d :e f (:g)
\a b \c d
\.a:b.c:d\e.f.g:h
\\\a
\\*->[->]{}->*{}
\*->[A]{}->a![A]a=\b:c
a![A]a=\b![B]b=\c
```
Following are 8 equivalent expressions with bracketing to show how the binding is determined.
```
(*->[->[A]]{}->(*->[A]{}->a))
(*->[A]{}->(\ (b :c) (d :e) (f) (:g)))
(\(a) (b) (\c d))
(\(.a:b)(.c:d)(\(e)(.f)(.g:h)))
(\(\(\a)))
(\(\(*->[->]{}->(*{}))))
(\(*->[A]{}->a))![A]a=(\(b:c))
a!{{[A]a=\(b)}!{[B]b=(\(c))}}
```

## Constructors

### Using Multiple Constructors

Multiple constructors can be defined for a class. In the following example, a constructor **containerOf** and another constructor **containerOfObjectWithin** are defined for the **Container** class. Both are used to create a **[Container<[A]>]** object.
```
[] (Container, A) {
    *{
        [A] a = \[A]:new;
        [Container<[A]>] containerOfA = \[Container<[A]>]:containerOf a;
        [Container<[A]>] anotherContainerOfA = \[Container<[A]>]:containerOfObjectWithin containerOfA;
        [A] alsoA = \anotherContainerOfA:getObject;
    }
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ~ containerOfObjectWithin *([Container<[&E]>] otherContainer) {
        [&E] objectWithinOtherContainer = \otherContainer:getObject;
        .containedObject = objectWithinOtherContainer;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ new *{}
}
```

### Invoking Self Constructors

A constructor can invoke another constructor from the same class, this is called a self constructor. Only one self constructor can be invoked per constructor. In the following example, **containerOfObjectWithin** is rewritten to invoke the other constructor **containerOf** rather then directly assigning the instance object **containedObject**. **:~containerOf** refers to the constructor **containerOf** within the same class.
```
[] (Container, A) {
    *{
        [A] a = \[A]:new;
        [Container<[A]>] containerOfA = \[Container<[A]>]:containerOf a;
        [Container<[A]>] anotherContainerOfA = \[Container<[A]>]:containerOfObjectWithin containerOfA;
        [A] alsoA = \anotherContainerOfA:getObject;
    }
}

[Container < E > ]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ~ containerOfObjectWithin *([Container<[&E]>] otherContainer) {
        [&E] objectWithinOtherContainer = \otherContainer:getObject;
        \:~containerOf objectWithinOtherContainer;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ new *{}
}
```
The instance object **containedObject** is not assigned in the **containerOfObjectWithin** constructor because it is already assigned when the self constructor **containerOf** is invoked. The same applies to invoking parent constructors. In the following example, the **Container** class inherits from **Foo** and the parent constructor of **Foo** is invoked in **containerOf** but not in **containerOfObjectWithin**.
```
[] (Container, A) {
    *{
        [A] a = \[A]:new;
        [Container<[A]>] containerOfA = \[Container<[A]>]:containerOf a;
        [Container<[A]>] anotherContainerOfA = \[Container<[A]>]:containerOfObjectWithin containerOfA;
        [A] alsoA = \anotherContainerOfA:getObject;
    }
}

[Container < E > :[Foo]] (Foo)
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
        \$~fooParentConstructor;
    }

    ~ containerOfObjectWithin *([Container<[&E]>] otherContainer) {
        [&E] objectWithinOtherContainer = \otherContainer:getObject;
        \:~containerOf objectWithinOtherContainer;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ new *{}
}

[Foo] {
    ~ fooParentConstructor *{}
}
```

### Pointer Constructors

A pointer constructor can always be used in place of a regular constructor, it uses an existing object to construct a new object. A pointer constructor is used by writing **>** instead of a constructor identifier, and takes a single input consisting of the existing object which the new object will point to. In the following example, the **containerOfObjectWithin** constructor is rewritten to invoke a self pointer constructor pointing to the **otherContainer**.
```
[] (Container, A) {
    *{
        [A] a = \[A]:new;
        [Container<[A]>] containerOfA = \[Container<[A]>]:containerOf a;
        [Container<[A]>] anotherContainerOfA = \[Container<[A]>]:containerOfObjectWithin containerOfA;
        [A] alsoA = \anotherContainerOfA:getObject;
    }
}

[Container < E > ]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ~ containerOfObjectWithin *([Container<[&E]>] otherContainer) {
        \:~> otherContainer;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ new *{}
}
```
The pointer constructor causes every method of the new object to point to the corresponding method of the existing object. Therefore when **anotherContainerOfA:getObject** is invoked, the method **getObject** of the existing object **containerOfA** will be invoked. **a** and **alsoA** are the same object.

A parent pointer constructor can be invoked in place of a regular parent constructor. When a parent pointer constructor is used, the parent methods can be overriden just like when a regular constructor is used, and the parent methods will point to the corresponding methods in the original object. In the following example, a **[HungryBird]** doubles the number of times the **eat** method is invoked in the original **[Bird]** object, and an **[ExcitedBird]** doubles the number of times the **makeNoise** method is invoked in the original **[Bird]** object.
```
[] (Bird, HungryBird, ExitedBird) {
    *{
        [Bird] bird = \[Bird]:createBird;
        [ExcitedBird] excitedBird = \[ExcitedBird]:excitedVersionOf bird;
        [HungryBird] hungryBird = \[HungryBird]:hungryVersionOf bird;
        [Bird] extraExcitedBird = \[ExcitedBird]:excitedVersionOf excitedBird;
        [Bird] hungryAndExcitedBird = \[ExcitedBird]:excitedVersionOf hungryBird;
        \bird:eat;                       @ eatBirdFood of bird invoked once
        \bird:makeNoise;                 @ chirp of bird invoked once
        \excitedBird:eat;                @ eatBirdFood of bird invoked once
        \excitedBird:makeNoise;          @ chirp of bird invoked twice
        \hungryBird:eat;                 @ eatBirdFood of bird invoked twice
        \hungryBird:makeNoise;           @ chirp of bird invoked once
        \extraExcitedBird:eat;           @ eatBirdFood of bird invoked once
        \extraExcitedBird:makeNoise;     @ chirp of bird invoked four times
        \hungryAndExcitedBird:eat;       @ eatBirdFood of bird invoked twice
        \hungryAndExcitedBird:makeNoise; @ chirp of bird invoked twice
    }
}

[HungryBird :[Bird]] (Bird) {
    ~ hungryVersionOf *([Bird] bird) {
        \$~>bird;
    }
    |++ eat *{
        \$eat;
        \$eat;
    }
}

[ExcitedBird :[Bird]] (Bird) {
    ~ excitedVersionOf *([Bird] bird) {
        \$~>bird;
    }
    |++ makeNoise *{
        \$makeNoise;
        \$makeNoise;
    }
}

[Bird] {
    ~ createBird *{}
    ++ makeNoise *{
        \:chirp;
    }
    ++ eat *{
        \:eatBirdFood;
    }
    - chirp *{}
    - eatBirdFood *{}
}
```
Pointer constructors can be used inside [anonymous class objects](#anonymous-class-objects). The **excitedBird**, **hungryBird**, **extraExcitedBird** and **hungryAndExcitedBird** from the previous example are rewritten as [anonymous class objects](#anonymous-class-objects):
```
[] (Bird, HungryBird, ExitedBird) {
    *{
        [Bird] bird = \[Bird]:createBird;
        [Bird] excitedBird = [:[Bird]] {
                \$~>bird;
                |++ makeNoise *{
                    \$makeNoise;
                    \$makeNoise;
                }
            };
        [Bird] hungryBird = [:[Bird]] {
                \$~>bird;
                |++ eat *{
                    \$eat;
                    \$eat;
                }
            };
        [Bird] extraExcitedBird = [:[Bird]] {
                \$~>excitedBird;
                |++ makeNoise *{
                    \$makeNoise;
                    \$makeNoise;
                }
            };
        [Bird] hungryAndExcitedBird = [:[Bird]] {
                \$~>hungryBird;
                |++ makeNoise *{
                    \$makeNoise;
                    \$makeNoise;
                }
            };
        \bird:eat;                       @ eatBirdFood of bird invoked once
        \bird:makeNoise;                 @ chirp of bird invoked once
        \excitedBird:eat;                @ eatBirdFood of bird invoked once
        \excitedBird:makeNoise;          @ chirp of bird invoked twice
        \hungryBird:eat;                 @ eatBirdFood of bird invoked twice
        \hungryBird:makeNoise;           @ chirp of bird invoked once
        \extraExcitedBird:eat;           @ eatBirdFood of bird invoked once
        \extraExcitedBird:makeNoise;     @ chirp of bird invoked four times
        \hungryAndExcitedBird:eat;       @ eatBirdFood of bird invoked twice
        \hungryAndExcitedBird:makeNoise; @ chirp of bird invoked twice
    }
}

[Bird] {
    ~ createBird *{}
    ++ makeNoise *{
        \:chirp;
    }
    ++ eat *{
        \:eatBirdFood;
    }
    - chirp *{}
    - eatBirdFood *{}
}
```
A pointer constructor can be used in classes with generic types. In which case, the pointer constructor must be given an object with a type matching the class generic. A self pointer constructor is used in the constructor **mirror** and is used to create a equivalent **[Container<[A]>]** and **[Container<[B]>]** object:
```
[] (Container, A, B, ContainerOfA) {
    *{
        [A] a = \[A]:new;
        [B] b = \[B]:new;
        [Container<[A]>] containerOfA = \[Container<[A]>]:containerOf a;
        [Container<[B]>] containerOfB = \[Container<[B]>]:containerOf b;
        [Container<[A]>] mirrorContainerOfA = \[Container<[A]>]:mirror containerOfA;
        [Container<[B]>] mirrorContainerOfB = \[Container<[B]>]:mirror containerOfB;
    }
}

[Container < E > ]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ~ mirror *([Container<[&E]>] container) {
        \:~> container;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ new *{}
}

[B] {
    ~ new *{}
}
```
A pointer constructor can be used in classes inheriting from another class with generics. In which case, the pointer constructor must be given an object with a type matching the generic instatiation of the inherited parent. A parent pointer constructor is used in the constructor **mirror** in **ContainerOfA** and is used to create a **[ContainerOfA<[A]>]** object:
```
[] (Container, A, ContainerOfA) {
    *{
        [A] a = \[A]:new;
        [Container<[A]>] containerOfA = \[Container<[A]>]:containerOf a;
        [ContainerOfA<[A]>] mirrorContainerOfA = \[ContainerOfA<[A]>]:mirror containerOfA;
    }
}

[Container < E > ]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[ContainerOfA :[Container<[A]>]] (A, Container) {

    ~ mirror *([Container<[A]>] containerOfA) {
        \$~> containerOfA;
    }
}

[A] {
    ~ new *{}
}
```


### Statement Ordering in Constructors

There are 5 different categories of statements inside a constructor:

1. Instance assignment: assigning instance objects and instance methods. [See assigning instance methods in constructors.](#assigning-instance-methods-in-constructors)
2. Constructor invocation: invoking parent and [self constructors](#invoking-self-constructors) ([includes parent and self pointer constructors](#pointer-constructors)). 
3. Self referential: statements which include references to instance methods, instance objects or [direct self reference](#self-reference).
4. Mixed statements: statements which fit more then one of the above categories (1-3).
5. Other: all other statements which do not fit the above categories (1-4).

Constructor invocation statements must always come after any instance assignments and before any self referential statements. There are no ordering requirements for other statements. Mixed statements are right out, none are to be written or I will say Ni to you again. The following example shows two constructors **fooConstructor1** and **fooConstructor2**, with each statement labeled by which of the aformentioned categories it fits into. 
```
[Foo :[BaseClass1] :[BaseClass2]] (Bar, BaseClass1, BaseClass2) 
    [Bar] instanceObject1
    [Bar] instanceObject2
{
    ~ fooConstructor1 *([Bar] bar1) {
        .instanceObject1 = bar1;        @ Instance assignment (assigning instance object instanceObject1)
        :instanceMethod2 = *{};         @ Instance assignment (assigning instance method instanceMethod2)
        [Bar] bar2 = \[Bar]:newBar;     @ Other
        .instanceObject2 = bar2;        @ Instance assignment (assigning instance object instanceObject2)
        \$$~initBaseClass2;             @ Constructor invocation (after all instance assignments and before any self referential statements)
        [Bar] bar3 = \[Bar]:newBar;     @ Other
        \$~initBaseClass1;              @ Constructor invocation (after all instance assignments and before any self referential statements)
        \:instanceMethod1;              @ Self referential (refering to instance method instanceMethod1)
        [Foo] myself = ^;               @ Self referential (refering to self)
        \myself:instanceMethod2;        @ Other
    }

    ~ fooConstructor2 *{
        [Bar] bar1 = \[Bar]:newBar;             @ Other
        \:~fooConstructor1 bar1;                @ Constructor invocation (after all instance assignments and before any self referential statements)
        [->] lambda = *{ \:instanceMethod2; };  @ Self referential (refering to instance method instanceMethod2)
        \lambda;                                @ Other
        [Bar] bar2 = .instanceObject2;          @ Self referential (refering to instance object instanceObject2)
    }

    - instanceMethod1 *{}
}

    - instanceMethod2 [->]
[BaseClass1]
    ~ initBaseClass1 *{}
}

[BaseClass2]
    ~ initBaseClass2 *{}
}

[Bar] {
    ~ newBar *{}
}
```
Constructor invocations and instance assignments can only appear in the most base level scope of a constructor method. [See scope.](#scope) The scope requirement is demonstrated in the following example where every statement of **fooConstructor1** and **fooConstructor2** is placed inside a [statement group](#compound-expressions-and-statements).
```
[Foo :[BaseClass1] :[BaseClass2]] (Bar, BaseClass1, BaseClass2) 
    [Bar] instanceObject1
    [Bar] instanceObject2
{
    ~ fooConstructor1 *([Bar] bar1) {       @ Invalid constructor
        {
            .instanceObject1 = bar1;        @ Invalid; instance assignment must be in the base scope of a constructor method
            :instanceMethod2 = *{};         @ Invalid; instance assignment must be in the base scope of a constructor method
            [Bar] bar2 = \[Bar]:newBar;     @ Valid; other statement has no scope level requirements
        };
        {
            .instanceObject2 = bar2;        @ Invalid; instance assignment must be in the base scope of a constructor method
            \$$~initBaseClass2;             @ Invalid; constructor invocation must be in the base scope of a constructor method
            [Bar] bar3 = \[Bar]:newBar;     @ Valid; other statement has no scope level requirements
            \$~initBaseClass1;              @ Invalid; constructor invocation must be in the base scope of a constructor method
        };
        {
            \:instanceMethod1;              @ Valid; self referential statement has no scope level requirements
        };
        {
            [Foo] myself = ^;               @ Valid; self referential statement has no scope level requirements
            \myself:instanceMethod2;        @ Valid; other statement has no scope level requirements
        };
    }

    ~ fooConstructor2 *{                            @ Invalid constructor
        {
            [Bar] bar1 = \[Bar]:newBar;             @ Valid; other statement has no scope level requirements
            \:~fooConstructor1 bar1;                @ Invalid; constructor invocation must be in the base scope of a constructor method
        };
        {
            [->] lambda = *{ \:instanceMethod2; };  @ Valid; self referential statement has no scope level requirements
            \lambda;                                @ Valid; other statement has no scope level requirements
            [Bar] bar2 = .instanceObject2;          @ Valid; self referential statement has no scope level requirements
        };
    }

    - instanceMethod1 *{}
    - instanceMethod2 [->]
}

[BaseClass1]
    ~ initBaseClass1 *{}
}

[BaseClass2]
    ~ initBaseClass2 *{}
}

[Bar] {
    ~ newBar *{}
}
```

## Data Segments

A data segment is an expression which allows the injection of arbitrary data into an object. The data represented by a data segment is interpreted at an individual compilers discression. A compiler can choose to only allow a subset of possible data segments. 

The syntax of a data segment involves any charaters started and ended with two identical anchors. A data segment anchor starts with **#** and ends with another **#**. Between the two **#**'s can be any characters except for a **#**. Following is a number of example data segments along with a description of the characters they contain:

* **##hello##** contains hello
* **#234#hello#234#** contains hello
* **#ABC###AB##ABC#** contains ##AB#
* **#9 #99#9 #** contains 99
* **##-0.77##** contains -0.77
* **##{"l":{"p":"#"}}##** contains {"l":{"p":"#"}}
* **#1#{"l":{"p":"##"}}#1#** contains {"l":{"p":"##"}}

A data segment is parsed by comparing the first anchor with characters until an identical anchor is found, all the characters in between represent the contents of the data segment. Thus, a data segment containing any arbitrary set of characters can be written. A compiler can choose to only allow a subset of data segments, thus one or more of the above data segments may be invalid for any given compiler.

A data segment is a kind of object, but it is unique compared to other objects because it has the following restrictions:

* A data segment cannot be the output of a method. This includes restricting a generic method invocation if the output would be a data segment. 
* A data segment cannot be cast to a different type. [See type casting.](#type-casting)
* The right hand side of an assignment cannot be a data segment.
* A data segment method input cannot be used in an expression.
* A data segment cannot instantiate a class generic type.

Thus the only way a data segment can be used is by writing the data segment directly as an input to a method. In the following example, a **[Integer]**, **[String]** and **[JSON]** object are constructed with data segments which are each representing literals.
```
[] (Integer, String, JSON) {
    *{
        [Integer] thirtyFive = \[Integer]:fromLiteral ##35##;
        [String] helloWorld = \[String]:fromLiteral ##Hello World##;
        [JSON] someJSON = \[JSON]:fromLiteral ##{"l":{"p":"#"}}##;
    }
}

[Integer] {
    ~ fromLiteral *([%INTEGER_LITERAL] literal) {}
}

[String] {
    ~ fromLiteral *([%STRING_LITERAL] literal) {}
}

[JSON] {
    ~ fromLiteral *([%JSON_LITERAL] literal) {}
}
```
A data segment expression corresponds to a data segment type just like other objects. A data segment type is written as **&** followed by an identifier and surrounded by square brackets **[]**. Any data segment is compatible with any identifier, so the previous example could be rewritten as follows:
```
[] (Integer, String, JSON) {
    *{
        [Integer] thirtyFive = \[Integer]:fromLiteral ##35##;
        [String] helloWorld = \[String]:fromLiteral ##Hello World##;
        [JSON] someJSON = \[JSON]:fromLiteral ##{"l":{"p":"#"}}##;
    }
}

[Integer] {
    ~ fromLiteral *([%ABC] literal) {}
}

[String] {
    ~ fromLiteral *([%QWE] literal) {}
}

[JSON] {
    ~ fromLiteral *([%YUI] literal) {}
}
```
A compiler can choose to use [disjoint types](#disjoint-types) to express that a data segment has multiple data segment types:
```
[] (IntegerAndStringAndJSON) {
    *{
        [IntegerAndStringAndJSON] thirtyFiveAndHelloWorldAndJSON = \[IntegerAndStringAndJSON]:fromLiteral ##{"Integer":35,"String":"Hello World","JSON":{"l":{"p":"#"}}}##;
    }
}

[IntegerAndStringAndJSON] {
    ~ fromLiteral *([[%INTEGER_LITERAL]/[%STRING_LITERAL]/[%JSON_LITERAL]] literal) {}
}
```
A compiler can choose to only allow a chosen subset of data segment types and to restrict which data segments can be matched to each data segment type. Therefore, the previous examples are not actually gaurenteed to show valid data segments and types for any specific compiler.

Data segments cannot be manipulated or interacted with directly. Rather, data segments are intended as a tool to allow a compiler to implement the injection of arbitrary data into an object or class.


## Disjoint Types

A disjoint type is a combination of one or more types. In the following example, an **[Q]** is decribed as a disjointed type of its parent types **[A]** and **[B]**.
```
[] (Q, A, B) {
    *{
        [Q] q = \[Q]:newQ;
        [[A]/[B]] aAndB = q;
    }
}

[Q :[A] :[B]] (A, B) {
    ~ newQ *{
        \$~newA;
        \$$~newB;
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}
```
A disjoint type is written as two or more inner types seperated by forward slash **/** and surrounded by square brackets **[]**. A disjoint type is a child type of each of its inner types. An object declared as a disjoint type can invoke any method available to any of the inner types. The following example add methods and showcases some valid and invalid invocations for the **[[A]/[B]]** object:
```
[] (Q, A, B) {
    *{
        [Q] q = \[Q]:newQ;
        [[A]/[B]] aAndB = q;
        \aAndB:sharedMethod;    @ Valid; can invoke method found in both class A and B
        \aAndB:methodInA;       @ Valid; can invoke method found in only class A
        \aAndB:methodInB;       @ Valid; can invoke method found in only class B
        \aAndB:methodInQ;       @ Invalid; methodInQ is not found in class A or class B
    }
}

[Q :[A] :[B]] (A, B) {
    ~ newQ *{
        \$~newA;
        \$$~newB;
    }
    |++ foo *{
        \$sharedMethod;
        \$$sharedMethod;
    }
    ++ methodInQ *{}
}

[A] {
    ~ newA *{}
    ++ sharedMethod *{}
    ++ methodInA *{}
}

[B] {
    ~ newB *{}
    ++ sharedMethod *{}
    ++ methodInB *{}
}
```
Removing one inner type creates a parent type of the original disjoint type. Replacing an inner type with one of its parent types, also creates a parent type of the original disjoint type. Some examples:
    
* **[[A]/[B]/[C]]** is a child type of **[[A]/[B]]**, **[[B]/[C]]** and **[[A]/[C]]**
* **[[A]/[B]/[C]]** is a child type of **[A]**, **[B]** and **[C]**
* **[[A]/[C]]** is neither a parent or child type of **[[A]/[B]]**
* **[[B]/[C]]** is neither a parent or child type of **[[A]/[C]]**
* **[[A]/[B]]** is neither a parent or child type of **[[B]/[C]]**
* If **[A]** is a parent type of **[U]**, **[[A]/[B]]** is a parent type of **[[U]/[B]]**

Inner types can be rearranged and the resulting disjoint types are equivalent. In other words, **[[A]/[B]/[C]]**, **[[B]/[A]/[C]]** and **[[C]/[A]/[B]]** are treated as the same type.

Duplicate inner types are ignored, i.e. **[[A]/[C]/[C]]** is the same as **[[A]/[C]]** and [[B]/[B]] is the same as [B].

If the inner types contain a parent and child type pair, then the parent type can be removed and the resulting type is considered to be equivalent. Therefore, if **[A]** is a parent type of **[U]**, then **[[A]/[U]/[C]]** is the same as **[[U]/[C]]**, and **[[A]/[U]]** is the same as **[U]**.

If an inner type is itself a disjoint type, then the outermost disjoint type can be flattened by moving the inner most types to the outermost disjoint type. For example, **[[A]/[[B]/[C]]]** is equivalent to **[[A]/[B]/[C]]**.

Instances of the [root type](#root-type) as an inner types are ignored, i.e. **[[]/[]]** is the same as **[]**, and **[[A]/[]/[B]]** is the same as **[[A]/[B]]**.

Methods can have disjoint type objects as both input and output.

The following example shows some assignments using disjointed types:
```
[] (Q, A, B, C) {
    *{
        [Q] q = \[Q]:newQ;
        [[A]/[B]/[C]] abc1 = q;
        [[[A]/[B]]/[C]] abc2 = abc;
        [[B]/[C]] bc = abc2;
        [[A]/[C]] ac = abc;
        [[[A]/[B]/[C]]->[[A]/[B]]] abcToAb = *([[A]/[B]/[C]] abc)->[[A]/[B]]{} -> abc;
        [[A]/[B]] ab = \abcToAb abc;
        [A] a1 = ac;
        [A] a2 = ab;
        [A] a3 = abc;
        [[A]/[A]] aa = a1;
        [[Q]/[A]] qa = q;
        [Q] q2 = qa;
    }
}

[Q :[A] :[B] :[C]] (A, B, C) {
    ~ newQ *{
        \$~newA;
        \$$~newB;
        \$$$~newC;
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}

[C] {
    ~ newC *{}
}
```
A disjoint type can instantiate a class generic:
```
[] (Container, Q, A, B, C) {
    *{
        [[A]/[B]/[C]] abc = \[Q]:newQ;
        [Container<[[A]/[B]/[C]]>] abcContainer = \[Container<[[A]/[B]/[C]]>]:newContainer abc;
        [[A]/[B]/[C]] abcFromContainer = \abc:getContainedObject;
    }
}

[Container < CONTAINED_OBJECT > ]
    [&CONTAINED_OBJECT] containedObject
{
    ~ newContainer *([&CONTAINED_OBJECT] objectToBeContained) {
        .containedObject = objectToBeContained;
    }
    ++ getContainedObject *->[&CONTAINED_OBJECT]{}->.containedObject
}

[Q :[A] :[B] :[C]] (A, B, C) {
    ~ newQ *{
        \$~newA;
        \$$~newB;
        \$$$~newC;
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}

[C] {
    ~ newC *{}
}
```
Disjoint types can be composed with class generics:
```
[] (Container, Q, A, B, C) {
    *{
        [[A]/[B]/[C]] abc = \[Q]:newQ;
        [Container<[[[A]/[B]][C]]>] abcContainer = \[Container<[[[A]/[B]][C]]>]:newContainer abc;
        [[A]/[B]/[C]] abcFromContainer = \abc:getContainedObject;
    }
}

[Container < CONTAINED_OBJECT_PART1, CONTAINED_OBJECT_PART2 > ]
    [[&CONTAINED_OBJECT_PART1]/[&CONTAINED_OBJECT_PART2]] containedObject
{
    ~ newContainer *([[&CONTAINED_OBJECT_PART1]/[&CONTAINED_OBJECT_PART2]] objectToBeContained) {
        .containedObject = objectToBeContained;
    }
    ++ getContainedObject *->[[&CONTAINED_OBJECT_PART1]/[&CONTAINED_OBJECT_PART2]]{}->.containedObject
}

[Q :[A] :[B] :[C]] (A, B, C) {
    ~ newQ *{
        \$~newA;
        \$$~newB;
        \$$$~newC;
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}

[C] {
    ~ newC *{}
}
```
Disjoint types can be composed with method generics:
```
[] (Q, A, B, C) {
    *{
        [[A]/[B]/[C]] abc = \[Q]:newQ;
        [[[A]/['Y]]->['Y]] foo = *([[A]/["Y]] ay)->["Y] {} -> ay;
        [[B]/[C]] bc = \foo abc;
    }
}


[Q :[A] :[B] :[C]] (A, B, C) {
    ~ newQ *{
        \$~newA;
        \$$~newB;
        \$$$~newC;
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}

[C] {
    ~ newC *{}
}
```
A method generic inside a disjoint type is determined to be the most basic type required to match the method signature. In the above example, when **foo** was invoked; **['Y]** was determined to be **[[B]/[C]]** which is the most basic type required to match the input **abc** of type **[[A]/[B]/[C]]**. In the following example, **['Y]** matches both **[[B]/[C]]** and **[B]**, therefore this invocation of **foo** has a return type of **[B]** since it is the common parent type:
```
[] (Q, U, A, B, C) {
    *{
        [[A]/[B]/[C]] abc = \[Q]:newQ;
        [[A]/[B]] ab = \[U]:newU;
        [[[A]/['Y]][[A]/['Y]]->['Y]] foo = *([[A]/["Y]] ay, [[A]/["Y]] ay2)->["Y] {} -> ay;
        [B] b = \foo abc ab;
    }
}

[U :[A] :[B]] (A, B) {
    ~ newU *{
        \$~newA;
        \$$~newB;
    }
}

[Q :[A] :[B] :[C]] (A, B, C) {
    ~ newQ *{
        \$~newA;
        \$$~newB;
        \$$$~newC;
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}

[C] {
    ~ newC *{}
}
```
Matching an object to multiple unknown method generics in a disjoint type is not allowed since it is ambiguous:
```
[] (Q, A, B, C) {
    *{
        [[A]/[B]/[C]] abc = \[Q]:newQ;
        [[['X]/['Y]]->['Y]] foo = *([["X]/["Y]] xy)->["Y] {} -> xy;
        [[A]/[C]] ac = \foo abc;  @ Invalid; abc is being matched to the input type [['X]/['Y]] which has more then one unknown generic type
        [C] c = \foo abc;         @ Invalid; abc is being matched to the input type [['X]/['Y]] which has more then one unknown generic type
    }
}

[Q :[A] :[B] :[C]] (A, B, C) {
    ~ newQ *{
        \$~newA;
        \$$~newB;
        \$$$~newC;
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}

[C] {
    ~ newC *{}
}
```
Matching an object to multiple method generics is possible if the other method generics are determinable through other inputs:
```
[] (Q, U, A, B, C) {
    *{
        [[A]/[B]/[C]] abc = \[Q]:newQ;
        [A] a = \[A]:newA;
        [[A]/[B]] a = \[U]:newU;
        [['X][['X]/['Y]]->['Y]] foo = *(["X] x, [["X]/["Y]] xy)->["Y] {} -> xy;
        [[B]/[C]] bc = \foo a abc;
        [C] c = \foo ab abc;
    }
}

[U :[A] :[B]] (A, B) {
    ~ newU *{
        \$~newA;
        \$$~newB;
    }
}

[Q :[A] :[B] :[C]] (A, B, C) {
    ~ newQ *{
        \$~newA;
        \$$~newB;
        \$$$~newC;
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}

[C] {
    ~ newC *{}
}
```

An object with a disjoint type cannot access methods without inherited visibility, unless it is [type cast](#type-casting) or assigned to a non-disjoint type:
```
[] (Q, A) {
    *{
        [[A]/[Q]] aq = \[Q]:newQ;
        \aq:nonInheritedMethodA;      @ Invalid; nonInheritedMethodA does not have inherited visibility
        \aq:nonInheritedMethodQ;      @ Invalid; nonInheritedMethodQ does not have inherited visibility
        \aq:inheritedMethodA;         @ Valid; inheritedMethodA has inherited visibility
        \aq:inheritedMethodQ;         @ Valid; inheritedMethodQ has inherited visibility
        [A] a = aq;
        [Q] q = aq;
        \a:nonInheritedMethodA;       @ Valid; nonInheritedMethodA invoked on object with declared type [A]
        \q:nonInheritedMethodQ;       @ Valid; nonInheritedMethodQ invoked on object with declared type [Q]
        \[A](aq):nonInheritedMethodA; @ Valid; nonInheritedMethodQ invoked on object cast to type [A]
        \[Q](aq):nonInheritedMethodQ; @ Valid; nonInheritedMethodQ invoked on object cast to type [Q]
    }
}

[Q :[A] (A) {
    ~ newQ *{
        \$~newA;
    }
    ++- nonInheritedMethodQ *{}
    +++ inheritedMethodQ *{}
}

[A] {
    ~ newA *{}
    ++- nonInheritedMethodA *{}
    +++ inheritedMethodA *{}
}
```

An object with a disjoint type cannot be invoked as a lambda method, unless it is [type cast](#type-casting) or assigned to a non-disjoint type:
```
[] {
    *{
        [[->]/[->]] lambdaDisjoint = *{};
        [->] lambdaNonDisjoint = lambdaDisjoint;
        \lambdaDisjoint;    @ Invalid; a disjoint type cannot be invoked as a lambda method
        \lambdaNonDisjoint; @ Valid; assigned as a non disjoint type
        \[->](lambdaDisjoint); @ Valid; cast to a non disjoint type
    }
}
```

Type and constructor methods cannot be invoked from a disjoint type:
```
[] (Q, A, B) {
    *{
        \[[A]/[Q]]:typeMethodA;          @ Invalid; typeMethodA is a type method and cannot be invoked from a disjoint type
        \[[A]/[Q]]:typeMethodQ;          @ Invalid; typeMethodQ is a type method and cannot be invoked from a disjoint type
        \[A]:typeMethodA;                @ Valid
        \[Q]:typeMethodQ;                @ Valid
        [[A]/[Q]] aq1 = \[[A]/[Q]]:newQ; @ Invalid; newQ is a constructor and cannot be invoked from a disjoint type
        [[A]/[Q]] aq2 = \[Q]:newQ;       @ Valid
    }
}

[Q :[A] (A) {
    ~ newQ *{
        \$~newA;
    }
    :: typeMethodQ *{}
}

[A] {
    ~ newA *{}
    :: typeMethodA *{}
}
```

There are no restrictions on which types can be used in a disjoint type. This applies even it would be impossible for an object matching the type to exist. In the following example, a method **impossibleToInvoke** is created but can never be invoked because it is impossible to create an object of type **[[->[B]]/[A]]**.
```
[] (B) {
    *{
        [[[->[B]]/[A]]->] impossibleToInvoke = *([[->[B]]/[A]] impossibleInput) {};
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}
```

## Duplicate Inheritance

Inheriting from the same class multiple times is allowed. In the following example, **A** inherits from **B** three times.
```
[A :[B] :[B] :[B]] (B) {}
[B] {}
```
**A** does not inherit any class methods from **B**, if it did, each method would clash with itself three times over as each method from **B** is inherited three times. For resolving these issues, [see overloading and underloading.](#overloading-and-underloading)

A class cannot inherit from itself, thus the following is invalid:
```
[A :[A]] {} @ Invaliid
```

A class can inherit multiple times from a class which has class generics. ([See inheriting from types with generics.](#inheriting-from-types-with-generics)) The following shows a valid example of inheritance where **A** inherits from **Foo** multiple times, where **Foo** has two generic instantiations.
```
[A :[Foo<[B][C]>] :[Foo<[B][C]>] :[Foo<[D][D]>] :[Foo<[B][A]>]] (Foo, B, C, D) {} 
[Foo<M,N>] {}
[B] {}
[C] {}
[D] {}
```
In the above example no class methods were added and so there are no method conflicts, but it would be normal to expect conflicts to arise when inheriting from a class generic class multiple times. For resolving these issues, [see overloading and underloading.](#overloading-and-underloading)

A class can inherit from classes which have common parent types. In the following example, **A** inherits from **[B]** and **[C]** which both have a common parent **[D]**. 
```
[A :[B] :[C]] (B, C) {}
[B :[D]] (D) {}
[C :[D]] (D) {}
```
The previous exmple is equivalent to duplicate inheritance as **A** is considered to be inheriting from **[D]** twice, once through **[B]** and a second time through **[C]**.

A class which inherts from the same type multiple times does not pass on two inheritance copies to future children. In other words, if a class inherits from a type which itself inherits from duplicate types, the class is considered to be only inheriting from the duplicated type once. In the following example, class **B** inherits from **[C]** twice, but **A** only inherits from **[C]** once.
```
[A :[B]] (B) {}
[B :[C] :[C]] (C) {}
[C] {}
```
If we add a fully visible method to **C** then we also must override the method in **B** to resolve the duplicate method conflict, but we dont need to override the same method in **A** because the duplicate was already resolved by **B** (For resolving these issues, [see overloading and underloading.](#overloading-and-underloading)):
```
[A :[B]] (B) {
    @ no duplicate method conflicts
}
[B :[C] :[C]] (C) {
    |++ method *{} @ override required to resolve duplicate method conflict
}
[C] {
    |++ method *{}
}
```

## Flexible Method Expression

A method expression can be written without the output type and method body, in which case the output type of the method is infered by the type of the output expression ([see type inference of method outputs](#type-inference-of-method-outputs)). **method1** and **method2** are rewritten as **method1Re** and **method2Re** without the output type and method body:
```
[] (A, B) {
    *{
        @@ start of original methods @@
        [[A][B]->[B]] method1 =   *([A]aInput,[B]bInput)->[B] {} -> bInput;
        [->[A]] method2 =         *->[A] {} -> \[A]:newA;
        @@ end of original methods @@

        @@ start of rewritten methods @@
        [[A][B]->[B]] method1Re = *([A]aInput,[B]bInput) -> bInput;
        [->[A]] method2Re =       *-> \[A]:newA;
        @@ end of rewritten methods @@
    }
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}
```

A method body can be written as a single statement instead of a group of statements surrounded by curly brackets **{}**. **method3**, **method4** and **method5** are rewritten as **method3Re**, **method4Re** and **method5Re** with a single statement for a method body:
```
[] (A, B) {
    *{
        @@ start of original methods @@
        [->[A]] method3 =         *->[A] {[A] aOutput = \[A]:newA;} -> aOutput;
        [->] method4 =            *{[A] aResult = \method3;};
        [[A]->] method5 =         *([A] a) {\a:foo;};
        @@ end of original methods @@

        @@ start of rewritten methods @@
        [->[A]] method3Re =       *->[A] [A] aOutput = \[A]:newA -> aOutput;
        [->] method4Re =          *[A] aResult = \method3;
        [[A]->] method5Re =       *([A] a) \a:foo;
        @@ end of rewritten methods @@
    }
}

[A] {
    ~ newA *{}
    ++ foo *{}
}
```


Consider the following example where instance and type methods are captured in lambda objects:
```
[] (A) {
    *{
        [->[A]] newALambda = *->[A] {} -> \[A]:newA;        @ type method (constructor) [A]:newA captured
        [->[A]] createALambda = *->[A] {} -> \[A]:createA;  @ type method [A]:createA captured
        [A] a1 = \newALambda;
        [A] a2 = \createALambda;
        [->] a1DoThingLambda = *{\a1:doThing;};             @ instance method a1:doThing captured
        [->] a2DoThingLambda = *{\a2:doThing;};             @ instance method a2:doThing captured
        \a1DoThingLambda;
        \a2DoThingLambda;
        [[A]->] useALambda = *([A] a) {\[A]:useA a;};       @ type method [A]:useA captured
        \useALambda a1;
    }
}

[A] {
    ~ newA *{}
    :: createA *->[A] {} -> \[A]:newA
    ++ doThing *{}
    :: useA *([A] a){}
}
```
In the above example, invoking **newALambda**, **createALambda**, **a1DoThingLambda**, **a2DoThingLambda** and **useALambda** is the same as invoking **[A]:newA**, **[A]:createA**, **a1:doThing**, **a2:doThing** and **[A]:useA** respectively. Instance and type methods can be captured as lambda objects by refering to them directly in an expression. The previous example is rewritten so that the instance and type methods are captured as lambda objects directly:
```
[] (A) {
    *{
        [->[A]] newALambda = [A]:newA;
        [->[A]] createALambda = [A]:createA;
        [A] a1 = \newALambda;
        [A] a2 = \createALambda;
        [->] a1DoThingLambda = a1:doThing;
        [->] a2DoThingLambda = a2:doThing;
        \a1DoThingLambda;
        \a2DoThingLambda;
        [[A]->] useALambda = [A]:useA;
        \useALambda a1;
    }
}

[A] {
    ~ newA *{}
    :: createA *->[A] {} -> \[A]:newA
    ++ doThing *{}
    :: useA *([A] a) {}
}
```
Self and parent methods can similarly be referred to as lambda objects. In the following example, invoking **doThingSelf** and **doThingParent** is the same as invoking **:doThing** and **$doThing**.
```
[A :[B]] (B) {
    - foo *{
        [->] doThingSelf = :doThing;
        [->] doThingParent = $doThing;
        \doThingSelf;
        \doThingParent;
    }
    
    ~ newA *{
        \$~newB;
    }
    |++ doThing *{}
}

[B] {
    ~ newB *{}
    ++ doThing *{}
}
```
A self or parent method which is captured in a lambda object will always be invoked on the same object in which it was captured. In the following example, when **a:foo** is invoked this will result in the **:doThing** and **$doThing** methods being invoked on the object **a**, **:doThing** and **$doThing** will not be invoked on the object **anotherA**.
```
[] (A) {
    *{
        [A] a = \[A]newA;
        \a:foo;
    }
}

[A :[B]] (B) {
    ++ foo *{
        [->] doThingSelf = :doThing;
        [->] doThingParent = $doThing;
        [A] anotherA = \[A]newA;
        \anotherA:invoke2Lambdas doThingSelf doThingParent;
    }
    
    ~ newA *{
        \$~newB;
    }
    |++ doThing *{}

    ++ invoke2Lambdas *([->] lambda1, [->] lambda2) {
        \lambda1;
        \lambda2;
    }
}

[B] {
    ~ newB *{}
    ++ doThing *{}
}
```
If an overloaded class method is refered to directly, then the choice of method is ambiguous and thus it is invalid ([see overloading class methods](#overloading-and-underloading-class-methods)):
```
[] (C, D) {
    *{
        [[C]->] fooWithC = [C]:foo; @ Invalid; method choice is ambiguous
        [[D]->] fooWithD = [C]:foo; @ Invalid; method choice is ambiguous
    }
}

[C] (D) {
    ~ newC *{}
    :: foo *([C] c) {}
    :: foo *([D] d) {}
}

[D] {
    ~ newD *{}
}
```
An overloaded method can be chosen explicitly by [type casting](#type-casting) the overloaded method to the lambda type which matches one of the overloaded methods, solving the issue from the previous example:
```
[] (C, D) {
    *{
        [[C]->] fooWithC = [[C]->]([C]:foo); @ Valid; method choice is explicit
        [[D]->] fooWithD = [[D]->]([C]:foo); @ Valid; method choice is explicit
    }
}

[C] (D) {
    ~ newC *{}
    :: foo *([C] c) {}
    :: foo *([D] d) {}
}

[D] {
    ~ newD *{}
}
```

Class methods and the entry point method can be defined with an expression (this can be a [compound expression](#compound-expressions-and-statements)). Considered the following example where the method **bar**, **createA**, **doThing** and the entry point method have been defined using expressions which evautate to lambda objects:
```
[] (A) {
    [A]:bar
}

[A] {
    :: bar (\[A]:newA):doThing
    :: createA [A]:newA
    ++ doThing :doSomethingElse

    ~ newA *{}
    - doSomethingElse *{}
}
```

- Entry point method is defined as **[A]:bar**
- Type method **bar** is defined as **(\\[A]:newA):doThing**
- Type method **createA** is defined as **[A]:newA**
- Instance method **doThing** is defined as **:doSomethingElse**

When a class or entry point method is defined with an expression, the type of the method is determined by the type of the expression. 

- Entry point method has the type of **[A]:bar** which is **[->]**
- Type method **bar** has the type of **(\\[A]:newA):doThing** which is **[->]**
- Type method **createA** has the type of **[A]:newA** which is **[->[A]]**
- Instance method **doThing** has the type of **:doSomethingElse** which is **[->]**

When a class or entry point method is invoked, the expression is evaluated first before the resulting method is invoked. The previous example is rewritten to show how the expressions are evaulated:
```
[] (A) {
    *{
        [->] entryPoint = [A]:bar;
        \entryPoint; 
    }
}

[A] {
    :: bar *{
        [->] bar = (\[A]:newA):doThing;
        \bar;
    }

    :: createA *->[A] {
        [->[A]] createA = [A]:newA;
    } -> \createA;

    ++ doThing *{
        [->] doThing = :doSomethingElse;
        \doThing;
    }

    ~ newA *{}
    - doSomethingElse *{}
}
```
Contructors methods must be defined in the usual way, using an expresion to define a constructor is not allowed:
```
[A] {
    ~ newA [A]:constructA   @ Invalid
    ~ newB *{}              @ Valid
    :: constructA *{}
}
```


## Inheriting from Types with Generics

A class can inherit from a type with class generics. Each generic of the inherited class must be instantiated by a type. In the following example, **AContainer** inherits from **[Container<[A]>]**.
```
[AContainer :[Container<[A]>]] (A, Container) 
{
    ~ containerOfA *([A] a) {
        \$~containerOf a;
    }
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ newA *{}
}
```
**[Container<[A]>]** is a parent type of **[AContainer]**. All the instances of the generic type in the parent class are replaced with the instantiated type. In this case the instantiated type is **[A]**, so **AContainer** inherits the method **getObject** from **[Container<[A]>]** which returns an object of the type **[A]**. Some example statements are added:
```
[] (AContainer, A, Container) {
    *{
        [A] a = \[A]:newA;
        [AContainer] aContainer = \[AContainer]:containerOfA a;
        [Container<[A]>] containerA = aContainer;
        [A] aFromAContainer = \aContainer:getObject;
        [A] aFromContainer = \containerA:getObject;
    }
}

[AContainer :[Container<[A]>]] (A, Container) 
{    
    ~ containerOfA *([A] a) {
        \$~containerOf a;
    }
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ newA *{}
}
```
In the above example, **a** is the same object as **aFromContainer** and **aFromAContainer**.

Methods from a parent type with class generics can be overriden. **getObject** is overriden in **AContainer** to return a new **[A]** object:
```
[] (AContainer, A, Container) {
    *{
        [A] a = \[A]:newA;
        [AContainer] aContainer = \[AContainer]:containerOfA a;
        [Container<[A]>] containerA = aContainer;
        [A] aFromAContainer = \aContainer:getObject;
        [A] aFromContainer = \containerA:getObject;
    }
}

[AContainer :[Container<[A]>]] (A, Container) {
    
    ~ containerOfA *([A] a) {
        \$~containerOf a;
    }

    |++ getObject *->[A] {} -> \[A]:newA
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ newA *{}
}
```
In the above example, **aFromContainer**, **aFromAContainer** and **a** are all different objects.

Anonymous classes can also inherit from classes with class generics. The previous example is rewritten with a anonymous class defining the object **containerA**, and as from before; **aFromContainer** and **a** are different objects:
```
[] (AContainer, A, Container) {
    *{
        [A] a = \[A]:newA;
        [Container<[A]>] containerA = [:[Container<[A]>]] {
                \$~containerOf a;
                |++ getObject *->[A] {} -> \[A]:newA
            };
        [A] aFromContainer = \containerA:getObject;
    }
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ newA *{}
}
```
An inherited generic type can be instantiated using class generics from the inheriting class. In the following example, **ContainerPlus** inherits from **[Container<[&N]>]**, where **[&N]** is a class generic type of **ContainerPlus**.
```
[ContainerPlus<N> :[Container<[&N]>]] (Container) {

    ~ containerPlusOf *([&N] object) {
        \$~containerOf object;
    }
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}
```
Parent types can be found by substituting the instantiated types into the parent type. In other words, **[Container<[A]>]** is a parent type of **[ContainerPlus<[A]>]** by substituting **[A]** as **[&N]** where the inherited parent type is **[Container<[&N]>]**, similarly for substituting **[B]** as **[&N]**:
```
[] (ContainerPlus, A, B, Container) {
    *{
        [A] a = \[A]:newA;
        [B] b = \[B]:newB;
        [ContainerPlus<[A]>] containerPlusOfA = \[ContainerPlus<[A]>]:containerPlusOf a;
        [ContainerPlus<[B]>] containerPlusOfB = \[ContainerPlus<[B]>]:containerPlusOf b;
        [Container<[A]>] containerOfA = containerPlusOfA; @ [Container<[A]>] is a parent type of [ContainerPlus<[A]>]
        [Container<[B]>] containerOfB = containerPlusOfB; @ [Container<[B]>] is a parent type of [ContainerPlus<[B]>]
    }
}

[ContainerPlus<N> :[Container<[&N]>]] (Container) {

    ~ containerPlusOf *([&N] object) {
        \$~containerOf object;
    }
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}
```
Class generic types can be instantiated with any type, this is also true when inheriting. In the following example, **ContainerPlus** inherits from **[Container<[[[&M]/[C]]->[&N]]>]** (**[[&M]/[C]]** is a [disjoint type](#disjoint-types) of **[&M]** and **[C]**) where **[&M]** and **[&N]** are class generics of **ContainerPlus**.
```
[] (ContainerPlus, A, B, Container) {
    *{
        [[[A]/[C]]->[B]] acToB = *([[A]/[C]] ac)->[B] {} -> \[B]newB;
        [ContainerPlus<[A][B]>] containerPlusAB = \[ContainerPlus<[A][B]>]:containerPlusOf acToB;
        [Container<[[[A]/[C]]->[B]]>] containerOfACToB = containerPlusAB;
    }
}

[ContainerPlus<M,N> :[Container<[[[&M]/[C]]->[&N]]>]] (Container) {

    ~ containerPlusOf *([[[&M]/[C]]->[&N]] object) {
        \$~containerOf object;
    }
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ newA *{}
}

[B] {
    ~ newB *{}
}

[C] {
    ~ newC *{}
}
```
**[Container<[[[A]/[C]]->[B]]>]** is a parent type of **[ContainerPlus<[A][B]>]**, which is determined by substituting **[A]** as **[&M]** and **[B]** as **[&N]** into **[Container<[[[&M]/[C]]->[&N]]>]**.

A class can use itself in a generic instantiation of its parent type. In the following example, **RecursiveReceiver** inherits from **[Container<[&M]>]**, **[Receiver<[&M]>]** and **[Receiver<[RecursiveReceiver<[&M]>]>]**, where **[&M]** is a class generic type of **RecursiveReceiver**.
```
[] (RecursiveReceiver, A, Receiver) {
    *{
        [A] a1 = \[A:newA;
        [A] a2 = \[A:newA;
        [RecursiveReceiver<[A]>] recursiveReceiverOfA1 = \[RecursiveReceiver<[A]>]:recursiveReceiverOf a1;
        [RecursiveReceiver<[A]>] recursiveReceiverOfA2 = \[RecursiveReceiver<[A]>]:recursiveReceiverOf a2;
        \recursiveReceiverOfA2:receive a1;                      @ recursiveReceiverOfA2 receives a1
        \recursiveReceiverOfA1:receive recursiveReceiverOfA2;   @ recursiveReceiverOfA1 receives a2
        [Container<[A]>] containerOfA1 = recursiveReceiverOfA1;
        [Container<[A]>] containerOfA2 = recursiveReceiverOfA2;
        [Receiver<[A]>] receiverOfA1 = recursiveReceiverOfA1;
        [Receiver<[A]>] receiverOfA2 = recursiveReceiverOfA2;
        [Receiver<[RecursiveReceiver<[A]>]>] receiverOfRecursiveReceiverOfA1 = recursiveReceiverOfA1;
        [Receiver<[RecursiveReceiver<[A]>]>] receiverOfRecursiveReceiverOfA2 = recursiveReceiverOfA2;
    }
}

[RecursiveReceiver<M> :[Container<[&M]>] :[Receiver<[&M]>] :[Receiver<[RecursiveReceiver<[&M]>]>]] (Receiver, Container) 
{
    ~ recursiveReceiverOf *([&M] object) {
        \$~containerOf object;
        \$$~init;
        \$$$~init;
    }

    |++ receive *([RecursiveReceiver<[&M]>] receiver) {
        [&M] object = \receiver:getObject;
        \:receive object;
    }
}

[Receiver<E>]
{
    ~ init *{}
    ++ receive *([&E] object) {}
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}

[A] {
    ~ newA *{}
}
```
In the above example, the method **receive** is overloaded in **RecursiveReceiver** as both **[[RecursiveReceiver<[&M]>]->\]** and **[[&M]->]** ([see overloading class methods](#overloading-and-underloading-class-methods)).


## The Lexical Splitter

**\`** is the lexical splitter. The lexical splitter is used in pairs, the second usage must come just before a token ([see grammar](#grammar)). The token is 'stitched' to the end of the first lexical splitter. Take the following example:
```
[] (Line, Point) {
    [Point] a = \[Point]:randomPoint;
    [Point] b = \[Point]:randomPoint;
    [Line] lineAB = \[Line]:newLineFromPointToPoint a b;
}

[Line] (Point) 
    [Point] p1
    [Point] p2
{
    ~ newLineFromPointToPoint *([Point] p1, [Point] p2) {
        .p1 = p1;
        .p2 = p2;
    }
}

[Point] {
    ~ randomPoint *{}
}
```
Using the lexical splitter, the previous example is rewritten so that the identifier **newLineFromPointToPoint** is spliced between method inputs:
```
[] (Line, Point) {
    [Point] a = \[Point]:randomPoint;
    [Point] b = \[Point]:randomPoint;
    [Line] lineAB = \[Line]:newLine``FromPoint` a `ToPoint b;
}

[Line] (Point) 
    [Point] p1
    [Point] p2
{
    ~ newLine` *(`FromPoint` [Point] p1, `ToPoint [Point] p2) {
        .p1 = p1;
        .p2 = p2;
    }
}

[Point] {
    ~ randomPoint *{}
}
```
The lexical splitter is whitespace agnostic, so this code can be reformatted so that the identifier appears over multiple lines:
```
[] (Line, Point) {
    [Point] a = \[Point]:randomPoint;
    [Point] b = \[Point]:randomPoint;
    [Line] lineAB = \[Line]:newLine`
                            `FromPoint` a 
                            `ToPoint b;
}

[Line] (Point) 
    [Point] p1
    [Point] p2
{
    ~ newLine` *(   `FromPoint` [Point] p1, 
                    `ToPoint [Point] p2
                ) {
        .p1 = p1;
        .p2 = p2;
    }
}

[Point] {
    ~ randomPoint *{}
}
```
The use of the lexical splitter is simply a syntactical sugar. In other words, the use of the lexical splitter does not influence the code outside of the single instance of reformatting. It can be used differently for the same identifier in different places, as in the following example where the invocation of **[Line]:newLineFromPointToPoint** is reverted back to its normal form:
```
[] (Line, Point) {
    [Point] a = \[Point]:randomPoint;
    [Point] b = \[Point]:randomPoint;
    [Line] lineAB = \[Line]:newLineFromPointToPoint a b;
}

[Line] (Point) 
    [Point] p1
    [Point] p2
{
    ~ newLine` *(`FromPoint` [Point] p1, `ToPoint [Point] p2) {
        .p1 = p1;
        .p2 = p2;
    }
}

[Point] {
    ~ randomPoint *{}
}
```
Likewise, the inverse is possible:
```
[] (Line, Point) {
    [Point] a = \[Point]:randomPoint;
    [Point] b = \[Point]:randomPoint;
    [Line] lineAB = \[Line]:newLine``FromPoint` a `ToPoint b;
}

[Line] (Point) 
    [Point] p1
    [Point] p2
{
    ~ newLineFromPointToPoint *([Point] p1, [Point] p2) {
        .p1 = p1;
        .p2 = p2;
    }
}

[Point] {
    ~ randomPoint *{}
}
```
The following is an example of splitting the identifier in two different ways:
```
[] (Line, Point) {
    [Point] a = \[Point]:randomPoint;
    [Point] b = \[Point]:randomPoint;
    [Line] lineAB = \[Line]:newLineFromPoint` a `ToPoint b;
}

[Line] (Point) 
    [Point] p1
    [Point] p2
{
    ~ newLine` *([Point] `FromPoint` p1, [Point] `ToPoint p2) {
        .p1 = p1;
        .p2 = p2;
    }
}

[Point] {
    ~ randomPoint *{}
}
```
Adding usages of the lexical splitter on tokens other then identifiers to the previous example:
```
[] (Line, Point) {
    [Point] a = `[Point`\]:randomPoint;
    [Point] b = \[Point`:randomPoint`];
    [Line] lineAB = \[Line]:newLineFromPoint` a `ToPoint b;
}

[Line] `Point) 
    [Point] p1
    [Point] p2
{       `(
    ~ newLine` *([Point] `FromPoint` p1, [Point] `ToPoint p2) {
        .p1 = p1;
        .p2 = p2;
    }
}

[Point] {
    ~ randomPoint *{}
}
```

## Literals

Literals are not explicitly defined in the language itself. Instead, using the mechanism of [data segments](#data-segments), a given compiler can implement literals by encapulating them inside a [class](#classes-types-objects-and-dependancies). See [data segments](#data-segments) for examples.


## Object Proxy

An object proxy is both a parent of the original object and also a lambda which returns the original object. Given an object of type **[A]**, a proxy of this object will have the [disjoint type](#disjoint-types) of **[[A]/[->[A]]]**. A proxy of an object is declared by writing **\*-** followed by the original object. In the following example, **aProxy** is a proxy object of **a**.
```
[] (A) {
    *{
        [A] a = \[A]:newA;
        [[A]/[->[A]]] aProxy = *- a;
    }
}

[A] {
    ~ newA *{}
}
```
Since **aProxy** is a [disjoint type](#disjoint-types) it cannot be invoked as a lambda, but it is possible to invoke it when [type cast](#type-casting) or assigned as an object of type **[->[A]]**:
```
[] (A) {
    *{
        [A] a = \[A]:newA;
        [[A]/[->[A]]] aProxy = *- a;
        [->[A]] getA = aProxy;
        [A] a2 = \getA;                 @ Valid; invoked as an object with type [->[A]]
        [A] aCast = \[->[A]](aProxy);   @ Valid; invoked when type cast to type [->[A]]
        [A] aBad = \aProxy;             @ Invalid; disjoint type can't be invoked as a lambda
        
    }
}

[A] {
    ~ newA *{}
}
```
**a2** refers to the same object as **a**. In the following example **a3** refers to an object for which every invocation on **a3** is redirected to **a** thus **a3** is a proxy to **a**.
```
[] (A) {
    *{
        [A] a = \[A]:newA;
        [[A]/[->[A]]] aProxy = *- a;
        [->[A]] getA = aProxy;
        [A] a2 = \getA;
        [A] a3 = aProxy;
    }
}

[A] {
    ~ newA *{} 
}
```
Invoking the method **foo** on **aProxy** is valid since **foo** has inherited visibility ([see disjoint types](#disjoint-types)). Invoking the method **foo** on **a**, **a2**, **a3** or **aProxy** are all equivalent:
```
[] (A) {
    *{
        [A] a = \[A]:newA;
        [[A]/[->[A]]] aProxy = *- a;
        [->[A]] getA = aProxy;
        [A] a2 = \getA;
        [A] a3 = aProxy;
        \a:foo;
        \a2:foo;
        \a3:foo;
        \aProxy:foo; @Valid; foo has inherited visibility
    }
}

[A] {
    ~ newA *{}
    ++ foo *{}
}
```
Invoking the method **foo** on **aProxy** is invalid if **foo** doesnt have inherited visibility ([see disjoint types](#disjoint-types)):
```
[] (A) {
    *{
        [A] a = \[A]:newA;
        [[A]/[->[A]]] aProxy = *- a;
        [->[A]] getA = aProxy;
        [A] a2 = \getA;
        [A] a3 = aProxy;
        \a:foo;
        \a2:foo;
        \a3:foo;
        \aProxy:foo; @Invalid; foo does not have inherited visibility
    }
}

[A] {
    ~ newA *{}
    ++- foo *{}
}
```
An object proxy can be created for any object:
```
[] {
    *{
        [->] q = *{};
        [[->]/[->[->]]] qProxy = *- q;
    }
}
```


## Overloading and Underloading

### Overloading Class Methods

It is possible to have multiple class methods with the same name, in which case the method invocation is distinguished by the input types used when invoking. This is called overloading a class method. In the following example, the method **add** is overloaded five times:
```
[] (Meal, Food, Drink) {
    *{
        [Meal] meal = \[Meal]:new;
        [Food] food = \[Food]:new;
        [Drink] drink = \[Drink]:new;
        \meal:add;                               @ invoking add method #1
        \meal:add food;                          @ invoking add method #2
        \meal:add drink;                         @ invoking add method #3
        \meal:add drink drink;                   @ invoking add method #4
        \meal:add drink food;                    @ invoking add method #5
    }
}

[Meal] (Food, Drink) {
    ~ new *{}
    ++ add *() {}                               @ defining add method #1
    ++ add *([Food] food) {}                    @ defining add method #2
    ++ add *([Drink] drink) {}                  @ defining add method #3
    ++ add *([Drink] drink, [Drink] drink2) {}  @ defining add method #4
    ++ add *([Drink] drink, [Food] food) {}     @ defining add method #5
}

[Drink :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    } 
}

[Food :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    }
}

[Consumable] {
    ~ new *{}
}
```   
Overloaded methods are not required to have the same output types. Some outputs are added to the overloaded **add** methods:
```
[] (Meal, Food, Drink, Consumable) {
    *{
        [Meal] meal = \[Meal]:new;
        [Food] food = \[Food]:new;
        [Drink] drink = \[Drink]:new;
        \meal:add;                  
        \meal:add food;                         
        \meal:add drink;                     
        [Drink] drinkOutput = \meal:add drink drink; 
        [Consumable] consumableOutput = \meal:add drink food;                
    }
}

[Meal] (Food, Drink) {
    ~ new *{}
    ++ add *() {}         
    ++ add *([Food] food) {}    
    ++ add *([Drink] drink) {}
    ++ add *([Drink] drink, [Drink] drink2) -> [Drink] {} -> drink2
    ++ add *([Drink] drink, [Food] food) -> [Consumable] {} -> food
}

[Drink :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    } 
}

[Food :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    }
}

[Consumable] {
    ~ new *{}
}
``` 
An overloading method must have possible input types which dont match another method of the same name. The second input of **drink2** is redefined to the type **[Consumable]**, this is invalid since now all invocations of an existing **add** method match the newly redefined definition of **add** because every **[Food]** is a **[Consumable]**:
```
[] (Meal, Food, Drink, Consumable) {
    *{
        [Meal] meal = \[Meal]:new;
        [Food] food = \[Food]:new;
        [Drink] drink = \[Drink]:new;
        \meal:add;                  
        \meal:add food;                         
        \meal:add drink;                     
        [Drink] drinkOutput = \meal:add drink drink;          @ This invocation matches two definitions of add
        [Consumable] consumableOutput = \meal:add drink food; @ This invocation matches two definitions of add           
    }
}

[Meal] (Food, Drink) {
    ~ new *{}
    ++ add *() {}         
    ++ add *([Food] food) {}   
    ++ add *([Drink] drink) {}
    ++ add *([Drink] drink, [Consumable] drink2) -> [Drink] {} -> drink2 @ all invocations of the below add method match with this add method
    ++ add *([Drink] drink, [Food] food) -> [Consumable] {} -> food      @ Invalid; all invocations of this method match with the above add method
}

[Drink :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    } 
}

[Food :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    }
}

[Consumable] {
    ~ new *{}
}
``` 
Overloading methods can have some ambiguous input types which match multiple overloading methods, just that these inputs must be [cast](#type-casting) to remove abiguity when the method is invoked. In the following example, **foodAndDrink1** and **foodAndDrink2** cannot be an input to the **add** method without [casting](#type-casting) due to matching both **[Drink]** and **[Food]** ([see disjoint types](#disjoint-types) for **foodAndDrink2**).
```
[] (Meal, Food, Drink, Consumable, FoodAndDrink) {
    *{
        [Meal] meal = \[Meal]:new;
        [FoodAndDrink] foodAndDrink1 = \[FoodAndDrink]:new;
        [[Food]/[Drink]] foodAndDrink2 = \[FoodAndDrink]:new;               
        \meal:add foodAndDrink1;           @ Invalid; ambiguous invocation could refer to either add method                     
        \meal:add foodAndDrink2;           @ Invalid; ambiguous invocation could refer to either add method
        \meal:add [Food](foodAndDrink1);   @ Valid; invocation refers to first add method ++ add *([Food] food) {} 
        \meal:add [Drink](foodAndDrink2);  @ Valid; invocation refers to second add method ++ add *([Drink] drink) {}
    }
}

[Meal] (Food, Drink) {
    ~ new *{}     
    ++ add *([Food] food) {}    
    ++ add *([Drink] drink) {}
}

[FoodAndDrink :[Food] :[Drink]] (Food, Drink) {
    ~ new *{
        \$~new;
        \$$~new;
    } 
}

[Drink :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    } 
}

[Food :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    }
}

[Consumable] {
    ~ new *{}
}
```
When inheriting from multiple classes, overloading can occur between methods defined in seperate classes. The original example is rewritten such that two of the **add** methods are inherited from **[MealBeta]** and the other two from **[MealAlpha]**, the same overloads apply across these four methods:
```
[] (Meal, Food, Drink) {
    *{
        [Meal] meal = \[Meal]:new;
        [Food] food = \[Food]:new;
        [Drink] drink = \[Drink]:new;
        \meal:add;                  
        \meal:add food;                         
        \meal:add drink;                     
        \meal:add drink drink; 
        \meal:add drink food;                
    }
}

[Meal :[MealAlpha] :[MealBeta]] (Food, Drink, MealAlpha, MealBeta) {
    ~ new *{
        \$~new;
        \$$~new;
    }
    ++ add *() {}
}

[MealBeta] (Food, Drink) {
    ~ new *{}       
    ++ add *([Food] food) {} 
    ++ add *([Drink] drink) {}
}

[MealAlpha] (Food, Drink) {
    ~ new *{}
    ++ add *([Drink] drink, [Drink] drink2) {}
    ++ add *([Drink] drink, [Food] food) {}
}

[Drink :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    } 
}

[Food :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    }
}

[Consumable] {
    ~ new *{}
}
``` 
Method visibilities are not affected by overloading. In the following example, **add** is overloaded with three methods but only two of the overloads are visible outside **Meal**:
```
[] (Meal, Food, Drink) {
    *{
        [Meal] meal = \[Meal]:new;
        [Food] food = \[Food]:new;
        [Drink] drink = \[Drink]:new;
        \meal:add food drink;  @ Valid                  
        \meal:add drink drink; @ Valid  
        \meal:add drink food;  @ Invalid; not visible here             
    }
}

[Meal] (Food, Drink) {
    ~ new *{
        \$~new;
        \$$~new;
        [Food] food = \[Food]:new;
        [Drink] drink = \[Drink]:new;
        \:add food drink;     @ Valid                  
        \:add drink drink;    @ Valid  
        \:add drink food;     @ Valid
    }
    ++ add *([Food] food, [Drink] drink) {}
    ++ add *([Drink] drink, [Drink] drink2) {}
    + add *([Drink] drink, [Food] food) {}  
}

[Drink :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    } 
}

[Food :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    }
}

[Consumable] {
    ~ new *{}
}
``` 
Inherited methods only contribute to overloading if they have inherited visibility. In the following example, **add** inside **[MealAlpha]** is defined with a definition which would conflict inside **[Meal]**, but it does not clash because it lacks inherited visibility:
```
[] (Meal, Food, Drink) {
    *{
        [Meal] meal = \[Meal]:new;
        [Food] food = \[Food]:new;
        [Drink] drink = \[Drink]:new;                
        \meal:add food;                         
        \meal:add drink;            
    }
}

[Meal :[MealAlpha] :[MealBeta]] (Food, Drink, MealAlpha, MealBeta) {
    ~ new *{
        \$~new;
        \$$~new;
    }
    ++ add *([Food] food) {}
}

[MealBeta] (Food, Drink) {
    ~ new *{}          
    ++ add *([Drink] drink) {}
}

[MealAlpha] (Food, Drink, Consumable) {
    ~ new *{}
    -+- add *([Consumable] consumable) {} @ Valid; does not clash because it does not have external or inherited visibility
}

[Drink :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    } 
}

[Food :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    }
}

[Consumable] {
    ~ new *{}
}
``` 
Both class methods and constructor methods can be overloaded. Constructor and class methods can overload each other, such as in the following example where the invocation of **[Meal]:with** is overloaded with both contructor and class methods:
```
[] (Meal, Food, Drink) {
    *{
        [Food] food = \[Food]:new;
        [Drink] drink = \[Drink]:new;
        [Meal] mealFood = \[Meal]:with food;  
        [Meal] mealDrink = \[Meal]:with drink;  
        [Meal] mealFoodAndDrink = \[Meal]:with food drink;
        \mealFoodAndDrink:add food drink;                     
    }
}

[Meal :[MealAlpha] :[MealBeta]] (Food, Drink, MealAlpha, MealBeta) {
    ~ with *([Food] food) {
        \$~with food;
        \$$~new;
    }
    ~ with *([Drink drink]) {
        \$~with drink;
        \$$~new;
    }
    ++ add *([Drink] drink, [Food] food) {
        \$$add food;
        \$$add drink;
    }
    :: with *([Food] food, [Drink] drink) -> [Meal] {
        [Meal] meal = \[Meal]:with drink;
        \meal:add food;
    } -> meal
}

[MealBeta] (Food, Drink) {
    ~ new *{}          
    ++ add *([Drink] drink) {}
    ++ add *([Food] food) {}
}

[MealAlpha] (Food, Drink, Consumable) {
    ~ with *([Food] food) {}
    ~ with *([Drink drink]) {}
}

[Drink :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    } 
}

[Food :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    }
}

[Consumable] {
    ~ new *{}
}
``` 
The same conflict rules apply between constructor and type methods which are overloaded. A class method **[Meal]:with** is added which clashes with an existing constructor definition:
```
[] (Meal, Food, Drink) {
    *{
        [Food] food = \[Food]:new;
        [Drink] drink = \[Drink]:new;
        [Meal] mealFood = \[Meal]:with food;  
        [Meal] mealDrink = \[Meal]:with drink; @ Invalid; could refer to either constructor or class method
        [Meal] mealFoodAndDrink = \[Meal]:with food drink;
        \mealFoodAndDrink:add food drink;                     
    }
}

[Meal :[MealAlpha] :[MealBeta]] (Food, Drink, MealAlpha, MealBeta) {
    ~ with *([Food] food) {
        \$~with food;
        \$$~new;
    }
    ~ with *([Drink drink]) {
        \$~with drink;
        \$$~new;
    }
    ++ add *([Drink] drink, [Food] food) {
        \$$add food;
        \$$add drink;
    }
    :: with *([Food] food, [Drink] drink) -> [Meal] {
        [Meal] meal = \[Meal]:with drink;
        \meal:add food;
    } -> meal

    @@ start of clashing class method @@
    :: with *([Drink] drink) -> [Meal] {
        [Meal] meal = \[Meal]:with drink;
    } -> meal
    @@ end of clashing class method @@
}

[MealBeta] (Food, Drink) {
    ~ new *{}          
    ++ add *([Drink] drink) {}
    ++ add *([Food] food) {}
}

[MealAlpha] (Food, Drink, Consumable) {
    ~ with *([Food] food) {}
    ~ with *([Drink drink]) {}
}

[Drink :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    } 
}

[Food :[Consumable]] (Consumable) {
    ~ new *{
        \$~new;
    }
}

[Consumable] {
    ~ new *{}
}
``` 
Methods with class and method generics can be overloaded. Conflicts are determined by treating each generic type as a unique object such that **[&TYPE]** **[&TYPE2]** and **['TYPE]** do not conflict with one another even though generics could be instantiated with conflicting types:
```
[Foo <TYPE, TYPE2>] {
    ++ bar *([&TYPE] object) {}  @ Invalid; conflicts with next bar definition 
    ++ bar *([&TYPE] object) {}  @ Invalid; conflicts with previous bar definition
    ++ bar *([&TYPE2] object) {} @ Valid; does not conflict

    ++ bar *(["TYPE] object) {} @ Invalid; conflicts with next bar definition 
    ++ bar *(["TYPE] object) {} @ Invalid; conflicts with previous bar definition

    ++ bar *([&TYPE] object1, [&TYPE] object2) {} @ Valid; does not conflict 
    ++ bar *(["TYPE] object1, ["TYPE] object2) {} @ Valid; does not conflict
}
```
The following example of **LogicChecker** shows some valid invocations of overloaded methods with class and method generics.
```
[] (YES, NO, LogicChecker) {
    *{
        [YES] yes = \[YES]:yep;
        [NO] no = \[NO]:nope;
        [LogicChecker<[YES][NO]>] check = \[LogicChecker<[YES],[NO]>]:new;
        [YES] result1 = \check:OR yes no;    @ Invokes second OR method
        [YES] result2 = \check:OR no yes;    @ Invokes third OR method
        [NO] result3 = \check:AND no yes;    @ Invokes second AND method
        [NO] result4 = \check:AND yes no;    @ Invokes third AND method
        [YES] result5 = \check:AND yes yes;  @ Invokes first AND method
        [NO] result6 = \check:AND no no;     @ Invokes first AND method
    }
}

[YES] { ~ yep *{} }
[NO] { ~ nope *{} }

[LogicChecker <TRUE, FALSE>] {
    ~ new *{}

    ++ OR *([&TRUE] true, [&TRUE] true2) -> [&TRUE] {} -> true 
    ++ OR *([&TRUE] true, [&FALSE] false) -> [&TRUE] {} -> true 
    ++ OR *([&FALSE] false, [&TRUE] true) -> [&TRUE] {} -> true 
    ++ OR *([&FALSE] false, [&FALSE] false2) -> [&FALSE] {} -> false 

    ++ AND *(["ANY] any, ["ANY] any2) -> ["ANY] {} -> any 
    ++ AND *([&FALSE] false, [&TRUE] true) -> [&FALSE] {} -> false 
    ++ AND *([&TRUE] true, [&FALSE] false) -> [&FALSE] {} -> false 
}
```
The following example shows **LogicChecker** instantiated with **[YES]** for both class generics and some resulting conflicts.
```
[] (YES, NO, LogicChecker) {
    *{
        [YES] yes = \[YES]:yep;
        [NO] no = \[NO]:nope;
        [LogicChecker<[YES][YES]>] check = \[LogicChecker<[YES],[NO]>]:new;
        [YES] result1 = \check:OR yes yes;  @ Invalid; invocation is invalid matching all four OR methods
        [YES] result2 = \check:AND yes yes; @ Invalid; invocation is ambiguous matching all three AND methods
        [NO] result3 = \check:AND no no;    @ Valid; invokes the first AND method
    }
}

[YES] { ~ yep *{} }
[NO] { ~ nope *{} }

[LogicChecker <TRUE, FALSE>] {
    ~ new *{}

    ++ OR *([&TRUE] true, [&TRUE] true2) -> [&TRUE] {} -> true 
    ++ OR *([&TRUE] true, [&FALSE] false) -> [&TRUE] {} -> true 
    ++ OR *([&FALSE] false, [&TRUE] true) -> [&TRUE] {} -> true 
    ++ OR *([&FALSE] false, [&FALSE] false2) -> [&FALSE] {} -> false 

    ++ AND *(["ANY] any, ["ANY] any2) -> ["ANY] {} -> any 
    ++ AND *([&FALSE] false, [&TRUE] true) -> [&FALSE] {} -> false 
    ++ AND *([&TRUE] true, [&FALSE] false) -> [&FALSE] {} -> false 
}
```


### Underloading Class Methods

An overriding method can have inputs which are parent types of the original inputs, and the output can be a child type of the original output. When some inputs and/or the output of an overriding method is different to the original types, this is called underloading. The **[BetterCandyCrusher]** overrides the **process** method with a parent input and child output:
```
[BetterCandyCrusher :[UnreliableCandyCrusher]] (WrappedCandy, Candy, UnreliableCandyCrusher, CrushedCandy) {
    ~ new *{}

    |++ process *([Candy] candy) -> [CrushedCandy] {
        [CrushedCandy] crushedCandy = \[CrushedCandy]:crushed candy;
    } -> crushedCandy
}

[UnreliableCandyCrusher] (WrappedCandy, Candy) {
    ++ process *([WrappedCandy] wrappedCandy) -> [Candy] {} -> wrappedCandy
}

[CrushedCandy :[Candy]] (Candy) {
    ~ crushed *([Candy] candy) {
        \$~new;
    }
}

[WrappedCandy :[Candy]] (Candy) {
    ~ wraped *([Candy] candy) {
        \$~new;
    }
}

[Candy] {
    ~ new *{}
}
```

Underloading allows for one method to override multiple methods from parent classes. The **[BetterCandyCrusher]** overrides both **process** methods from **[UnreliableCandyCrusher]** with a parent input and child output:
```
[BetterCandyCrusher :[UnreliableCandyCrusher]] (WrappedCandy, Candy, UnreliableCandyCrusher, CrushedCandy) {
    |++ process *([Candy] candy) -> [CrushedCandy] {
        [CrushedCandy] crushedCandy = \[CrushedCandy]:crushed candy;
    } -> crushedCandy
}

[UnreliableCandyCrusher] (WrappedCandy, Candy, CrushedCandy) {
    ++ process *([WrappedCandy] wrappedCandy) -> [Candy] {} -> wrappedCandy
    ++ process *([CrushedCandy] crushedCandy) -> [CrushedCandy] {} -> crushedCandy
}

[CrushedCandy :[Candy]] (Candy) {
    ~ crushed *([Candy] candy) {
        \$~new;
    }
}

[WrappedCandy :[Candy]] (Candy) {
    ~ wraped *([Candy] candy) {
        \$~new;
    }
}

[Candy] {
    ~ new *{}
}
```

Underloading can be used to resolve conflicts when there are multiple inherited methods with the same name but with different input or output types. **[CandyCrusherWrapper]** overrides both **process** methods from **[CandyCrusher]** and **[CandyWrapper]** with a single method, the output of the overriding **process** is a [disjoint type](#disjoint-types) of the outputs from the parent **process** methods:
```
[CandyCrusherWrapper :[CandyCrusher] :[CandyWrapper]] (WrappedCandy, Candy, CandyCrusher, CandyWrapper, CrushedCandy, WrappedAndCrushedCandy) {
    |++ process *([Candy] candy) -> [[WrappedCandy]/[CrushedCandy]] {
        [[WrappedCandy]/[CrushedCandy]] crushedAndWrappedCandy = \[WrappedAndCrushedCandy]:wrapedAndCrushed candy;
    } -> crushedAndWrappedCandy
}

[CandyCrusher] (Candy, CrushedCandy) {
    ++ process *([Candy] candy) -> [CrushedCandy] {
        [CrushedCandy] crushedCandy = \[CrushedCandy]:crushed candy;
    } -> crushedCandy
}

[CandyWrapper] (Candy, WrappedCandy) {
    ++ process *([Candy] candy) -> [WrappedCandy] {
        [WrappedCandy] wrappedCandy = \[WrappedCandy]:wraped candy;
    } -> wrappedCandy
}

[WrappedAndCrushedCandy :[WrappedCandy] :[CrushedCandy]] (Candy, CrushedCandy, WrappedCandy) {
    ~ wrapedAndCrushed *([Candy] candy) {
        \$~>wrappedCandy;
        \$$~>crushedCandy;
    }
}

[CrushedCandy :[Candy]] (Candy) {
    ~ crushed *([Candy] candy) {
        \$~new;
    }
}

[WrappedCandy :[Candy]] (Candy) {
    ~ wraped *([Candy] candy) {
        \$~new;
    }
}

[Candy] {
    ~ new *{}
}
```

Underloading can also be used with type methods. The following is like the prior example except using type methods instead of instance methods ([see inheritance of type methods](#visibility-and-inheritance-of-constructor-and-type-methods)):
```
[CandyCrusherWrapper :[CandyCrusher] :[CandyWrapper]] (WrappedCandy, Candy, CandyCrusher, CandyWrapper, CrushedCandy, WrappedAndCrushedCandy) {
    |::++ process *([Candy] candy) -> [[WrappedCandy]/[CrushedCandy]] {
        [[WrappedCandy]/[CrushedCandy]] crushedAndWrappedCandy = \[WrappedAndCrushedCandy]:wrapedAndCrushed candy;
    } -> crushedAndWrappedCandy
}

[CandyCrusher] (Candy, CrushedCandy) {
    ::++ process *([Candy] candy) -> [CrushedCandy] {
        [CrushedCandy] crushedCandy = \[CrushedCandy]:crushed candy;
    } -> crushedCandy
}

[CandyWrapper] (Candy, WrappedCandy) {
    ::++ process *([Candy] candy) -> [WrappedCandy] {
        [WrappedCandy] wrappedCandy = \[WrappedCandy]:wraped candy;
    } -> wrappedCandy
}

[WrappedAndCrushedCandy :[WrappedCandy] :[CrushedCandy]] (Candy, CrushedCandy, WrappedCandy) {
    ~ wrapedAndCrushed *([Candy] candy) {
        \$~>wrappedCandy;
        \$$~>crushedCandy;
    }
}

[CrushedCandy :[Candy]] (Candy) {
    ~ crushed *([Candy] candy) {
        \$~new;
    }
}

[WrappedCandy :[Candy]] (Candy) {
    ~ wraped *([Candy] candy) {
        \$~new;
    }
}

[Candy] {
    ~ new *{}
}
```


## Parent and Child Lambda Types

There are several ways that a lambda can have a parent type. Just like any other type, a lambda can be referred or cast ([see type casting](#type-casting)) to any of its parent types. 

One such parent of a lambda type is created when any of the input types become child types and/or the output becomes a parent type:
```

[] (Beetle, Bug, Insect) {
    *{
        [[Insect][Bug][Beetle]->[Bug]] lambdaA = *([Insect] insect, [Bug] bug, [Beetle] beetle) -> [Bug] {} -> bug;

        [[Insect][Bug][Beetle]->[Insect]] lambdaB = lambdaA;
        [[Insect][Beetle][Beetle]->[Bug]] lambdaC = lambdaA;
        [[Bug][Beetle][Beetle]->[Insect]] lambdaD = lambdaA;
    }
}


[Beetle :[Bug]] (Bug) {
    ~ new *{
        \$~new;
    }
}

[Bug :[Insect]] (Insect) {
    ~ new *{
        \$~new;
    }
}

[Insect] {
    ~ new *{}
}
```

Remove the output or adding parameters to a lambda type with no parameters also results in a parent type:
```

[] (Beetle, Bug, Insect) {
    *{
        [->[Bug]] lambdaA = *() -> [Bug] {} -> \[Bug]:new;

        [[Insect]->[Bug]]    lambdaB = lambdaA;
        [->]                 lambdaC = lambdaA;
        [[Insect][Beetle]->] lambdaD = lambdaA;
        [[Insect][Insect]->] lambdaE = lambdaB; @ Invalid; lambdaB already has input parameters, adding another [Insect] parameter does not make this a parent type
    }
}


[Beetle :[Bug]] (Bug) {
    ~ new *{
        \$~new;
    }
}

[Bug :[Insect]] (Insect) {
    ~ new *{
        \$~new;
    }
}

[Insect] {
    ~ new *{}
}
```

Refering to a lambda with input parameters which originally had no input parameters, results in input paramters which are ignored when invoked. Likewise a removed output results in an ignored output parameter when invoked. These new lambda types are parent types of the original. The previous **lambdaB**, **lambdaC** and **lambdaD** are rewritten with equivalent lambda expressions to show this logic:
```

[] (Beetle, Bug, Insect) {
    *{
        [->[Bug]] lambdaA = *() -> [Bug] {} -> \[Bug]:new;

        [[Insect]->[Bug]]    lambdaB = *([Insect] ignoredInput) -> [Bug] {} -> \lambdaA;
        [->]                 lambdaC = *() { [Bug] ignoredOutput = \lambdaA; };
        [[Insect][Beetle]->] lambdaD = *([Insect] ignoredInput1, [Beetle] ignoredInput2) { [Bug] ignoredOutput = \lambdaA; };
    }
}


[Beetle :[Bug]] (Bug) {
    ~ new *{
        \$~new;
    }
}

[Bug :[Insect]] (Insect) {
    ~ new *{
        \$~new;
    }
}

[Insect] {
    ~ new *{}
}
``` 
Replacing all instances of a level 1 unbound method generic with the same concrete type, this results in a parent of the original:
```

[] (Beetle, Bug, Insect) {
    *{
        [['A]['B]->['A]] lambdaA = *(["A] a, ["B] b) -> ["A] {} -> a;
        
        [[Bug]['B]->[Bug]]           lambdaB = lambdaA;
        [['C][Bug]->['C]]            lambdaC = lambdaA;
        [[Insect][Beetle]->[Insect]] lambdaD = lambdaA;
        [[Beetle][Insect]->[Beetle]] lambdaE = lambdaA;
    }
}


[Beetle :[Bug]] (Bug) {
    ~ new *{
        \$~new;
    }
}

[Bug :[Insect]] (Insect) {
    ~ new *{
        \$~new;
    }
}

[Insect] {
    ~ new *{}
}
```
Bound method generics are also considered concrete types, so we can also replace level 1 unbound method generics with bound method generics:
```

[] (Beetle, Bug, Insect) {
    *{
        [['BoundA]['BoundB]['BoundC]->] outerLambda = *(["BoundA] a, ["BoundB] b, ["BoundC] c) {

            [['A]['B]->['A]] lambdaA = *(["A] a, ["B] b) -> ["A] {} -> a;
        
            [["BoundC]['B]->["BoundC]]      lambdaB = lambdaA;
            [['C]["BoundC]->['C]]           lambdaC = lambdaA;
            [["BoundA]["BoundB]->["BoundA]] lambdaD = lambdaA;
            [["BoundB]["BoundA]->["BoundB]] lambdaE = lambdaA;
        };
    }
}
```

As preivously mentioned, a parent of a lambda type is created when any of the input types become child types and/or the output becomes a parent type. This rule is also applied to the inputs and outputs of a lambda with method generic inputs and outputs. Consider the following example:
```
[] () {
    *{
        [[['B]['C]->[['B]/['C]]]['B]['C]->[['B]/['C]]] lambda1 = *([["B]["C]->[["B]/["C]]] input1, ["B] input2, ["C] input3) -> [["B]/["C]] {
            [["B]/["C]] output = \input1 input2 input3;
        } -> output;
        [[[''A]['C]->[[''A]/['C]]]['B]['C]->['C]] lambda2 = lambda1;
    }
}

```
We can argue that the type of input1 **[["B]["C]->[["B]/["C]]]** is a parent of **[['A]["C]->[['A]/["C]]]** (the type of the first input of lambda2), since we replace every **['A]** with a concrete type **["B]**. It is also evident that **["C]** is a parent of **[["B]/["C]]** (the type of the output of lambda2) by the rules of [disjoint types](#disjoint-types). Therefore **[[[''A]['C]->[[''A]/['C]]]['B]['C]->['C]]** is a parent of **[[['B]['C]->[['B]/['C]]]['B]['C]->[['B]/['C]]]**.


## Partial Class Implementations

### Unimplemented Instance Methods

Instance methods can be left unimplemented, when an instance methods are unimplemented this is called a partial implementation of the class. To leave an instance method unimplemented the type of the instance method is written after the method name. In the following example, **foreground** and **background** are left unimplemented in the class **ColourScheme**.
```
[ColourScheme] (Colour) {
    ~ --+ implement *{}
    ++ foreground [->[Colour]]
    ++ background [->[Colour]]
    ++ title *-> [Colour] {} -> \:foreground
    ++ body *-> [Colour] {} -> \:foreground
}

[Colour] {
    ~ black *{}
    ~ white *{}
    ~ red *{}
    ~ blue *{}
    ~ green *{}
}
```
Both **foreground** and **background** instance methods are of the type **[->[Colour]]**. The constructor of **ColourScheme**; **implement** only has inherited visibility ([See Visibility and Inheritance of Constructors and Type Methods](#visibility-and-inheritance-of-constructors-and-type-methods)), the visibility rules for constructors for partial implementations is discussed in [Assigning Instance Methods in Constructors](#assigning-instance-methods-in-constructors). 

Unimplemented methods can be overriden and implemented in a child class. When overriding an unimplemented method, **||** is used instead of **|**. The class **BlackAndWhite** inherits from **[ColourScheme]**, overriding **foreground** and **background**:
```
[BlackAndWhite :[ColourScheme]] (Colour, ColourScheme) {
    ~ new *{
        \$~implement;
    }
    ||++ foreground *-> [Colour] {} -> \[Colour]:black
    ||++ background *-> [Colour] {} -> \[Colour]:white
}

[ColourScheme] (Colour) {
    ~ --+ implement *{}
    ++ foreground [->[Colour]]
    ++ background [->[Colour]]
    ++ title *-> [Colour] {} -> \:foreground
    ++ body *-> [Colour] {} -> \:foreground
}

[Colour] {
    ~ black *{}
    ~ white *{}
    ~ red *{}
    ~ blue *{}
    ~ green *{}
}
```
We can override both unimplemented and implemented methods with an unimplemented method. An overriding unimplemented method can underload the original instance methods ([See Underloading Class Methods](#underloading-class-methods)). In the following example **GradientScheme** inherits from **[ColourScheme]** where; **foreground** is left unimplemented, **background** is underloaded but unimplemented, the originally implemented **title** is now underloaded but unimplemented, the unimplemented method **foregroundSecondary** is added and **body** is now implemented plus underloaded.
```
[GradientScheme :[ColourScheme]] (Colour, ColourScheme, GradientColour) {
    
    ~ --+ implement *{
        \$~implement;
    }

    ||++ background [->[GradientColour]]

    ++ foregroundSecondary [->[Colour]]

    |++ title [->[GradientColour]]

    |++ body *-> [GradientColour] {
        [GradientColour] body = (\[GradientColour]:gradientOf foreground foregroundSecondary)   
            !{
                [Colour] foreground = \:foreground;
                [Colour] foregroundSecondary = \:foregroundSecondary;
            };
    } -> body
}

[ColourScheme] (Colour) {
    ~ --+ implement *{}
    ++ foreground [->[Colour]]
    ++ background [->[Colour]]
    ++ title *-> [Colour] {} -> \:foreground
    ++ body *-> [Colour] {} -> \:foreground
}

[GradientColour :[Colour] :[Colour]] (Colour) 
{
    ~ gradientOf *([Colour] first, [Colour] second) {
        \$~>first;
        \$$~>second;
    }
}

[Colour] {
    ~ black *{}
    ~ white *{}
    ~ red *{}
    ~ blue *{}
    ~ green *{}
}
```
Just like before in **ColourScheme**, the constructor of **GradientScheme**; **implement** only has inherited visibility ([See Visibility and Inheritance of Constructors and Type Methods](#visibility-and-inheritance-of-constructors-and-type-methods)). The class **GradientColour** uses both [Pointer Constructors](#pointer-constructors) and [Duplicate Inheritance](#duplicate-inheritance).

Class generics, method generics and overloading ([See Overloading Class Methods](#overloading-class-methods)) can all be used with unimplemented methods:
```
[Packer<E, M> :[Converter<[Container<[&E]>][&M]>]] (Converter, Container) {
    
    ~ new *{
        \$~implement;
    }

    ||++ convert *([Container<[&E]>] container) -> [&M] {} -> \container:getObject

    ||++ convert *([&E] object) -> [Container<[&E]>] {} -> \[Container<[&E]>]:containerOf object

    ||++ join *([Converter<[&E]['C]>] otherConverter) -> [Converter<[Container<[&E]>]['C]>] {
    } -> 
}


[LambdaConversions<E, M> :[Converter<[&E][&M]>] (Converter) 
    [[&E]->[&M]] conversionForwards
    [[&M]->[&E]] conversionBackwards
{    
    ~ using *([[&E]->[&M]] conversionForwards, [[&M]->[&E]] conversionBackwards) {
        .conversionForwards = conversionForwards;
        .conversionBackwards = conversionBackwards;
        \$~implement;
    }

    ||++ convert *([&E] e) -> [&M] {} -> \conversionForwards e

    ||++ convert *([&M] m) -> [&E] {} -> \conversionBackwards m

    ||++ join *([Converter<[&M]['C]>] otherConverter) -> [Converter<[&E]['C]>] {
        
        [[&E]->['C]] joinedForwards = *([&E] e) -> ['C] {
            [&M] intermediate = \:convert e;
            ['C] result = \otherConverter:convert intermediate;
        } -> result

        [['C]->[&E]] joinedBackwards = *(['C] c) -> [&E] {
            [&M] intermediate = \otherConverter:convert c;
            [&E] result = \:convert intermediate;
        } -> result

    } -> (\[LambdaConversions<[&E]['C]>]:using joinedForwards joinedBackwards)
}

[DoNothing< Q > :[Converter<[Container<[&E]>][&]>]] {
    ~ new *{
        \$~implement;
    }
    ||++ convert *([&Q] q) -> [&Q] {} -> q
    ||++ join *([Converter<[&Q]['C]>] x) -> [Converter<[&Q]['C]>] {} -> x
}

[Converter< A, B >] {
    ~ --+ implement *{}
    ++ convert [[&A]->[&B]]
    ++ convert [[&B]->[&A]]
    ++ join [[Converter<[&B]['C]>]->[Converter<[&A]['C]>]]
}

[Container<E>]
    [&E] containedObject
{
    ~ containerOf *([&E] object) {
        .containedObject = object;
    }

    ++ getObject *->[&E] {} -> .containedObject
}
```


### Assigning Instance Methods in Constructors


+pointer constructor example [Pointer Constructors](#pointer-constructors)
private constructors partial
partial constructors visibility rules
=conflicts with override methods and partial constructors??
partial constructor is a name it is called

constructor can be only be inheritance visibilty when unimplemented (not public or class), differes per constructor
= can only assign to self instance methods, so must override parent method with another unimplemented first before assigning in constructor??? (adds visibility)
= constructor defines the amount of comppleteness of the implementation
= how does [Anonymous Class Objects](#anonymous-class-objects) fit into this in terms of [Assigning Instance Methods in Constructors], since we already can have partial constructor and override it
= relates to different constructor partialities

[Anonymous Class Objects](#anonymous-class-objects) cannot be partial constrcutor, all methods must be implemented:
```
[] {

    *{
        [?] varWidth = \[Maybe<[Integer]>]:nothing;
        [?] varHeight = \[Maybe<[Integer]>]:nothing;
        \display:getParameters [:[DisplayParameters]] {
            :width = varWidth;
            :height = varHeight;
            \$new;
            ||++ height [->[Maybe<[Integer]>]]
            ||++ width [->[Maybe<[Integer]>]]
        };
    }
}

[] {

    *{
        [?] varWidth = \[Maybe<[Integer]>]:nothing;
        [?] varHeight = \[Maybe<[Integer]>]:nothing;
        \display:getParameters [:[DisplayParameters]] {
            ||++ height *->varHeight
            ||++ width *->varWidth
        };
    }
}

[] {

    *{
        [?] varWidth = \[Maybe<[Integer]>]:nothing;
        [?] varHeight = \[Maybe<[Integer]>]:nothing;
        \display:getParameters [:[DisplayParameters]] {
            ||++ height x ! {[?] x = *->varHeight;}
            ||++ width x ! {[?] x = *->varWidth;}
        };
    }
}

```








## Rising and Falling Generics
= can always change generic between equivalent type (e.g. [e] and [[e]/[e]])
= can inheritance of non rising or falling generic allow adding rising/falling generic?
= different to method generics
= disjoint types, lambdas instantiating the generics
= lambda parent and child types when rising and falling generics are involved
= inheriting from parents with generics
= unimplemented/partial implementation of class methods
=inheriting then instantiating generics with composite types such as [Disjoint Types](#disjoint-types), lambdas, disjoint types instantiating the parents generics with multiple types...

```
[] (Cloud, Animal, Bird, Elephant) {
    *{
        [Cloud<[Bird]>] birdShapedCloud = \[Cloud<[Bird]>]:newCloud;
        [Cloud<[Elephant]>] elephantShapedCloud = \[Cloud<[Elephant]>]:newCloud;
        [Cloud<[Animal]>] animalShapedCloud1 = birdShapedCloud;
        [Cloud<[Animal]>] animalShapedCloud2 = elephantShapedCloud;
    }
}

[Cloud < SHAPE > ]
{
    ~ newCloud *() {}
}

[Elephant :[Animal]] {}

[Bird :[Animal]] {}

[Animal] {}

```


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
    ++ getContainedObject *->[&CONTAINED_OBJECT]{}->.containedObject
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


```
    rising generic +
frozen generic =
falling generic 
```




## Root Type

= method generics without input generic causes it to be root type, or if the inputs are disjoint then it becomes root type

= [->] is the same as [->[]]
= [] output to a function cant be assigned (same as no output), even if you casted a method to [->[]]
= methods with no output vs [] output are equivalent


->[] indistinguishable from ->
```

[] (Beetle, Bug, Insect) {
    *{
        [->[Bug]]              lambdaA = *() -> [Bug] {} -> \[Bug]:new;
        [->]                   lambdaB = lambdaA;
        [[Insect][Beetle]->]   lambdaC = lambdaA;
        [->[]]                 lambdaD = lambdaB;
        [[Insect][Beetle]->[]] lambdaE = lambdaC;
        [->]                   lambdaF = lambdaD;
        [[Insect][Beetle]->]   lambdaG = lambdaE;
    }
}


[Beetle :[Bug]] (Bug) {
    ~ new *{
        \$~new;
    }
}

[Bug :[Insect]] (Insect) {
    ~ new *{
        \$~new;
    }
}

[Insect] {
    ~ new *{}
}
```


when invoking ->[] same as ->, creating lambda, output must be ignored
```

[] (Foo) {
    *{
        [->]   lambdaA = *{};
        [->[]] lambdaB = *() -> [] {
            [] foo
        } -> ;

        [] foo = \lambdaB;  @ invalid, cant get output from [->[]]
        [[Insect][Beetle]->]   lambdaC = lambdaA;
        [->[]]                 lambdaD = lambdaB;
        [[Insect][Beetle]->[]] lambdaE = lambdaC;
        [->]                   lambdaF = lambdaD;
        [[Insect][Beetle]->]   lambdaG = lambdaE;
    }
}


[Foo] {
    ~ new *{}
}
```





## Self Reference

= visibility


## Type Inference


### Type Inference of Method Outputs
* ->
* ([A]a)-> a
also using ->[?] {} ->

### Type Inference of Assignments
=all types circumstances with ? in different parts of type (partial inference)
= disjoint types^

### Type Inference of Class Generics
- ([Container<[?]>]:containing) =T= ([['E]->[Container<['E]>]]), can embed generic inferrence inside, i.e.[Container<[Container<[?]>]>]:containing is ([[Container<['E]>]->[Container<[Container<['E]>]>]])


### Type Inference of Unimplemented Class Methods
Partial Class Implementations - can use ||++ eat without type takes the original type, can use |++ eat without type or implementation, takes the original type of the existing function

### Parent Context Type

[$?]
[$$$$ ?]


### Self Context Type

[:?]
[: ?]


## Type Casting

= genercal use with wrong type will attempt to cast implicitly
= accessing non inherited visible methods which are in fact externaly or class visible
= can cast down not up, visa versa???
= inferred type casting in general
= using type cast to select overloaded method which must not be ambiguous [Overloading Class Methods] + inferred type casting for overloaded, , must match only one of the overloaded methods i.e. cant cast to a smaller set of overloaded methods 
= composite expressions, using to expose external visible but not inherited...
= using type cast to select overloaded method when refering to it  flexibly, inferred casting [type casting](#type-casting), cast from overload must not be ambiguous
= has very strong binding
= flexible method expression, setting class method with object, casting it to change class method type

## Scope

```
Anonymous Class Object///
lambdas
statement group
prologue statment
can scope hide variables? no it cant.... not allowed, 
method generics hiding other method generics etc, method generic same name inside method body is actually same type, not its own generic
overlapping method generic types inside method, using ['A] in method etc
 [['M]->['M]] m = *(["M]m)->m; is valid becuase the m inside doesnt hide the oiriginal m scope
 [['M]->['M]] m = *(["M]o)->o;[['M]->['M]] p = *(["M]m)->m; is not valid because m gets hidden in second statement
 ["K] will block ["K] in an embedded landba but [['K]->['K]] will not block [['K]->['K]] and is the same as [['KM]->['KM]]
 [['KM]->['KM]] is independant of [['KM]->['KM]] but [["KM]->["KM]] is dependant to [["KM]->["KM]]
```


## Variables and Mutability
lack of these in lanugaue level


## Visibility and Inheritance of Constructors and Type Methods
=for constructor the first - or + conflicts with other constructors, and the second and third conflicts with other constructors and also type methods
= default constructor visibility (+++) and type method visibility (++-)
= overriding
=constructors cannot access private type methods
=constructors conflicting with type methods (whwen class or public visiibility for constructor) and vice versa +For resolving these issues, [see overloading and underloading.](#overloading-and-underloading)
= overriding type methods
= cant override constructor except with type method (kind of)
=inherited constructor does not cause the type method of the constructor to be inherited
= constructor never inherited
=visibility of type methods cant either be decreased either can constructor
= generic doesnt matter for class visibility
= constructor cannot override inherited type method, you must create type method for that




## Void Identifier

```
_
```

---







extra???


```

[] {
    *{
        [AppendableBuilder<[String]>] str = \[AppendableBuilder<[String]>]as \[String]:....
        \str:append \[String]:...;  @ [[String]/[Appendable<[String]>]] 
        \str:append \[String]:...;   
        \str:append \[String]:...;   
        [String] final = \str:get;
    }
}


[AppendableBuilder< E > :[Variable<[[&E]/[Appendable<[&E]>]]>]] (Variable, Appendable) {

    ++ append *([[&E]/[Appendable<[&E]>]] otherAppendable) {
        \:set (\(\:get):byAppending otherAppendable);
    }



}

[String :[Appendable<[String]>]] {
    |++ byAppending ...[[String]->[String]]...
}

[Appendable< F >] {
    ++ byAppending [[[&F]/[Appendable<[&E]>]]->[[&F]/[Appendable<[&E]>]]]
}

```





```
[Translate]


[] {
    *{
        [Transformation<[Integer][String]>] toString =...
        [Transformation<[Integer][String]>] toStringWithFlair =...
        [Transformation<[Decimal][Integer]>] round =...
        [Decimal] decimal =...
        [Integer] roundNumber = \round:transform decimal;
        [String] string = \toString:transform roundNumber;

        [FunctionComposition<[Decimal][Integer][String]>] composeOnRoundingFunction = \[FunctionComposition<[Decimal][Integer][String]>]:as (round:transform);


        [[Decimal]->[String]] decimalToRoundedString = \composeOnRoundingFunction:transform (toString:transform);
        [[Decimal]->[String]] decimalToRoundedStringWithFlair = \composeOnRoundingFunction:transform (toStringWithFlair:transform);
 
        [String] string2 = \decimalToRoundedString decimal;
        [String] stringWithFlair = \decimalToRoundedStringWithFlair decimal;
    }
}


[FunctionComposition< D, E, F > :[Transformation<[[&E]->[&F]][[&D]->[&F]]>]] (Transformation) {

    ~ as *([[&D]->[&E]] function) {
        \$~as *([[&E]->[&F]] composingFunction) -> [[&D]->[&F]] {
            [[&D]->[&F]] finalFunction = *([&D] d) -> [&F] {
                [&E] e = \function d;
                [&F] f = \composingFunction e;
            } -> f;
        } -> finalFunction;
    } 
}

[FunctionComposition< D, E, F > :[Transformation<[[&E]->[&F]][[&D]->[&F]]>]] (Transformation) {

    ~ as *([[&D]->[&E]] function) {
        \$~as *([[&E]->[&F]] composingFunction) -> [[&D]->[&F]] {
            [[&D]->[&F]] finalFunction = *([&D] d) -> [&F] {
                [&E] e = \function d;
                [&F] f = \composingFunction e;
            } -> f;
        } -> finalFunction;
    } 
}

[Transformation<A,B>] 
    [[&A]->[&B]] transform
{
    ~ as *([[&A]->[&B]] transform) {
        .transform = transform;
    }

    ++ transform *([&A] a) -> [&B] {} -> \.transform a
}



[Array<E>] {

    :: return *([E] e) -> [Array<[&E]>] {}

    ++ bind *([[&E]->[Array<['A]>]] p) -> [Array<['A]>] {

    }
}

[Maybe<E>] {

    :: return *([E] e) -> [Maybe<[&E]>] {}

    ++ bind *([[&E]->[Maybe<['A]>]] p) -> [Maybe<['A]>] {

    }

    ++ map *([[&E]->['A]] p) -> [Maybe<['A]>] {

    }
}


[Monad< E, E_CONTAINER >] {

}


[] (Boolean, ComparisonResult, Comparable) {
    *{
        [Comparable<[Boolean]>] b1 = \[Boolean]:true;
        [Comparable<[Boolean]>] b2 = \[Boolean]:false;
        [?] res = \b1:compareTo b2;

        [Maybe<[Integer]>] mx = ...
        [Maybe<[Integer]>] my = ...

        \mx:do *([Integer] x) -> (\my:do *([Integer] y) -> String(x+y))
        \mx:bind *([Integer] x) -> (\my:bind *([Integer] y) -> \[Maybe<[Integer]>]:return String(x+y))


        [Maybe<[Maybe<[Maybe<[Integer]>]>]>] mmmi = ...
        \mmmi:bind *([Maybe<[Maybe<[Integer]>]>] mmi) -> \mmi:bind *([Maybe<[Integer]>] mi) -> \mi:bind [Maybe<[Integer]>]:return



        

        [Array<[Integer]>] intArray = ...
        \intArray:bind (*([Integer] i) -> \[Array<[Integer]>]:return i
        \intArray:bind (*([Integer] i) -> (\intArray:bind (*([Integer] i) -> \[Array<[Integer]>]:return i)

    }
}


[Boolean : [Comparable<[Boolean]>]] (Comparable, ComparisonResult) {

    ~ true *{
        :ifTrueIfFalse = *(['A] ifTrue, ['A] ifFalse) -> ['A] {} -> ifTrue;
        \$~new;
    }

    ~ false *{
        :ifTrueIfFalse = *(['A] ifTrue, ['A] ifFalse) -> ['A] {} -> ifFalse;
        \$~new;
    }

    -+- ifTrueIfFalse [['A]['A]->['A]]

    |++ compareTo *([Boolean] otherBoolean) -> [ComparisonResult] {
    } -> (\otherBoolean:ifTrueIfFalse (\:ifTrueIfFalse eq notEq) (\:ifTrueIfFalse notEq eq))
        !{
            [ComparisonResult] eq = \[ComparisonResult]:equal;
            [ComparisonResult] notEq = \[ComparisonResult]:notEqual;
        }
}

[Boolean :[Comparable<[Boolean]>]] (Comparable, ComparisonResult) 
    [['A]['A]->['A]] ifTrueIfFalse
{
    ~ true *{
        .ifTrueIfFalse = *(['A] ifTrue, ['A] ifFalse) -> ['A] {} -> ifTrue;
        \$~new;
    }

    ~ false *{
        .ifTrueIfFalse = *(['A] ifTrue, ['A] ifFalse) -> ['A] {} -> ifFalse;
        \$~new;
    }

    ++ ifTrueIfFalse *(['A] ifTrue, ['A] ifFalse) -> ['A] {
    } -> \.ifTrueIfFalse ifTrue ifFalse


    |++ compareTo *([Boolean] otherBoolean) -> [ComparisonResult] {
    } -> (\otherBoolean:ifTrueIfFalse (\:ifTrueIfFalse eq notEq) (\:ifTrueIfFalse notEq eq))
        !{
            [ComparisonResult] eq = \[ComparisonResult]:equal;
            [ComparisonResult] notEq = \[ComparisonResult]:notEqual;
        }
}

[Comparable<A>] (ComparisonResult) {
    ~ new *{}
    ++ compareTo *([&A] a) -> [ComparisonResult] {} -> \[ComparisonResult]:unknown
}

[ComparisonResult] {
    ~ equal *{}
    ~ notEqual *{}
    ~ unknown *{}
}


[] (A, Integer, Maybe, Variable) {
    *{ 
        [A] a = \[A]:init;
        \(\a:mainNum):set \[Maybe<[Integer]>]:as \[Integer]:as ##57##;
    }
}


[A] (Integer, Maybe, Variable) {

    ~ init *{
        :mainNum = *->x ! [?] x = \[Variable<[Maybe<[Integer]>]>]]:as noInteger;
        :secondNum = *->x ! [?] x = \[Variable<[Maybe<[Integer]>]>]]:as noInteger;
    }   !{
            [?] noInteger = \[Maybe<[Integer]>]:nothing;
        }

    ++ mainNum [->[Variable<[Maybe<[Integer]>]>]]
    ++ secondNum [->[Variable<[Maybe<[Integer]>]>]]
}


```






```
[Implies<A, B>] { ~ var *{} }
[False] { ~ var *{} }
[True] { ~ var *{} }
[Not<A>] { ~ var *{} }
[Equals<A, B>] { ~ var *{} }
[GreaterThan<A, B>] { ~ var *{} }
[And<A, B>] { ~ var *{} }
[Or<A, B>] { ~ var *{} }
[IsNat<N>] { ~ var *{} }
[Succ<N>] { ~ var *{} }
[0] { ~ var *{} }

[Proof<P>] (IsNat, 0, Succ, Implies, GreaterThan, And, Equals) {
    ~-+- axiomatic *{
        \$~immutable;
    }
    -+- proofOfImmutability *([&P] p) -> [&P] {} -> p

    :: Implication *([Proof<[Implies<['A] ['B]>]>]_,[Proof<['A]>]_) -> \[Proof<['B]>]:axiomatic
    :: LambdaImplication *([[Proof<['A]>]->[Proof<['B]>]]_) -> \[Proof<[Implies< ['A] ['B] >]>]:axiomatic
    :: EqualsImpRight *([Proof<[Equals<['A]['B]>]>]_) -> \[Proof<[Implies< ['A] ['B] >]>]:axiomatic
    :: EqualsImpLeft *([Proof<[Equals<['A]['B]>]>]_) -> \[Proof<[Implies< ['B] ['A] >]>]:axiomatic
    :: EqualsJoin *([Proof<[Implies< ['A] ['B] >]>]_,[Proof<[Implies< ['B] ['A] >]>]_) -> \[Proof<[Equals<['A]['B]>]>]:axiomatic
    :: AndJoin *([Proof<['A]>]_,[Proof<['B]>]_) -> \[Proof<[And<['A]['B]>]>]:axiomatic
    :: AndLeft *([Proof<[And<['A]['B]>]>]_) -> \[Proof<['A]>]:axiomatic
    :: AndRight *([Proof<[And<['A]['B]>]>]_) -> \[Proof<['B]>]:axiomatic

    :: OrDefinition *(['A]_,['B]_,['P]_) -> \[Proof<[And< [Implies<[And<[Or<['A]['B]>][And<[Implies<['A]['P]>][Implies<['B]['P]>]>]>] ['P]>] [And<[Implies<['A][Or<['A]['B]>]>][Implies<['B][Or<['A]['B]>]>]>] >]>]:axiomatic
    
    :: NatDefinition *(['A]_,['B]_) -> \[Proof<[Equals< [IsNat<['A]>] [Or<[Equals<['A][0]>][Equals<['A][Succ<['B]>]>]>] >]>]:axiomatic
    @:: 0IsNat *->\[Proof<[IsNat<[0]>]>]:axiomatic
    @:: SuccIsNat *(['A]_) -> \[Proof<[Implies< [IsNat<['A]>] [IsNat<[Succ<['A]>]>] >]>]:axiomatic

    :: SuccIsGreaterThan *(['A]_) -> \[Proof<[Implies< [IsNat<['A]>] [GreaterThan<[Succ<['A]>]['A]>] >]>]:axiomatic
    :: GreaterThenIsTransitive *(['A]_,['B]_,['C]_) -> \[Proof<[Implies< [And< [GreaterThan<['A]['B]>] [GreaterThan<['B]['C]>] >] [GreaterThan<['A]['C]>] >]>]:axiomatic
}


[Lemmas] (Proof, IsNat, 0, Succ, Implies, GreaterThan, And) {

    :: Assumption *(['A]_) -> [Proof<[Implies< ['A] ['A] >]>] {
    } -> \[Proof<[]>]:LambdaImplication (*([Proof<['A]>] pA) -> pA);

    :: 0IsNat *->[Proof<[IsNat<[0]>]>] {
        [Proof<[Equals<[0][0]>]>] 0Eq0 = \[Proof<[]>]:EqualsJoin (\[Proof<[]>]:Assumption \[0]:var) (\[Proof<[]>]:Assumption \[0]:var);

        @[Proof<[`<[Equals<[0][0]>] `Implies [`<[Equals<[0][0]>] `Or [Equals<[0][Succ<[0]>]>]>]>]>]

        [Proof<[Implies<[Equals<[0][0]>][Or<[Equals<[0][0]>][Equals<[0][Succ<[0]>]>]>]>]>] p_0Eq0_imp_p1 = \[Proof<[]>]:AndLeft (\[Proof<[]>]:AndRight (\[Proof<[]>]:OrDefinition \[Equals<[0][0]>]:var \[Equals<[0][Succ<[0]>]>]:var \[0]:var));
        [Proof<[Or<[Equals<[0][0]>][Equals<[0][Succ<[0]>]>]>]>] p1 = (\[Proof<[]>]:Implication p_0Eq0_imp_p1 0Eq0);
        [IsNat<[0]>] 0IsNat = \[Proof<[]>]:Implication (\[Proof<[]>]:EqualsImpLeft (\[Proof<[]>]:NatDefinition (\[0]:var) (\[0]:var))) p1;
    } -> 0IsNat;

    :: SuccIsNat *(['A]A) -> [Proof<[Implies< [IsNat<['A]>] [IsNat<[Succ<['A]>]>] >]>] {
    } -> \[Proof<[]>]:LambdaImplication *([Proof<[IsNat<['A]>]>] aIsNat) -> [Proof<[IsNat<[Succ<['A]>]>]>] {
        [Or<[Equals<[Succ<['A]>][0]>][Equals<[Succ<['A]>][Succ<['A]>]>]>] p1 = ...
    } -> \[Proof<[]>]:Implication (\[Proof<[]>]:EqualsImpLeft (\[Proof<[]>]:NatDefinition (\[Succ<['A]>]:var) (A))) p1;


    :: proof3IsGreaterThan1 * -> [Proof<[GreaterThan< [Succ<[Succ<[Succ<[0]>]>]>] [Succ<[0]>] >]>] {
        [Proof<[IsNat<[Succ<[0]>]>]>] 1IsNat = \[Proof<[]>]:Implication (\[Proof<[]>]:SuccIsNat \[0]:var) (\[Proof<[]>]:0IsNat);
        [Proof<[IsNat<[Succ<[Succ<[0]>]>]>]>] 2IsNat = \[Proof<[]>]:Implication (\[Proof<[]>]:SuccIsNat \[Succ<[0]>]:var) 1IsNat;
        [Proof<[GreaterThan< [Succ<[Succ<[0]>]>] [Succ<[0]>] >]>] 2IsGreaterThan1 = \[Proof<[]>]:Implication (\[Proof<[]>]:SuccIsGreaterThan \[Succ<[0]>]:var) 1IsNat;
        [Proof<[GreaterThan< [Succ<[Succ<[Succ<[0]>]>]>] [Succ<[Succ<[0]>]>] >]>] 3IsGreaterThan2 = \[Proof<[]>]:Implication (\[Proof<[]>]:SuccIsGreaterThan \[Succ<[Succ<[0]>]>]:var) 2IsNat;
        [Proof<[And< [GreaterThan< [Succ<[Succ<[Succ<[0]>]>]>] [Succ<[Succ<[0]>]>] >] [GreaterThan< [Succ<[Succ<[0]>]>] [Succ<[0]>] >] >]>] 3IsGreaterThan2AND2IsGreaterThan1 = \[Proof<[]>]:And 3IsGreaterThan2 2IsGreaterThan1;
        [Proof<[GreaterThan< [Succ<[Succ<[Succ<[0]>]>]>] [Succ<[0]>] >]>] QED = \[Proof<[]>]:Implication (\[Proof<[]>]:GreaterThenIsTransitive (\[Succ<[Succ<[Succ<[0]>]>]>]:var) (\[Succ<[Succ<[0]>]>]:var) (\[Succ<[0]>]:var)) 3IsGreaterThan2AND2IsGreaterThan1;
    } -> QED


    :: proofAPlus3IsGreaterThanAPlus1 *(['A]A) -> [Proof<[Implies< [IsNat<['A]>] [GreaterThan< [Succ<[Succ<[Succ<['A]>]>]>] [Succ<['A]>] >] >]>] {
        [Proof<[Implies< [IsNat<['A]>] [GreaterThan< [Succ<[Succ<[Succ<['A]>]>]>] [Succ<['A]>] >] >]>] QED = \[Proof<[]>]:LambdaImplication *([Proof<[IsNat<['A]>]>] aIsNat) -> [GreaterThan< [Succ<[Succ<[Succ<['A]>]>]>] [Succ<['A]>] >] { 
            [Proof<[IsNat<[Succ<['A]>]>]>] APlus1IsNat = \[Proof<[]>]:Implication (\[Proof<[]>]:SuccIsNat A) aIsNat;
            [Proof<[IsNat<[Succ<[Succ<['A]>]>]>]>] APlus2IsNat = \[Proof<[]>]:Implication (\[Proof<[]>]:SuccIsNat \[Succ<['A]>]:var) APlus1IsNat;
            [Proof<[GreaterThan< [Succ<[Succ<['A]>]>] [Succ<['A]>] >]>] APlus2IsGreaterThanAPlus1 = \[Proof<[]>]:Implication (\[Proof<[]>]:SuccIsGreaterThan \[Succ<['A]>]:var) APlus1IsNat;
            [Proof<[GreaterThan< [Succ<[Succ<[Succ<['A]>]>]>] [Succ<[Succ<['A]>]>] >]>] APlus3IsGreaterThanAPlus2 = \[Proof<[]>]:Implication (\[Proof<[]>]:SuccIsGreaterThan \[Succ<[Succ<['A]>]>]:var) APlus2IsNat;
            [Proof<[And< [GreaterThan< [Succ<[Succ<[Succ<['A]>]>]>] [Succ<[Succ<['A]>]>] >] [GreaterThan< [Succ<[Succ<['A]>]>] [Succ<['A]>] >] >]>] APlus3IsGreaterThanAPlus2ANDAPlus2IsGreaterThanAPlus1 = \[Proof<[]>]:And APlus3IsGreaterThanAPlus2 APlus2IsGreaterThanAPlus1;
            [Proof<[GreaterThan< [Succ<[Succ<[Succ<['A]>]>]>] [Succ<['A]>] >]>] QED = \[Proof<[]>]:Implication (\[Proof<[]>]:GreaterThenIsTransitive (\[Succ<[Succ<[Succ<['A]>]>]>]:var) (\[Succ<[Succ<['A]>]>]:var) (\[Succ<['A]>]:var)) APlus3IsGreaterThanAPlus2ANDAPlus2IsGreaterThanAPlus1;
        } -> QED;
    } -> QED

}


```





# Grammar



## Whitespace
All whitespace is ignored. 

Characters in a token cannot be seperated with whitespace, rather then they are considered to be seperate tokens. For example, consider the [triple less than token](#triple-less-than): ```<<<```. If we add whitespace sperating them: ```< <<```, now they are considered to be three [left arrow bracket tokens](#arrow-brackets).

Additionally, tokens can always appear directly next to each other with no conflict. The tokens are interpreted in a greedy manner. In other words, the largest possible token will always be interpreted first. For example, consider the following sequence of characters:
```
<<<<<:::::
```
This sequence of characters is interpreted as one [triple less than](#triple-less-than), two [left arrow brackets](#arrow-brackets), two [double colons](#double-colon) and one [single colon](#colon).


## Composite Tokens

### Data Segment Anchor

A data segment anchor starts with **#** and ends with another **#**. Between the two **#**'s can be any characters except for a **#**.

Example tokens: **##**, **#fds#**, **#234h#**, **#_ DSA _#**, **#^^!~0()[]#**

Syntax usages: [data-segment](#data-segment)

### Identifier

An identifier can contain any number of alphanumeric charaters and underscores. It must contain at least one character.

Example tokens: **_**, **123foo**, **8**, **AnObject**, **cats_and_dogs**

If the identifier is an underscore **_**, then it is a [void identifier](#void-identifier). A [void identifier](#void-identifier) cannot be identified by another [void identifier](#void-identifier) and it is always unique. In other words multiple [void identifier](#void-identifier)'s can be used without identifying each other, and so it can be used to signify when an object should be ignored.

Syntax usages: [class](#class), [generic-declaration-list](#generic-declaration-list), [type](#type), [dependancy-structure](#dependancy-structure), [object-declaration](#object-declaration), [class-method](#class-method), [expression](#expression), [method-invocation](#method-invocation), [internal-instance-method](#internal-instance-method), [internal-instance-object](#internal-instance-object)

### Parent Identifier

A parent identifier contains one or more **$** charaters. 

Example tokens: **$**, **$$**, **$$$**, **$$$$**, **$$$$$**, **$$$$$$$$$$$$$$**

**$** represents the first parent, **$$** represents the second parent, **$$$** represents the third parent and so on...

Syntax usages: [type](#type), [internal-context-identifier](#internal-context-identifier)

## Simple Tokens

### Ampersand

Token: **&**

Syntax usages: [type](#type)

### Apostrophe

Token: **'**

Syntax usages: [type](#type)

### Arrow

Token: **->**

Syntax usages: [type](#type), [dependancy-structure](#dependancy-structure), [method-expression](#method-expression)

### Arrow Brackets

Tokens: **\>**, **\<**

Syntax usages: [generic-declaration-list](#generic-declaration-list), [type](#type), [method-invocation](#method-invocation)

### Asterisk

Token: **\***

Syntax usages: [method-expression](#method-expression)

### Asterisk Dash

Token: **\*-**

Syntax usages: [expression](#expression)

### Backslash

Token: **\\**

Syntax usages: [method-invocation](#method-invocation)

### Backtick

Token: **\`**

Syntax usages: [lexical-splitter](#lexical-splitter)

### Caret

Token: **^**

Syntax usages: [expression](#expression)

### Colon

Token: **:**

Syntax usages: [class](#class), [expression](#expression), [internal-context-identifier](#internal-context-identifier), [anonymous-class-object](#anonymous-class-object)

### Comma

Token: **,**

Syntax usages: [method-expression](#method-expression), [dependancy-structure](#dependancy-structure), [generic-declaration-list](#generic-declaration-list)

### Curly Brackets

Tokens: **}**, **{**

Syntax usages: [class](#class), [entry-point-class](#entry-point-class), [statement-body](#statement-body), [anonymous-class-object](#anonymous-class-object)

### Double Apostrophe

Token: **"**

Syntax usages: [type](#type)

### Double Colon

Token: **::**

Syntax usages: [class-method](#class-method)

### Double Pipe

Token: **||**

Syntax usages: [class-method](#class-method)

### Double Strudel

Token: **@@**

Syntax usages: [mutiline-comment](#mutiline-comment)

### Equals Sign

Token: **=**

Syntax usages: [assignment-statement](#assignment-statement)

### Exclamation Mark

Token: **!**

Syntax usages: [prologue-statement](#prologue-statement)

### Forward Slash

Token: **/**

Syntax usages: [type](#type)

### Full Stop

Token: **.**

Syntax usages: [internal-instance-object](#internal-instance-object)

### Method Visibility Indicators

Tokens: **-**, **+**, **++**, **---**, **--+**, **-+-**, **-++**, **+--**, **+-+**, **++-**, **+++**

Syntax usages: [class-method](#class-method)

### Percent Sign

Token: **%**

Syntax usages: [type](#type)

### Pipe

Token: **|**

Syntax usages: [class-method](#class-method)

### Question Mark

Token: **?**

Syntax usages: [type](#type)

### Round Brackets

Tokens: **)**, **(**

Syntax usages: [dependancy-structure](#dependancy-structure), [expression](#expression), [method-expression](#method-expression)

### Semicolon

Token: **;**

Syntax usages: [statement-body](#statement-body)

### Square Brackets

Tokens: **]**, **[**

Syntax usages: [class](#class), [entry-point-class](#entry-point-class), [type](#type), [anonymous-class-object](#anonymous-class-object)

### Strudel

Token: **@**

Syntax usages: [singleline-comment](#singleline-comment)

### Tilde

Token: **~**

Syntax usages: [class-method](#class-method), [method-invocation](#method-invocation)

### Triple Less Than

Token: **<<<**

Syntax usages: [compiler-injection](#compiler-injection)


## Syntax
The syntax is detailed in a top down tree like manner. Starting from the [root](#root), the complete syntax of Daina can be observed where each subheading represents a node in the syntax tree and links to all child branches.

A simple regex-like syntax meta-language is used to describe grammar rules. It consists of the following symbols:

* Tokens representing the use of a token in the syntax, e.g. [<<<](#triple-less-than), [(](#round-brackets), [@@](#double-strudel), [identifier](#identifier)
* Child nodes representing the branching to the given child in the syntax tree, e.g. [class](#class), [mutiline-comment](#mutiline-comment), [singleline-comment](#singleline-comment)
* Pipe **|** representing a choice between one syntax element or another. If there is any conflict between choices, the first option always takes precedence.
* Question mark **?** representing an optional syntax element
* Question mark **+** representing a syntax element which can optionally be repeated one or more times
* Asterisk **\*** representing an optional syntax element which can optionally be repeated one or more times
* Round brackets **( )** to group syntax elements together
* Other characters **[description]** representing characters described between square brackets

Consider the following example syntax description where A, B, C and D are tokens: **(** **(** **(** A **)\*** **|** B **)+** **|** C **|** D **)?** D

Here are a few correct syntaxes from this syntax description: D, CD, DD, AAAD, ABBAAD

Here are a few invalid syntaxes from this syntax description: CC, AAA, DDD, BCD

### Root
- [root](#root) syntax description: **(** [class](#class) **|** [entry-point-class](#entry-point-class) **)** **\***

At the root of the Daina language, any number of classes can be defined. These classes must be unique, i.e. no two [classes](#class) can have the same [identifier](#identifier). Additionally, there can only be one [entry point class](#entry-point-class) which is the entry point of a Daina program.

Starting from the root, there are three tokens which can appear anywhere in the program which will always branch to the corresponding nodes. In other words, when the following tokens appear for any syntax node, branching will always occur:

* [Backtick \`](#backtick) always branches to [lexical-splitter](#lexical-splitter)
* [Double strudel @@](#double-strudel) always branches to [mutiline-comment](#mutiline-comment)
* [Strudel @](#strudel) always branches to [singleline-comment](#singleline-comment)

### Lexical Splitter
- [lexical-splitter](#lexical-splitter) syntax description: **[past character]**[\`](#backtick)**[middle characters]**[\`](#backtick)**[future characters]**

The lexical splitter rearranges the characters so that the **[future characters]** are stitched to the **[past character]**, and the **[middle characters]** which start a new token come after the **[future characters]** until the next token is reached, i.e. into the following configuration: **[past character][future characters before next token][space][middle characters][future characters from next token]**. After this rearrangement, the syntax branches back to the parent syntax node. Consider the following example:
```
abc`def`hij klm
```
This would be equivalent to the following sequence of characters:
```
abchij def klm
```
[See more examples of the lexical splitter](#the-lexical-splitter).

### Mutiline Comment
- [mutiline-comment](#mutiline-comment) syntax description: [@@](#double-strudel)**[any characters except @@]**[@@](#double-strudel)

The [@@](#double-strudel) tokens and all the characters in between are ignored by the compiler.

### Singleline Comment
- [singleline-comment](#singleline-comment) syntax description: [@](#strudel)**[all characters until the end of the line]**

The [@](#strudel) token and all the characters until the end of the line are ignored by the compiler.

### Class
- [class](#class) syntax description: [\[](#square-brackets) [identifier](#identifier) **(** [generic-declaration-list](#generic-declaration-list) **)?** **(** [:](#colon) [type](#type) **)\*** [\]](#square-brackets) [dependancy-structure](#dependancy-structure) **(** [object-declaration](#object-declaration) **)\*** [{](#curly-brackets) **(** [class-method](#class-method) **|** [compiler-injection](#compiler-injection) **)\*** [}](#curly-brackets)

The [identifier](#identifier) is the name of the class and must be unique (different from all other class identifiers). The class identifier cannot be the [void identifier](#identifier). The [object declarations](#object-declaration) are the declarations of the instance objects for the class. [See classes.](#classes-types-objects-and-dependancies)

Each [type](#type) represents a parent of the class. A parent must be a class [type](#type). The first [type](#type) is the first parent, the second [type](#type) is the second parent and so on... A class cannot inherit from itself. [See inheritance.](#inheritance)

### Entry Point Class
- [entry-point-class](#entry-point-class) syntax description: [\[](#square-brackets) [\]](#square-brackets) [dependancy-structure](#dependancy-structure) [{](#curly-brackets) [expression](#expression) [}](#curly-brackets)

The [expression](#expression) inside the class is the [entry point of a program](#entry-point-of-a-program), it is a method with no inputs or output. The [dependancy structure](#dependancy-structure) determines which classes the entry point method depends on.

### Generic Declaration List
- [generic-declaration-list](#generic-declaration-list) syntax description: [<](#arrow-brackets) **generic-declaration** **(** [,](#comma) **generic-declaration** **)\*** [>](#arrow-brackets)
    + **generic-declaration** syntax description: [identifier](#identifier)

Each **generic-declaration** [identifier](#identifier) must be unique (no two generics in a generic declaration list can have the same [identifier](#identifier)). [See class generics.](#class-generics) [See rising and falling generics.](#rising-and-falling-generics)

### Type
- [type](#type) syntax description: [\[](#square-brackets) **(** **class-type-structure** **|** **lambda-type-structure** **|** **data-segment-type-structure** **|** **disjoint-type-structure** **|** **class-generic-type-structure** **|** **lambda-generic-type-structure** **|** **inferred-type-structure** **)?** [\]](#square-brackets)
    + **class-segment-type-structure** syntax description: [identifier](#identifier) **(** **class-generic-instantiation** **)?**
        - **class-generic-instantiation** syntax description: [<](#arrow-brackets) **(** [type](#type) **)\*** [>](#arrow-brackets)
    + **lambda-type-structure** syntax description: **(** [type](#type) **)\*** [->](#arrow) **(** [type](#type) **)?**
    + **disjoint-type-structure** syntax description: [type](#type) **(** **(** [/](#forward-slash) [type](#type) **)+**
    + **class-generic-type-structure** syntax description: [&](#ampersand) [identifier](#identifier)
    + **method-generic-type-structure** syntax description: **(** **(** ['](#apostrophe) **)+** **|** ["](#double-apostrophe) **)** [identifier](#identifier)
    + **data-segment-type-structure** syntax description: [%](#percent-sign) [identifier](#identifier)
    + **inferred-type-structure** syntax description: **(** [internal-context-identifier](#internal-context-identifier) **)?** [?](#question-mark)

A type is a classification of an object. Each type structure forms a type which classifies a different set of objects. Following are links to explainations for each type structure:

- **class-segment-type-structure**: [classes](#classes-types-objects-and-dependancies), [class generics](#class-generics)
- **lambda-type-structure**: [lambdas](#methods-and-lambdas)
- **disjoint-type-structure**: [disjoint types](#disjoint-types)
- **class-generic-type-structure**: [class generics](#class-generics)
- **method-generic-type-structure**: [method generics](#method-generics)
- **data-segment-type-structure**: [data segments](#data-segments)
- **inferred-type-structure**: [type inference](#type-inference)

If the type structure is empty, the type represents the [root type](#root-type).

Types within the **class-generic-instantiation** cannot be a data segment type. The type after the [->](#arrow) in **lambda-type-structure** cannot be a data segment type. [See data segments.](#data-segments)

### Dependancy Structure
- [dependancy-structure](#dependancy-structure) syntax description: **(** **dependancy-list** **(** [->](#arrow) **reverse-dependancy-list** **)?** **)?**
    + **reverse-dependancy-list** syntax description: [(](#round-brackets) [identifier](#identifier) **(** [,](#comma) [identifier](#identifier) **)\*** [)](#round-brackets)
    + **dependancy-list** syntax description: [(](#round-brackets) [identifier](#identifier) **(** [,](#comma) [identifier](#identifier) **)\*** [)](#round-brackets)

The [identifiers](#identifier) in the **dependancy-list** refer to [classes](#class) which are depended on by the parent of this dependancy structure. The [identifiers](#identifier) in the **reverse-dependancy-list** refer to [classes](#class) which depend on the parent of this dependancy structure. [See dependancies.](#classes-types-objects-and-dependancies)

### Object Declaration
- [object-declaration](#object-declaration) syntax description: [type](#type) [identifier](#identifier)

An object declaration is used in various contexts to declare the presence of an object. The [identifier](#identifier) is the name of the object and [type](#type) is gaurenteed to be a valid [type](#type) of the object. The [type](#type) cannot be the [root type](#root-type).

### Class Method
- [class-method](#class-method) syntax description: **(** [|](#pipe) **|** [||](#double-pipe) **)?** **class-method-classification** [identifier](#identifier) **(** [type](#type) **|** [expression](#expression) **)**
    + **class-method-classification** syntax description: [method-visibility-indicator](#method-visibility-indicators) **|** **(** **(** [~](#tilde) **|** [::](#double-colon) **)** **(** [method-visibility-indicator](#method-visibility-indicators) **)?** **)**

Inclusion of [|](#pipe) declares that this class method is overriding a existing class method from a parent [class](#class) ([see inheritance](#inheritance)). Inclusion of [||](#double-pipe) declares that this class method is overriding an unimplemented class method from a parent [class](#class) ([see partial class implementations](#partial-class-implementations)). The **class-method-classification** determines if a class method is a construtor, instance method or type method. [::](#double-colon) indicates a type method, [~](#tilde) indicates a constructor, and the lack of either represents an instance method. The [method-visibility-indicator](#method-visibility-indicators) determines the visibility of the method. [See instance method visibility.](#instance-method-visibility) [See constructor and type method visibility.](#visibility-and-inheritance-of-constructor-and-type-methods) The [identifier](#identifier) is the name of this class method.

If the class method has an [expression](#expression), the [expression](#expression) must represent a [method](#methods-and-lambdas). [See constructors, instance methods and type methods.](#constructors-instance-methods-and-type-methods) Constructors have special rules for the method; [See statement order in constructors.](#statement-ordering-in-constructors)

If the class method has a [type](#type) instead; the class method is said to be unimplemented, the [type](#type) in question is the [type](#type) of the unimplemented [method](#methods-and-lambdas). Only instance methods can be unimplemented. [See partial class implementations.](#partial-class-implementations)

### Compiler Injection
- [compiler-injection](#compiler-injection) syntax description: [<<<](#triple-less-than) [identifier](#identifier) [data-segment](#data-segment)

A compiler injection has no explicit interpretation at the Daina language level and is ostensibly ignored. An individual compiler may interpret the compiler injection at it's own discretion. [See compiler injections.](#compiler-injections)

### Expression
- [expression](#expression) syntax description: **(** [data-segment](#data-segment) **|** [compiler-injection](#compiler-injection) **|** [assignment-statement](#assignment-statement) **|** [statement-body](#statement-body) **|** **object-method** **|** **proxy-object** **|** [method-expression](#method-expression) **|** **grouped-expression** **|** [method-invocation](#method-invocation) **|** **type-method** **|** **object-identifier** **|** [internal-instance-method](#internal-instance-method) **|** [internal-instance-object](#internal-instance-object) **|** **self-reference** **|** [anonymous-class-object](#anonymous-class-object) **)** **(** [prologue-statement](#prologue-statement) **)?**
    + **object-method** syntax description: [expression](#expression) [:](#colon) [identifier](#identifier)
    + **proxy-object** syntax description: [\*-](#asterisk-dash) [expression](#expression)
    + **grouped-expression** syntax description: **(** **type-cast** **)?** [(](#round-brackets) [expression](#expression) [)](#round-brackets)
        - **type-cast** syntax description: [type](#type)
    + **type-method** syntax description: [type](#type) [:](#colon) [identifier](#identifier)
    + **object-identifier** syntax description: [identifier](#identifier)
    + **self-reference** syntax description: [^](#caret)

A **grouped-expression** represents the same expression from its syntax description. The **type-cast** in a **grouped-expression** forces an upcast of the type of the original expression. [See type casting.](#type-casting)

Any expression can have an attached [prologue-statement](#prologue-statement). [See prologue statements.](#prologue-statements)

Some expressions will evalutate to an object. The following are all the types of expressions which can evaluate to an object:
- [data-segment](#data-segment): Evaluates to a [data-segment](#data-segment) object. [See data segments.](#data-segments)
- **object-method**: The **object-method**'s [expression](#expression) is evalutated first. Then this evalutates to the method named by the [identifier](#identifier), from the object which resulted from the **object-method**'s [expression](#expression). The rules for [instance method visibility](#instance-method-visibility) must be followed.
- **proxy-object**: The **proxy-object**'s [expression](#expression) is evalutated first. Then this evalutates to a [proxy](#object-proxy) for the object which resulted from the **proxy-object**'s [expression](#expression).
- [method-expression](#method-expression): Evalutates to the method expressed here. [See methods.](#methods-and-lambdas)
- **grouped-expression**: The **grouped-expression**'s [expression](#expression) is evalutated first. Then this evalutates to the result of the **grouped-expression**'s [expression](#expression). The result is upcast to the **type-cast**'s [type](#type) if one is present. The **grouped-expression** must always evalutate to an object. If the result is upcast, then the **grouped-expression** cannot be a be a [data-segment](#data-segment).
- [method-invocation](#method-invocation): Evaluates to the output object after the method is invoked. If the method has no output object then this expression does not evaluate to an object. [See methods.](#methods-and-lambdas)
- **type-method**: Evalutates to the type method named by the **type-method**'s [identifier](#identifier) for the class identified by the **type-method**'s [type](#type). This type method can refer to a constructor. [See constructors and type methods.](#constructors-instance-methods-and-type-methods) The rules for [constructor and type method visibility](#visibility-and-inheritance-of-constructor-and-type-methods) must be followed. The **type-method**'s [type](#type) can have class generic instantiations. [See class generics.](#class-generics)
- **object-identifier**: Evaluates to the local object or input object which is named with the **object-identifier**'s [identifier](#identifier). The local object or input object must be accessible in the current [scope](#scope). The local or input object cannot be a [data-segment](#data-segment).
- [internal-instance-method](#internal-instance-method): Evalutates to the instance method named by the [internal-instance-method](#internal-instance-method)'s [identifier](#identifier), from the enclosing class or parent class identified by the [internal-instance-method](#internal-instance-method)'s [internal-context-identifier](#internal-context-identifier). [See classes.](#classes-types-objects-and-dependancies) [See inheritance.](#inheritance)
- [internal-instance-object](#internal-instance-object): Evalutates to the instance object named by the [internal-instance-object](#internal-instance-object)'s [identifier](#identifier). [See classes.](#classes-types-objects-and-dependancies)
- **self-reference**: Evalutates to the instance of the enclosing class. [See self reference.](#self-reference)
- [anonymous-class-object](#anonymous-class-object): Evaluates to the new class object. [See anonymous class objects.](#anonymous-class-objects)

### Internal Context Identifier
- [internal-context-identifier](#internal-context-identifier) syntax description: [:](#colon) **|** [parent-identifier](#parent-identifier)

The internal context identifier represents the enclosing class with a [:](#colon), or one of the parent classes identified by a [parent-identifier](#parent-identifier).

### Data Segment
- [data-segment](#data-segment) syntax description: [data-segment-anchor](#data-segment-anchor)**[data-component]**[data-segment-anchor](#data-segment-anchor).
    + **data-component** syntax description: **[any characters not containing the data-segment-anchor]**

Both [data-segment-anchor](#data-segment-anchor)'s surrounding the **data-component** must be identical and not contained within the **data-component**. The **data-component** has no explicit interpretation at the Daina language level and is ostensibly ignored. An individual compiler may interpret the **data-component** at it's own discretion. [See data segments.](#data-segments)

### Assignment Statement
- [assignment-statement](#assignment-statement) syntax description: **(** [internal-instance-method](#internal-instance-method) **|** [internal-instance-object](#internal-instance-object) **|** [object-declaration](#object-declaration) **)** [=](#equals-sign) [expression](#expression)

In an assignment statement the [expression](#expression) is evalutated first and the resulting object is assigned to the [internal-instance-method](#internal-instance-method), [internal-instance-object](#internal-instance-object) or [object-declaration](#object-declaration). The [expression](#expression) must result in an object, but cannot be a be a [data-segment](#data-segment). The [type](#type) of the [internal-instance-method](#internal-instance-method), [internal-instance-object](#internal-instance-object) or [object-declaration](#object-declaration) must match the [expression](#expression). Assigning an [internal-instance-method](#internal-instance-method) or [internal-instance-object](#internal-instance-object) can only happen in a constructor. [See statement order in constructors.](#statement-ordering-in-constructors)

### Statement Body
- [statement-body](#statement-body) syntax description: [{](#curly-brackets) **(** [statement](#statement) **(** [;](#semicolon) **)?** **)\*** [}](#curly-brackets)

The [statement](#statement)s are executed one after another in order from the first to the last.

### Method Expression
- [method-expression](#method-expression) syntax description: [\*](#asterisk) **(** **input-list** **)?** **(** **method-body** **|** **(** **(** [->](#arrow) **output-type** **method-body** **)?** [->](#arrow) **output-expression** **)** **)**
    + **input-list** syntax description: [(](#round-brackets) [object-declaration](#object-declaration) **(** [,](#comma) [object-declaration](#object-declaration) **)\*** [)](#round-brackets)
    + **method-body** syntax description: [statement](#statement)
    + **output-type** syntax description: [type](#type)
    + **output-expression** syntax description: [expression](#expression)

The **method-body** [statement](#statement) is executed first, then the **output-expression** is evalutated and the result is returned. [See methods.](#methods-and-lambdas). The **output-expression** cannot be a [data-segment](#data-segment).

### Method Invocation
- [method-invocation](#method-invocation) syntax description: [\\](#backslash) **(** [expression](#expression) **|** **internal-constructor** **)** **method-inputs**
    + **internal-constructor** syntax description: [internal-context-identifier](#internal-context-identifier) [~](#tilde) **(** **(** [>](#arrow-brackets) **)** **|** [identifier](#identifier) **)**
    + **method-inputs** syntax description: **(** [expression](#expression) **)\***

The method invocation either invokes the result of an [expression](#expression), or an **internal-constructor**. If an [expression](#expression) is invoked; first the expression is evaluated to a method, then each of the **method-inputs** [expression](#expression)'s are evaluated in order that they appear from left to right, finally the method is invoked with the evaluated **method-inputs** as the input objects to the method. [See methods.](#methods-and-lambdas) If an **internal-constructor** is invoked; first the **internal-constructor**'s [expression](#expression) is evaluated if it has one, then each of the **method-inputs** [expression](#expression)'s are evaluated in order that they appear from left to right, finally the constructor is invoked with the evaluated **method-inputs** as the input objects to the method. 

An **internal-constructor** invocation can be a parent constructor ([See inheritance.](#inheritance)) or a [self constructor](#invoking-self-constructors). Wether representing a constructor from the enclosing class or a parent class is determined by the [internal-context-identifier](#internal-context-identifier). If the [>](#arrow-brackets) is not present, then the **internal-constructor** represents a constructor as normal. If the [>](#arrow-brackets) is present, then the **internal-constructor** represents a [pointer constructor](#pointer-constructors) and the first [expression](#expression) after the [>](#arrow-brackets) evalutates to the object which the new object will point to.

### Internal Instance Method
- [internal-instance-method](#internal-instance-method) syntax description: [internal-context-identifier](#internal-context-identifier) [identifier](#identifier)

Represents a method named by the [identifier](#identifier) from either the enclosing class or a parent class. Wether representing a method from the enclosing class or a parent class is determined by the [internal-context-identifier](#internal-context-identifier). [See inheritance.](#inheritance)

### Internal Instance Object
- [internal-instance-object](#internal-instance-object) syntax description: [.](#full-stop) [identifier](#identifier)

Represents the instance object named by the [identifier](#identifier). [See classes.](#classes-types-objects-and-dependancies)

### Anonymous Class Object
- [anonymous-class-object](#anonymous-class-object) syntax description: [\[](#square-brackets) **(** [:](#colon) [type](#type) **)+** [\]](#square-brackets) [{](#curly-brackets) **anonymous-class-object-construction** **(** [class-method](#class-method) **)\*** [}](#curly-brackets)
    + **anonymous-class-object-construction** syntax description: **(** [statement](#statement) **)\***

Represents a new class object which overrides each of the [type](#type)'s, is constructed by the **anonymous-class-object-construction**, and implements each of the [class-method](#class-method)'s. Each [type](#type) represents a parent of the new class object, the first [type](#type) is the first parent, the second [type](#type) is the second parent and so on... [See anonymous class objects.](#anonymous-class-objects)

### Prologue Statement
- [prologue-statement](#prologue-statement) syntax description: [!](#exclamation-mark) [statement](#statement)

A prologue statement is evalutated before the expression which comes before it. [See prologue statements.](#prologue-statements)

### Statement
- [statement](#statement) syntax description: [expression](#expression)

A statement is an [expression](#expression) which does not evalutate to an object. In other words, the statement is only valid if the [expression](#expression) does not evalutate to an object.
 

## Syntax Summary
- Whitespace is ignored
- [composite-tokens](#composite-tokens): [data-segment-anchor](#data-segment-anchor), [identifier](#identifier), [parent-identifier](#parent-identifier)
- [simple-tokens](#simple-tokens): [&](#ampersand), ['](#apostrophe), [->](#arrow), [<](#arrow-brackets), [>](#arrow-brackets), [\*](#asterisk), [\\](#backslash), [\`](#backtick), [^](#caret), [:](#colon), [{](#curly-brackets), [}](#curly-brackets), [::](#double-colon), [||](#double-pipe), [@@](#double-strudel), [=](#equals-sign), [!](#exclamation-mark), [/](#forward-slash), [.](#full-stop), [-](#method-visibility-indicators), [+](#method-visibility-indicators), [++](#method-visibility-indicators), [---](#method-visibility-indicators), [--+](#method-visibility-indicators), [-+-](#method-visibility-indicators), [-++](#method-visibility-indicators), [+--](#method-visibility-indicators), [+-+](#method-visibility-indicators), [++-](#method-visibility-indicators), [+++](#method-visibility-indicators), [%](#percent-sign), [|](#pipe), [?](#question-mark), [(](#round-brackets), [)](#round-brackets), [;](#semicolon), [\[](#square-brackets), [\]](#square-brackets), [@](#strudel), [~](#tilde), [<<<](#triple-less-than)
- [Backtick \`](#backtick) always branches to [lexical-splitter](#lexical-splitter)
    + [lexical-splitter](#lexical-splitter): **[past character]**[\`](#backtick)**[middle characters]**[\`](#backtick)**[future characters]**
- [Double strudel @@](#double-strudel) always branches to [mutiline-comment](#mutiline-comment)
    + [mutiline-comment](#mutiline-comment): [@@](#double-strudel)**[any characters except @@]**[@@](#double-strudel)
- [Strudel @](#strudel) always branches to [singleline-comment](#singleline-comment)
    + [singleline-comment](#singleline-comment): [@](#strudel)**[all characters until the end of the line]**
- [root](#root): **(** [class](#class) **|** [entry-point-class](#entry-point-class) **)** **\***
    - [class](#class): [\[](#square-brackets) [identifier](#identifier) **(** [generic-declaration-list](#generic-declaration-list) **)?** **(** [:](#colon) [type](#type) **)\*** [\]](#square-brackets) [dependancy-structure](#dependancy-structure) **(** [object-declaration](#object-declaration) **)\*** [{](#curly-brackets) **(** [class-method](#class-method) **|** [compiler-injection](#compiler-injection) **)\*** [}](#curly-brackets)
    - [entry-point-class](#entry-point-class): [\[](#square-brackets) [\]](#square-brackets) [dependancy-structure](#dependancy-structure) [{](#curly-brackets) [expression](#expression) [}](#curly-brackets)
    - [generic-declaration-list](#generic-declaration-list): [<](#arrow-brackets) **generic-declaration** **(** [,](#comma) **generic-declaration** **)\*** [>](#arrow-brackets)
        + **generic-declaration**: [identifier](#identifier)
    - [type](#type): [\[](#square-brackets) **(** **class-type-structure** **|** **lambda-type-structure** **|** **data-segment-type-structure** **|** **disjoint-type-structure** **|** **class-generic-type-structure** **|** **lambda-generic-type-structure** **|** **inferred-type-structure** **)?** [\]](#square-brackets)
        + **class-segment-type-structure**: [identifier](#identifier) **(** **class-generic-instantiation** **)?**
            - **class-generic-instantiation**: [<](#arrow-brackets) **(** [type](#type) **)\*** [>](#arrow-brackets)
        + **lambda-type-structure**: **(** **(** [type](#type) **)\*** [->](#arrow) **(** [type](#type) **)?**
        + **disjoint-type-structure**: [type](#type) **(** [/](#forward-slash) [type](#type) **)+**
        + **class-generic-type-structure**: [&](#ampersand) [identifier](#identifier)
        + **method-generic-type-structure**: **(** **(** ['](#apostrophe) **)+** **|** ["](#double-apostrophe) **)** [identifier](#identifier)
        + **data-segment-type-structure**: [%](#percent-sign) [identifier](#identifier)
        + **inferred-type-structure**: **(** [internal-context-identifier](#internal-context-identifier) **)?** [?](#question-mark)
    - [dependancy-structure](#dependancy-structure): **(** **dependancy-list** **(** [->](#arrow) **reverse-dependancy-list** **)?** **)?**
        + **reverse-dependancy-list**: [(](#round-brackets) [identifier](#identifier) **(** [,](#comma) [identifier](#identifier) **)\*** [)](#round-brackets)
        + **dependancy-list**: [(](#round-brackets) [identifier](#identifier) **(** [,](#comma) [identifier](#identifier) **)\*** [)](#round-brackets)
    - [object-declaration](#object-declaration): [type](#type) [identifier](#identifier)
    - [class-method](#class-method): **(** [|](#pipe) **|** [||](#double-pipe) **)?** **class-method-classification** [identifier](#identifier) **(** [type](#type) **|** [expression](#expression) **)**
        + **class-method-classification**: [method-visibility-indicator](#method-visibility-indicators) **|** **(** **(** [~](#tilde) **|** [::](#double-colon) **)** **(** [method-visibility-indicator](#method-visibility-indicators) **)?** **)**
    - [compiler-injection](#compiler-injection): [<<<](#triple-less-than) [identifier](#identifier) [data-segment](#data-segment)
    - [expression](#expression): **(** [data-segment](#data-segment) **|** [compiler-injection](#compiler-injection) **|** [assignment-statement](#assignment-statement) **|** [statement-body](#statement-body) **|** **object-method** **|** **proxy-object** **|** [method-expression](#method-expression) **|** **grouped-expression** **|** [method-invocation](#method-invocation) **|** **type-method** **|** **object-identifier** **|** [internal-instance-method](#internal-instance-method) **|** [internal-instance-object](#internal-instance-object) **|** **self-reference** **|** [anonymous-class-object](#anonymous-class-object) **)** **(** [prologue-statement](#prologue-statement) **)?**
        + **object-method**: [expression](#expression) [:](#colon) [identifier](#identifier)
        + **proxy-object** syntax description: [\*-](#asterisk-dash) [expression](#expression)
        + **grouped-expression**: **(** **type-cast** **)?** [(](#round-brackets) [expression](#expression) [)](#round-brackets)
            - **type-cast**: [type](#type)
        + **type-method**: [type](#type) [:](#colon) [identifier](#identifier)
        + **object-identifier**: [identifier](#identifier)
        + **self-reference**: [^](#caret)
    - [internal-context-identifier](#internal-context-identifier): [:](#colon) **|** [parent-identifier](#parent-identifier)
    - [data-segment](#data-segment): [data-segment-anchor](#data-segment-anchor)**[data-component]**[data-segment-anchor](#data-segment-anchor).
        + **data-component**: **[any characters not containing the data-segment-anchor]**
    - [assignment-statement](#assignment-statement): **(** [internal-instance-method](#internal-instance-method) **|** [internal-instance-object](#internal-instance-object) **|** [object-declaration](#object-declaration) **)** [=](#equals-sign) [expression](#expression)
    - [statement-body](#statement-body): [{](#curly-brackets) **(** [statement](#statement) **(** [;](#semicolon) **)?** **)\*** [}](#curly-brackets)
    - [method-expression](#method-expression): [\*](#asterisk) **(** **input-list** **)?** **(** **method-body** **|** **(** **(** [->](#arrow) **output-type** **method-body** **)?** [->](#arrow) **output-expression** **)** **)**
        + **input-list**: [(](#round-brackets) [object-declaration](#object-declaration) **(** [,](#comma) [object-declaration](#object-declaration) **)\*** [)](#round-brackets)
        + **method-body**: [statement](#statement)
        + **output-type**: [type](#type)
        + **output-expression**: [expression](#expression)
    - [method-invocation](#method-invocation) syntax description: [\\](#backslash) **(** [expression](#expression) **|** **internal-constructor** **)** **method-inputs**
        + **internal-constructor** syntax description: [internal-context-identifier](#internal-context-identifier) [~](#tilde) **(** **(** [>](#arrow-brackets) **)** **|** [identifier](#identifier) **)**
        + **method-inputs** syntax description: **(** [expression](#expression) **)\***
    - [internal-instance-method](#internal-instance-method): [internal-context-identifier](#internal-context-identifier) [identifier](#identifier)
    - [internal-instance-object](#internal-instance-object): [.](#full-stop) [identifier](#identifier)
    - [anonymous-class-object](#anonymous-class-object): [\[](#square-brackets) **(** [:](#colon) [type](#type) **)+** [\]](#square-brackets) [{](#curly-brackets) **anonymous-class-object-construction** **(** [class-method](#class-method) **)\*** [}](#curly-brackets)
        + **anonymous-class-object-construction**: **(** [statement](#statement) **)\***
    - [prologue-statement](#prologue-statement): [!](#exclamation-mark) [statement](#statement)
    - [statement](#statement): [expression](#expression)




---
***

