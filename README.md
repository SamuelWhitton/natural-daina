# Daina

## Index

* [Tutorial](#tutorial)
    + [Comments](#comments)
    + [Entry Point of a Program](#entry-point-of-a-program)
    + [Classes, Types, Objects and Dependancies](#classes-types-objects-and-dependancies)
    + [Inheritance](#inheritance)
    + [Methods and Lambdas](#methods-and-lambdas)
    + [Constructor Methods, Instance Methods and Type Methods](#constructor-methods-instance-methods-and-type-methods)
    + [Class Generics](#class-generics)
    + [Instance Method Visibility](#instance-method-visibility)
    + [Prologue Statements](#prologue-statements)
    + [Method Generics](#method-generics)
* [More Advanced Topics](#more-advanced-topics)


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
This is the minimal definition of a program, sometimes called **main** in other languages
```
[] {
    *{
        @ The first statement in a program could go here, this is the body of the entry point method of a program
    }
}
```
Whitespace is optional, so the previous example could be written like so
```
[]{*{}}
```

### Classes, Types, Objects and Dependancies
The following example shows the minimal definition of a class called **ClassA**. **ClassA** is the identifier of the class. An identifier can contain one or more alpha numeric characters or underscores.
```
[ClassA] {}
```
Adding another class called **ClassB**.
```
[ClassA] {
    @ This is the body of ClassA
}

[ClassB] {
    @ This is the body of ClassB
}
```
A class can reference other classes if it includes a dependancy list. A class **ClassC** is added which references **ClassA** and **ClassB** with a dependancy list. The dependancy list is comma seperated and can only include the identifiers of other classes.
```
[ClassA] {}

[ClassB] {}

[ClassC] (ClassA, ClassB) {}
```
No circular dependancies are allowed in Daina. Therefore the following example is invalid because **ClassA** depends on **ClassC**, which depends on **ClassB**, which depends on **ClassA**...
```
[ClassA] (ClassC) {} @ Invalid; ClassA is depending on itself through ClassC

[ClassB] (ClassA) {}

[ClassC] (ClassB) {}
```
Daina has a reverse dependancy list which restricts which classes depend on the given class. In the following example, **ClassA** can only be depended apon by **ClassB**.
```
[ClassA] () -> (ClassB) {}

[ClassB] (ClassA) {}
```
An **->** comes before the reverse dependancy list.

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
    [ClassA] aObject
{
}
```
**[ClassA]** is declared to be the type of **aObject**. Types are used to classify objects. A second instance object **bObject** of type **[ClassB]** is added. Instance objects are always added before the body of the class.
```
[ClassA] {}

[ClassB] {}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
}
```
To create objects from these classes, constructor methods must be defined for each class. In the following example, **newA** and **newB** are the constructors for the classes **ClassA** and **ClassB**. Constructors are added to the body of the class, between the **{** **}** brackets.
```
[ClassA] {
    ~ newA *{
         @ Body of the constructor newA
    }
}

[ClassB] {
    ~ newB *{
        @ Body of the constructor newB
    }
}

[ClassC] (ClassA, ClassB)
    [ClassA] aObject
    [ClassB] bObject
{
}
```
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
    ~ newC *{
        @ Invalid; aObject and bObject are not assigned
    }
}
```
The **newC** constructor is defined correctly by assigning **aObject** and **bObject**.
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
        .aObject = \[ClassA]:newA;
        .bObject = \[ClassB]:newB;
    }
}
```
Looking closely at the the first statement that was added:
```
.aObject = \[ClassA]:newA;
```
This statement assigns the instance object **aObject** to the new **[ClassA]** object created by the constructor. Looking at each part individually:

+ **.aObject** refers to the instance object **aObject** (a period is used to refer to an instance object defined within the class).
+ **[ClassA]:newA** refers to the constructor **newA** within the class **ClassA**.
+ **=** assigns the left hand side to the right hand side.
+ **\\** represents the invocation of a method and the result is the object returned by the invoked method. In this case **[ClassA]:newA** is invoked.
+ **;** is used to seperate statements

When a constructor method is invoked, it creates a new object, executes all statements in the constructor and returns the new object. Thus **\\[ClassA]:newA** is an invocation of the constructor **newA** within **ClassA**, and so it evaluates to a new object of the type **[ClassA]**.
Similarly the second statement assigns **bObject** to a new **[ClassB]** object:

```
.bObject = \[ClassB]:newB;
```
The entry point is treated like a class, it uses the same syntax for dependancies. It is limited compared to a class and so cannot have constructors and instance objects. In the following example, an entry point is added which depends on **ClassA** and **ClassB**.
```
[] (ClassA, ClassB) {
    *{
        @ Body of the entry point method
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
We can now refer to **ClassA** and **ClassB** in the entry point method because **ClassA** and **ClassB** are dependancies of the entry point. We create a new local object of the type **[ClassA]** called **foo**.
```
[] (ClassA, ClassB) {
    *{
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
**[ClassA] foo =** declares a new object called **foo** with the type **[ClassA]** and assigns it with the result of the expression given after the **=**. It is possible to assign to a new local object from a previous one. In the following example, **bar** is assigned to the same object as **foo**, such that **bar** and **foo** now refer to the same object.
```
[] (ClassA, ClassB) {
    *{
        [ClassA] foo = \[ClassA]:newA;
        [ClassA] bar = foo;
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
        [ClassB] bar = foo; @ Invalid; foo and bar are declared with different types
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
    +++ greatTask *{
        @ Body of the instance method greatTask
    }
}
```
An instance method is invoked on an object. The instance method **greatTask** can be invoked on any **[ClassC]** object since it is defined within **ClassC**. In the following example, the **greatTask** instance method is invoked on the object **bar**.
```
[] (ClassA, ClassB, ClassC) {
    *{
        [ClassC] foo = \[ClassC]:newC;
        [ClassC] bar = foo;
        \bar:greatTask;
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
**bar:greatTask** refers to the instance method **greatTask** on the object **bar**.

In the following example, when **greatTask** is invoked on **bar**, then a new method **middlingTask** will be invoked on the **aObject** of **bar**.
```
[] (ClassA, ClassB, ClassC) {
    *{
        [ClassC] foo = \[ClassC]:newC;
        [ClassC] bar = foo;
        \bar:greatTask; @ here, middlingTask will be called on the aObject of bar
    }
}

[ClassA] {
    ~ newA *{}
    +++ middlingTask *{}
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
        \.aObject:middlingTask;
    }
}
```

In summary:

+ Classes can have instance methods, instance objects and constructors.
+ Classes and the entry point can only refer to other classes which they have as a dependancy.
+ Circular dependancies are not allowed.
+ Reverse dependancy lists allow dependancies to be restricted to a limited set of other classes.
+ A constructor must assign all instance objects.
+ Types must be adhered to strictly and so instance and local objects cannot be assigned with the wrong type.

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
A **[Dog]** has instance methods **sleep**, **eat**, **bark** and a constructor **createDog**. A **[Bird]** has instance methods **sleep**, **eat**, **chirp** and a constructor **createBird**. We add an entry point method which creates a **[Dog]** called **muffles**, a **[Bird]** called **chandler** and calls some of the instance methods
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
Inheritance can be used to copy all the methods from an existing class into a new class. There is overlap between a **[Dog]** and a **[Bird]** since both have methods for **sleep** and **eat**. In the following example, we create the class **Animal** with the instance methods **sleep**, **eat** and use inheritance to copy these methods into **Dog** and **Bird**
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
    +++ sleep *{}
    +++ eat *{}
}

[Dog :[Animal]] (Animal) {
    ~ createDog *{}
    +++ bark *{}
}

[Bird :[Animal]] (Animal) {
    ~ createBird *{}
    +++ chirp *{}
}
```
Writing **:[Animal]** after the name of a class means that the class will inherit the methods from **[Animal]**. So **Dog** and **Bird** are both inheriting the instance methods **sleep** and **eat** from **[Animal]**. For example when **\muffles:sleep;** is executed, the **sleep** instance method from **[Animal]** is invoked on **muffles** and when **\chandler:sleep;** is executed, the same instance method is invoked on **chandler**. 

Daina has is a rule that a class must evaluate a constructor method of the inherited parent within its constructor. In other words, the constructor methods **createDog** and **createBird** must invoke a constructor from **[Animal]**. In the following example we complete **createBird** and **createDog** with a new constructor **createAnimal**
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
}
```
**$~createAnimal** refers to the constructor **createAnimal** within the inherited parent **[Animal]**. When a parent constructor is invoked, the statements within the body of the parent constructor are executed before the new object is returned. For example when **[Bird]:createBird** is invoked, a new **[Bird]** object is defined, then **createAnimal** is invoked on the new **[Bird]**, and then the new **[Bird]** is returned. Similarly, when the statement **[Dog] muffles = \[Dog]:createDog;** is executed in the entry point method, **createAnimal** is invoked on the new **[Dog]** which is afterwards called **muffles**.

It is possible to override a parent instance method to replace it with a new method. In the following example, an overriding instance method **eat** is added to the class **Bird**
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
    |+++ eat *{
        \:chirp;
        \$:eat;
    }
}
```
Now when the statement **\chandler:eat;** is executed in the entry point method, instead of invoking the instance method **eat** from **[Animal]**, this new method is invoked:
```
|+++ eat *{
    \:chirp;
    \$:eat;
}
```
Looking at each part of this new method:

+ **|** is used to denote an instance method overriding another instance method.
+ **:chirp** refers to an instance method called **chirp** within the class, in this case the class is **Bird**. An instance method refered to like this is always invoked on the same object as the enclosing method.
+ **$:eat** refers to an instance method **eat** within the parent class, in this case the class is **Animal**. An instance method refered to like this is always invoked on the same object as the enclosing method.

When the statement **\chandler:eat;** is executed in the entry point method, first the instance method **chirp** within **[Bird]** is invoked on **chandler**, then the instance method **eat** within **[Animal]** is invoked on **chandler**. Nothing has changed when the statement **\muffles:eat;** is executed in the entry point method.

Since **Dog** is inheriting from **[Animal]**, an object of type **[Dog]** is considered to also be an object of type **[Animal]**. And similarly a **[Bird]** is also an object of type **[Animal]**. In this example, the type of **muffles** and **chandler** is changed to **[Animal]**
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
All the same instance methods are called like before, however there is an issue with the following statements:
```
\muffles:bark;
\chandler:chirp;
```
These statements are no longer valid since **muffles** and **chandler** are now declared to be the type **[Animal]**, and the class **Animal** does not define the instance methods **bark** or **chirp**. To solve this issue, we introduce a new instance method **makeNoise** in **Animal** and then override this method in both **Dog** and **Bird**
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
    +++ makeNoise *{}
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
When **\\muffles:makeNoise;** is executed, the **bark** instance method is invoked on **muffles** because it invokes the overriden instance method **makeNoise** in **Dog** rather then the **makeNoise** instance method in **Animal**. This is because although **muffles** is declared to be of type **[Animal]**, it is actually a **[Dog]** since it is created with the constructor **[Dog]:createDog** which returns a new **[Dog]** object. Similarly, the **chirp** instance method is invoked on **chandler** when the statement **\\chandler:makeNoise;** is executed.

In the following example, we group the **makeNoise**, **eat** and **sleep** instance methods into a new instance method called **eatSleepRoutine**
```
[] (Dog, Bird, Animal) {
    *{
        [Animal] muffles = \[Dog]:createDog;
        \muffles:eatSleepRoutine;
        [Animal] chandler = \[Bird]:createBird;
        \chandler:eatSleepRoutine;
    }
}

[Animal] {
    ~ createAnimal *{}
    +++ sleep *{}
    +++ eat *{}
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
The statement **\\muffles:eatSleepRoutine;** is equivalent to the three previous statements it has replaced:
```
\muffles:makeNoise;
\muffles:eat;
\muffles:sleep;
```
When **eatSleepRoutine** is invoked on **muffles**, then the statement **\\:makeNoise;** actually invokes the overriden version of **makeNoise** within **Dog**. When **\\chandler:eatSleepRoutine;** is executed, the overriden **eat** and **makeNoise** instance methods in **Bird** are invoked insead of the original methods defined in the **Animal** class. This is different from when **\\$:eat;** is executed within **Bird** since using **$:** instead of **:** ensures that the method inherited from the parent will be invoked instead.

It is possible to inherit from more then one class. In this example we have taken out the **eat** and **sleep** instance methods from **Animal** and put them into new classes **HungryCreature** and **SleepyCreature** instead
```
[] (Dog, Bird, Animal) {
    *{
        [Animal] muffles = \[Dog]:createDog;
        \muffles:eatSleepRoutine;
        [Animal] chandler = \[Bird]:createBird;
        \chandler:eatSleepRoutine;
    }
}

[HungryCreature] {
    ~ createHungryCreature *{}
    +++ eat *{}
}

[SleepyCreature] {
    ~ createSleepyCreature *{}
    +++ sleep *{}
}

[Animal :[HungryCreature] :[SleepyCreature]] (SleepyCreature, HungryCreature) {
    ~ createAnimal *{
        \$~createHungryCreature;
        \$$~createSleepyCreature;
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
In the **createAnimal** constructor method, constructors from both the parents **[HungryCreature]** and **[SleepyCreature]** are invoked. **$~createHungryCreature** refers to the constructor method **createHungryCreature** in the first parent **[HungryCreature]**. **$$~createSleepyCreature** refers to the constructor method **createSleepyCreature** in the second parent **[SleepyCreature]**. Whenever **$** is used to refer to a parent, **$$** is used to refer to the second parent, **$$$** refers to the third parent and so on...

In summary:

+ Inheritance can be used to copy all the methods from an existing class into a new class.
+ A class can inherit from multiple parent classes.
+ Within a constructor method, a constructor from each inherited parent must be invoked.
+ An object can be represented as its parent types.
+ Instance methods copied from a parent can be overriden.

### Methods and Lambdas

A method is a basic building block of code which can have zero or more input objects, a method body with zero or more executable statements, and optionally an output object. Constructor methods and instance methods are both types of methods. Daina has are a number of ways to express a method, here are a few examples:

1. A method with no inputs or outputs. The method body is always between the **{** **}** brackets:

```
*{
    @ method body
}
```

2. A method with a single input of type **[A]** called **aInput**:

```
*([A]aInput){}
```

3. A method with an **[A]** and **[B]** input, which returns the **[B]** input. The **->[B]** denotes that the return object is of type **[B]**. The **-> bInput** denotes that the object called **bInput** is returned by the method:

```
*([A]aInput,[B]bInput)->[B]{
} -> bInput
```

4. A method taking no arguments, and returns a object called **aOutput** of type **[A]** which is defined by a statement inside the method body:

```
*->[A]{
    [A] aOutput = \[A]:newA;
} -> aOutput
```

5. A method returning an **[A]** object defined as the result of an expression after the return **->**:

```
*->[A]{} -> \[A]:newA
```

A method can be encasulated as a object, this is commonly called a lambda expression in other languages. The following example shows statements assigning the previous example methods as local objects:
```
[] (A, B) {
    *{
        [->] method1 = *{
                @ method body
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
Each lambda object has a lambda type which is written before the method name in each of the above method assignment statements. A lambda type shows the input object types and the output type. For example, the type **[[A][B][C]->[D]]** is for a lambda object with the inputs **[A]**, **[B]**, **[C]** (in that order) and a **[D]** object output.

Lambda objects can be invoked just like any other method. A lambda object must be invoked with objects correctly matching the input types. When a lambda object is invoked, the statements in the assigned method are evaluated with the given inputs, and then the return object is returned. An invocation for each method in the previous example is shown
```
[] (A, B) {
    *{
        [->] method1 = *{
                @ method body
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
        \method1;                                   @ Invoking method1
        \method2 inputA;                            @ Invoking method2
        [B] method3Output = \method3 inputA inputB; @ Invoking method3
        [A] method4Output = \method4;               @ Invoking method4
        [A] method5Output = \method5;               @ Invoking method5
    }
}
```
All methods are invoked by writing **\\** first, then the method, and then each of the input objects. The result of a method invocation is the output object, or no result if there is no output.

The inputs of a method can be of any type including a lambda object. In other words, the input to a method can be another method. In this example, the lambda object **choose** has an input lambda object called **choice**
```
[] (Tool) {
    *{
        [[[Tool][Tool]->[Tool]][Tool][Tool]->[Tool]] choose = *([[Tool][Tool]->[Tool]] choice, [Tool] first, [Tool] second) {
                [Tool] chosenTool = \choice first second;
            } -> chosenTool;
    }
}

[Tool] {
    ~ newTool *{}
}
```
The intent of the **choose** method is to choose a **[Tool]** out of the inputs **first** and **second** using the lambda method **choice**. In the following example, lambda methods **chooseFirst** and **chooseSecond** are defined to show example usages of **choose**
```
[] (Tool, Hammer, Saw) {
    *{
        [[[Tool][Tool]->[Tool]][Tool][Tool]->[Tool]] choose = *([[Tool][Tool]->[Tool]] choice, [Tool] first, [Tool] second) {
                [Tool] chosenTool = \choice first second;
            } -> chosenTool;
        [Tool] hammer = \[Hammer]:newHammer;
        [Tool] saw = \[Saw]:newSaw;
        [[Tool][Tool]->[Tool]] chooseFirst = *([Tool] first, [Tool] second) {} -> first;
        [[Tool][Tool]->[Tool]] chooseSecond = *([Tool] first, [Tool] second) {} -> second;
        [Tool] firstTool = \choose chooseFirst hammer saw;
        [Tool] secondTool = \choose chooseSecond hammer saw;
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
The result is that **firstTool** is the same as the object **hammer**, and **secondTool** is the same as the object **saw**.

Inside the body of a lambda method all outside objects can be refered to. In other words, a lambda method is not isolated from the outside world. In this example, the **chooseHammerOrSaw** lambda method refers to the local objects **hammer** and **saw** which were defined outside of the lambda method
```
[] (Tool, Hammer, Saw) {
    *{
        [Hammer] hammer = \[Hammer]:newHammer;
        [Saw] saw = \[Saw]:newSaw;
        [[[Hammer][Saw]->[Tool]]->[Tool]] chooseHammerOrSaw = *([[Hammer][Saw]->[Tool]] choice) {
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
Lambda methods **chooseHammer** and **chooseSaw** are defined to show example usages of **chooseHammerOrSaw**
```
[] (Tool, Hammer, Saw) {
    *{
        [Hammer] hammer = \[Hammer]:newHammer;
        [Saw] saw = \[Saw]:newSaw;
        [[[Hammer][Saw]->[Tool]]->[Tool]] chooseHammerOrSaw = *([[Hammer][Saw]->[Tool]] choice) {
                [Tool] chosenTool = \choice hammer saw;
            } -> chosenTool;
        [[Hammer][Saw]->[Tool]] chooseHammer = *([Hammer] h, [Saw] s) {} -> h;
        [[Hammer][Saw]->[Tool]] chooseSaw = *([Hammer] h, [Saw] s) {} -> s;
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

The names of local objects and inputs are not allowed to conflict with one another. In the previous example, **chooseHammer** and **chooseSaw** both have inputs called **h** and **s**, these do not conflict because inputs are only accessable within the respective methods. However if we took the previous example and replaced the identifiers **h** and **s** with **hammer** and **saw**, this would not be allowed because it conflicts with the previous **hammer** and **saw** which were already defined:
```
[] (Tool, Hammer, Saw) {
    *{
        [Hammer] hammer = \[Hammer]:newHammer; @ original definition of hammer
        [Saw] saw = \[Saw]:newSaw; @ original definition of saw
        [[[Hammer][Saw]->[Tool]]->[Tool]] chooseHammerOrSaw = *([[Hammer][Saw]->[Tool]] choice) {
                [Tool] chosenTool = \choice hammer saw;
            } -> chosenTool;
        [[Hammer][Saw]->[Tool]] chooseHammer = *([Hammer] hammer, [Saw] saw) {} -> hammer; @ Invalid, hammer and saw are already defined
        [[Hammer][Saw]->[Tool]] chooseSaw = *([Hammer] hammer, [Saw] saw) {} -> saw; @ Invalid, hammer and saw are already defined
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

In summary:

+ A method has zero or more inputs objects, a body with statements, and an optional output object.
+ Methods are invoked by writing **\\**, then the method, and then each of the input objects. The result of a method invocation is the output object.
+ A method can be encapsulated as a lambda object.
+ A method can refer to objects outside of the method.


### Constructor Methods, Instance Methods and Type Methods

Constructor methods are unique because they cannot explicitly return a value like other methods. A constructors job is to construct and return a new object of the type matching the class. However, a constructor method can have input objects. In the following example, a constructor called **newHatContainer** is defined for **[HatContainer]** which takes an input of type **[Hat]** and assigns it as an instance object
```
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
**newHatContainer** is invoked similar to other methods with the inputs written after **[HatContainer]:newHatContainer**. A **[HatContainer]** object is created called **hatContainer**
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
}

[Hat] {
    ~ newHat *{}
}
```
Instance methods can have inputs and optionally return an object. Instance methods are invoked on an object and can access the instance objects and methods within the object it is invoked on. We add an instance method **getHat** which returns the **hat** object from **[HatContainer]**, and then we retrive it as **hatTakenFromContainer**
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
Type methods (similar to static or class methods in other object oriented languages) can take inputs and optionally return an object. A type method is not attached to an instance, and is invoked similarly to a constructor method. A type method **createHatContainer** is added which creates a **[HatContainer]**, similar to the constructor **newHatContainer**, and then we invoke this method to create **hatContainer2**
```
[] (Hat, HatContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getHat;
        [HatContainer] hatContainer2 = \[HatContainer]:createHatContainer someHat;
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
In the following example, we add type method **getHatFromHatContainer** which gets the **hat** from a **[HatContainer]**, then we invoke this method and name the result **hatTakenFromContainer2**
```
[] (Hat, HatContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getHat;
        [HatContainer] hatContainer2 = \[HatContainer]:createHatContainer someHat;
        [Hat] hatTakenFromContainer2 = \[HatContainer]:getHatFromHatContainer hatContainer2;
    }
}

[HatContainer] (Hat)
    [Hat] hat
{
    :: createHatContainer *([Hat] hat) -> [HatContainer] {
        [HatContainer] newHatContainer = \[HatContainer]:newHatContainer hat;
    } -> newHatContainer

    :: getHatFromHatContainer *([HatContainer] hatContainer) -> [Hat] {
        [Hat] hatFromHatContainer = \hatContainer:getHat;
    } -> hatFromHatContainer

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

+ Instance methods and type methods have zero or more inputs objects and an optional output object. Constructor methods can have zero or more inputs and always return a new object of the enclosing class.
+ An instance method is invoked on a object. Type methods and constructor methods are not invoked on an object.
+ An instance method can access the instance objects and methods within the object it is invoked on.
+ Instance methods, type methods and constructor methods are invoked by writing **\\**, then the method, and then each of the input objects. The result of a method invocation is the output object.


### Class Generics

Consider the previous example of a **[HatContainer]**
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
It is also useful to contain a **[Shoe]**, and so we create a **[ShoeContainer]** which is very similar to a **[HatContainer]**
```
[] (Hat, HatContainer, Shoe, ShoeContainer) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [HatContainer] hatContainer = \[HatContainer]:newHatContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getHat;

        [Shoe] someShoe = \[Shoe]:newShoe;
        [ShoeContainer] shoeContainer = \[ShoeContainer]:newShoeContainer someShoe;
        [Shoe] shoeTakenFromContainer = \shoeContainer:getShoe;
    }
}

[ShoeContainer] (Shoe)
    [Shoe] shoe
{
    ~ newShoeContainer *([Shoe] shoeInput) {
        .shoe = shoeInput;
    }
    +++ getShoe *->[Shoe]{}->.shoe
}

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
**[ShoeContainer]** and **[HatContainer]** are almost the same except one contains a **[Shoe]** and the other contains a **[Hat]**. Using class generics we can combine **ShoeContainer** and **HatContainer** into a single class. In the following example, we introduce a generic type **[&CONTAINED_OBJECT]** to a new class called **Container** and use this new class to replace **ShoeContainer** and **HatContainer**
```
[] (Hat, Shoe, Container) {
    *{
        [Hat] someHat = \[Hat]:newHat;
        [Container<[Hat]>] hatContainer = \[Container<[Hat]>]:newContainer someHat;
        [Hat] hatTakenFromContainer = \hatContainer:getContainedObject;

        [Shoe] someShoe = \[Shoe]:newShoe;
        [Container<[Shoe]>] shoeContainer = \[Container<[Shoe]>]:newContainer someShoe;
        [Shoe] shoeTakenFromContainer = \shoeContainer:getContainedObject;
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
Within the **Container** class, **< CONTAINED_OBJECT >** is written after the class name to declare the generic type **[&CONTAINED_OBJECT]**. A generic type is always represented with a **&** symbol. **[Container<[Hat]>]** is similar to **[HatContainer]** and represents the **Container** class where every usage of **[&CONTAINED_OBJECT]** is instantiated with **[Hat]**. Similarly, **[Container<[Shoe]>]** represents instantiating **[&CONTAINED_OBJECT]** with **[Shoe]**.

Explicitly replacing **[&CONTAINED_OBJECT]** with **[Hat]** in the **Container** class to represent **[Container<[Hat]>]**:
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
Similarly replacing **[&CONTAINED_OBJECT]** with **[Shoe]** in the **Container** class to represent **[Container<[Shoe]>]**:
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
**[Container<[Hat]>]** and **[Container<[Shoe]>]** are considered to be incompatible types, in other words it is invalid to assign a **[Container<[Hat]>]** object as a **[Container<[Shoe]>]** object and vise versa. For example, the following assignment of **shoeContainer** and **hatContainer** is invalid:
```
[] (Hat, Shoe, Container) {
    *{
        [Shoe] someShoe = \[Shoe]:newShoe;
        [Container<[Shoe]>] shoeContainer = \[Container<[Hat]>]:newContainer someShoe; @ Invalid; a [Container<[Hat]>] is not compatible with a [Container<[Shoe]>]
        [Hat] someHat = \[Hat]:newHat;
        [Container<[Hat]>] hatContainer = \[Container<[Shoe]>]:newContainer someHat; @ Invalid; a [Container<[Shoe]>] is not compatible with a [Container<[Hat]>]
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
**[Container<[Hat]>]** and **[Container<[Shoe]>]** are incompatible types, but not every **Container** type is incompatible. In the following example, a **[Container<[Hat]>]** **hatContainer** is assigned to a new **[Container<[BowlerHat]>]** and **BowlerHat** inherits from **Hat**
```
[] (Hat, BowlerHat, Container) {
    *{
        [BowlerHat] someBowlerHat = \[BowlerHat]:newBowlerHat;
        [Container<[Hat]>] hatContainer = \[Container<[BowlerHat]>]:newContainer someBowlerHat;
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

[BowlerHat] (Hat) {
    ~ newBowlerHat *{
        \$~newHat;
    }
}

[Hat] {
    ~ newHat *{}
}
```
In the above example, **someBowlerHat** and **hatTakenFromContainer** represent the same object. In general, types with a generic instantiation are compatible if the instantiated types are compatible. Applying this to **Container**, if **[G]** is a parent type of **[H]** then **[Container<[G]>]** is a parent type of **[Container<[H]>]**.

A class can have more then one generic type. We define a **Tuple** object containing two instance objects **first** and **second**, corresponding to the generic types **[&FIRST]** and **[&SECOND]**
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
**< FIRST, SECOND >** is written after the **Tuple** class name to declare the generic types **[&FIRST]** and **[&SECOND]**. Any number of generics can be declared here by writing identifiers in a comma seperated list. When a **Tuple** object is defined, both the generic types must be instantiated. In the following example, an object **bananaAndApple** is defined which contains a **[Banana]** and an **[Apple]**
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
The type of **bananaAndApple** is **[Tuple<[Banana][Apple]>]**; between the **<** **>** is written the list of types instantiating the corresponding generics types. Regarding **[Tuple<[Banana][Apple]>]**, the first type **[Banana]** instantiates the first generic type **[&FIRST]**, the second type **[Apple]** instantiates the second generic type **[&SECOND]**.

In the following example, we change **Tuple** into **Triple** which contains a third instance object corresponding to a third generic type, and define a corresponding object **[Triple<[Banana][Apple][Grape]>]** **bananaAndAppleAndGrape**
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
Any type can be used to instantiate a generic, including a type which itself has generics. Embedded generics are demonstrated in the following example; using **Tuple**, an object **[Tuple<[Banana][Tuple<[Apple][Grape]>]>]** **bananaAndAppleAndGrape** is created which contains a **[Banana]** and a **[Tuple<[Apple][Grape]>]**
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
In general, types with a generic instantiation are compatible if the instantiated types are compatible, this also applies to types with multiple generic instantiations. Since ** [Fruit]** is the parent type of **[Banana]**, **[Apple]** and **[Grape]**, the following are the parent types of **[Tuple<[Banana][Tuple<[Apple][Grape]>]>]**:

+ **[Tuple < [Fruit][Tuple<[Apple][Grape]>]>]**
+ **[Tuple<[Banana][Tuple<[Fruit][Grape]>]>]**
+ **[Tuple<[Banana][Tuple<[Apple][Fruit]>]>]**
+ **[Tuple<[Fruit][Tuple<[Fruit][Grape]>]>]**
+ **[Tuple<[Fruit][Tuple<[Apple][Fruit]>]>]**
+ **[Tuple<[Banana][Tuple<[Fruit][Fruit]>]>]**
+ **[Tuple<[Fruit][Tuple<[Fruit][Fruit]>]>]**

Here are some example valid assignments using the **bananaAndAppleAndGrape** object:
```
[] (Tuple, Banana, Apple, Grape) {
    *{
        [Banana] banana = \[Banana]:newBanana;
        [Apple] apple = \[Apple]:newApple;
        [Grape] grape = \[Grape]:newGrape;
        [Tuple<[Apple][Grape]>] appleAndGrape = \[Tuple<[Apple][Grape]>]:newTuple apple grape;
        [Tuple<[Banana][Tuple<[Apple][Grape]>]>] bananaAndAppleAndGrape = \[Tuple<[Banana][Tuple<[Apple][Grape]>]>]:newTuple banana appleAndGrape;

        [Tuple<[Banana][Tuple<[Fruit][Fruit]>]>] bananaAnd2Fruits = bananaAndAppleAndGrape;
        [Tuple<[Fruit][Tuple<[Apple][Fruit]>]>] 2FruitsAndAnApple = bananaAndAppleAndGrape;
        [Tuple<[Fruit][Tuple<[Fruit][Fruit]>]>] 3Fruits = 2FruitsAndAnApple;
    }
}
```
For a type to be a parent, every generic instantiation must be a parent or equivalent. So for example, **[Tuple<[Fruit][Apple]>]** is not a parent or child type of **[Tuple<[Apple][Fruit]>]**, because **[Fruit]** is a parent of **[Apple]** but **[Apple]** is not a parent of **[Fruit]**. Here are some invalid assignments added to the previous example:
```
[] (Tuple, Banana, Apple, Grape) {
    *{
        [Banana] banana = \[Banana]:newBanana;
        [Apple] apple = \[Apple]:newApple;
        [Grape] grape = \[Grape]:newGrape;
        [Tuple<[Apple][Grape]>] appleAndGrape = \[Tuple<[Apple][Grape]>]:newTuple apple grape;
        [Tuple<[Banana][Tuple<[Apple][Grape]>]>] bananaAndAppleAndGrape = \[Tuple<[Banana][Tuple<[Apple][Grape]>]>]:newTuple banana appleAndGrape;

        [Tuple<[Banana][Tuple<[Fruit][Fruit]>]>] bananaAnd2Fruits = bananaAndAppleAndGrape;
        [Tuple<[Fruit][Tuple<[Apple][Fruit]>]>] 2FruitsAndAnApple = bananaAndAppleAndGrape;
        [Tuple<[Fruit][Tuple<[Fruit][Fruit]>]>] 3Fruits = 2FruitsAndAnApple;

        [Tuple<[Banana][Tuple<[Apple][Fruit]>]>] bananaAndAppleAndFruit = 2FruitsAndAnApple; @ Invalid; a [Fruit] is not a [Banana] (even though we know that the actual object here is a [Banana] on the inside)
        [Tuple<[Fruit][Tuple<[Fruit][Grape]>]>] 2FruitsAndAGrape = 3Fruits; @ Invalid; a [Fruit] is not a [Grape]
        [Tuple<[Banana][Tuple<[Fruit][Fruit]>]>] 2FruitsAndABanana = 2FruitsAndAnApple; @ Invalid; an [Apple] is a [Fruit], but a [Fruit] is not a [Banana]
    }
}
```
Generic types can also be used within the type methods of a class. In the following example, a type method **tripleFromTuple** is added to the **Triple** class and is used to transform **bananaAppleGrapeAsATuple** into **bananaAppleGrapeAsATriple**
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
Lamba types can be used to instantiate generics. In the following example **aTupleOfLambdaObjects** is created
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

+ Any number of generic types can be declared for a class, and then used anywhere inside the class.
+ A generic can be instantiated by any type, including another generic type or a lambda type.
+ All class generic types are instantiated when invoking a constructor, invoking a type method or declaring an object.
+ If you change one of the instantiations of a generic type to a parent type, the generic type also becomes a parent type. For example, if **[C]** is a parent type of **[B]** then **[Tuple<[A][C]>]** is a parent type of **[Tuple<[A][B]>]**.


### Instance Method Visibility

The visibility of an instance method determines in which context it can be invoked. Some other languages with this concept have keywords such as 'public', 'private' and 'protected' to determine in which parts of the code can a given instance method be accessed. A Daina instance method has three aspects of visibility which can be set independantly:

+ Externally (can be either visible or invisible)
+ Type (can be either visible or invisible)
+ Inherited (can be either visible or invisible)

The instance method visibility is indicated with three **+** (meaning visible) or **-** (meaning hidden) for external visibility, type visibility and inherited visibility respectively. Here are eight examples instance methods showing all possible combinations:
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

When an instance method is marked with **---**, it is considered maximally invisible and can only be accessed by other instance methods or constructors within the same object. This is called internal visibility and is always avaliable by default. **---** is equivalent to 'private' in some other languages. The following example shows a maximally invisible instance method called **cabbage**
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
Since **cabbage** is marked as **---**, it can only be accessed within **newNi** or **foo** since these are the only other constructor and instance method of **Ni**. It is not possible to access **cabbage** in child classes. In the following example **Nu** inherits from **Ni** but cannot access **cabbage**
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
        \:cabbage; @ Invalid; Ni is the parent, but cabbage is invisible here
    }
}
```
It is not possible to access **cabbage** outside the class **Ni**, but it is also not possible to access **cabbage** on a different **[Ni]** object inside the class **Ni**:
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid, cabbage is invisible here
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
        \ni:cabbage; @ Invalid, inside the class Ni, but ni's cabbage is invisible here
    }
    :: sha *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid, inside the class Ni, but ni's cabbage is invisible here
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage; @ Invalid; Ni is the parent, but cabbage is invisible here
    }
}
```
Since **cabbage** cant be accessed inside the child class **Nu**, it is not possible to override **cabbage**:
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid, cabbage is invisible here
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
        \ni:cabbage; @ Invalid, inside the class Ni, but ni's cabbage is invisible here
    }
    :: sha *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid, inside the class Ni, but ni's cabbage is invisible here
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage; @ Invalid; Ni is the parent, but cabbage is invisible here
    }
    |--- cabbage *{} @ Invalid; Ni is the parent, but cabbage is invisible here and thus cannot be overriden
}
```
If the visibility of **cabbage** is changed to **-+-** it gains type visibility. The change from **---** is that **cabbage** can now be accessed on any **[Ni]** object inside the **Ni** class:
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Invalid, cabbage is invisible here
    }
}

[Ni] {
    -+- cabbage *{}
    ~ newNi *{
        \:cabbage;
    }
    +++ foo *{
        \:cabbage;
    }
    +++ bar *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage can be accessed due to type visibility
    }
    :: sha *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage can be accessed due to type visibility
    }
}

[Nu :[Ni]] (Ni) {
    ~ newNu *{
        \$~newNi;
    }
    +++ bar *{
        \:cabbage; @ Invalid; Ni is the parent, but cabbage is invisible here
    }
    |-+- cabbage *{} @ Invalid; Ni is the parent, but cabbage is invisible here and thus cannot be overriden
}
```
If the visibility of **cabbage** is changed to **++-** it gains external visibility. The change from **-+-** is that **cabbage** can now be accessed on any **[Ni]** object inside or outside the **Ni** class:
```
[] (Ni) {
    *{
        [Ni] ni = \[Ni]:newNi;
        \ni:cabbage; @ Now valid; ni's cabbage can be accessed due to external visibility
    }
}

[Ni] {
    ++- cabbage *{}
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
        \:cabbage; @ Invalid; Ni is the parent, but cabbage is invisible here
    }
    |++- cabbage *{} @ Invalid; Ni is the parent, but cabbage is invisible here and thus cannot be overriden
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
    +++ cabbage *{}
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
        \:cabbage; @ Now valid; cabbage is visibile here due to inherited visibility
    }
    |+++ cabbage *{} @ Now valid; cabbage is visibile here due to inherited visibility
}
```
When overriding an instance method, the visibility can be the same or more visible, but not less visible. In the following example, **cabbage1** and **cabbage2** are correctly overriden, but **cabbage3** and **cabbage4** are invalid because they are overriden without visibilities which the original methods had
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
    |-++ cabbage3 *{} @ Invalid; requires external visibility like cabbage3 from Ni
    |+-+ cabbage4 *{} @ Invalid; requires type visibility like cabbage4 from Ni
}
```
Most combinations of visibilities would not be used very often and dont usually need to be considered. The following are the most used:

+ **---** only allows access within the same instance, it is similar to the private modifer in some other languages
+ **+++** allows access everywhere, it is similar to the public modifer in some other languages
+ **--+** allows access within the same instance and child instances which inherit the method, it is similar to the protected modifer in some other languages

There are some abbreviations avaliable:

+ **-** is the same as **---**
+ **+** is the same as **--+**
+ **++** is the same as **+++**


### Prologue Statements

A prologue statement allows prior statments to be written afterwards. A prologue statement is designated with an exclaimation mark (**!**). The following example uses **!** to designate the next statement as a prologue statment
```
[] (Dog) {
    *{
        \elis:bark
            ! [Dog] elis = \[Dog]:newDog;
    }
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
```
A prologue statement can be a group of statements:
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
```
A prologue statement can also be written at the end of a method, even the entry point method:
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
```
A prologue statements can be embedded in other prologue statements:
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
```
Assignments in prologue statements are only visible to the statement or group of statements which had **!** written after it. The following example is invalid becuase the assignment of **jay** is not visible to the statement **\jay:sleep;**
```
[] (Dog) {
    *{
        \jay:bark @ Valid; jay is visible here
            ! [Dog] jay = \[Dog]:newDog;
        \jay:sleep; @ Invalid; jay is not visible here
    }
}
```


### Method Generics

Method generics allow the output type of a method to be based on the inputs. The following example method **identity** simply returns the input
```
[] {
    *{
        [['A]->['A]] identity = *(['A] input)->['A] {} -> input;
    }
}
```
The type **['A]** represents a method generic type with the name **A**. **['A]** can represent any type. When **identity** is invoked, the instantiation type of **['A]** is determined and all **['A]**'s are replaced with this type. Here are some examples of invoking **identity**
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
Methods can have multiple method generic types. In the following example, the return type of **chooseFirstOption** is determined by the first input, and the return type of **chooseSecondOption** is determined by the second input
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
A method can use the same method generic type multiple times, but the uses of the same method generic type must all have a common parent. In the following example, the return type of **chooseFirstOption** is determined by the common type of both inputs
```
[] (Hammer, Saw, Cat) {
    *{
        [['A]['A]->['A]] chooseFirstOption = *(['A] first, ['A] second)->['A] {} -> first;
        [Cat] cat = \[Cat]:newCat;
        [Saw] saw = \[Saw]:newSaw;
        [Hammer] hammer = \[Hammer]:newHammer;
        [Cat] theSameCat = \chooseFirstOption cat saw; @ Invalid; [Saw] is not a [Cat], ['A] cant be determined
        [Tool] theSameSaw = \chooseFirstOption saw hammer; @ Valid; [Tool] is a common type between [Saw] and [Hammer], ['A] is [Tool]
        [Hammer] theSameHammer = \chooseFirstOption hammer saw; @ Invalid; ['A] is [Tool], therefore the return type is [Tool] not [Hammer]
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
Lambda object inputs can contain method generic types. In the following example, **invokeLambda** invokes a lambda object **inputLambda** and returns the result
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
Consider the tuple class used previously:
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
Method generics can be used for methods inside a class. The instance method **changeFirst** is added, which returns a new **[Tuple]** where just the first object is changed:
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
    } -> \[Tuple<['NEW_FIRST][&SECOND]>]:newTuple newFirst .second;
}
```
Example use of **changeFirst**, changing **hammerAndSaw** into **catAndSaw**:
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
    } -> \[Tuple<['NEW_FIRST][&SECOND]>]:newTuple newFirst .second;
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
Adding a similar method called **changeSecond** and changing **catAndSaw** into **catAndHammer**:
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
    } -> \[Tuple<['NEW_FIRST][&SECOND]>]:newTuple newFirst .second;

    +++ changeSecond *(['NEW_SECOND] newSecond) -> [Tuple<[&FIRST]['NEW_SECOND]>] {
    } -> \[Tuple<[&FIRST]['NEW_SECOND]>]:newTuple .first newSecond;
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

+ A method can have any number of method generics types.
+ Method generic types can be used in the input and output of a method.
+ When a method is invoked, the method generic types are determined by the type of the inputs.
+ Method generic types can be used to dynamically choose the output type when a method is invoked.


## More Advanced Topics



---
***

