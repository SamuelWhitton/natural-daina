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

A class must invoke a constructor method from the inherited parent class within its constructor. In other words, the constructor methods **createDog** and **createBird** must invoke a constructor from **[Animal]**. In the following example we correctly implement **createBird** and **createDog** by invoking a constructor **createAnimal** from the **Animal** class.
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
The statement **\\$~createAnimal;** will invoke the **createAnimal** parent constructor on the object being constructed. For example when **[Bird]:createBird** is invoked, a new **[Bird]** object is created, then **createAnimal** is invoked on the new **[Bird]**, and then the new **[Bird]** is returned. Similarly, consider the statement **[Dog] muffles = \[Dog]:createDog;**, a new **[Dog]** is created, then **createAnimal** will be invoked on the new **[Dog]** which is afterwards called **muffles**.

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
    |+++ eat *{
        \:chirp;
        \$:eat;
    }
}
```
Breaking down the new **eat** method:
```
|+++ eat *{
    \:chirp;
    \$:eat;
}
```

+ **|** is used to denote overriding an instance method.
+ **:chirp** refers to the instance method called **chirp** within the enclosing class. **\\:chirp;** invokes **chirp** on the same object as the enclosing method. In other languages, sometimes refered to as invoking an instance method **chirp** on self.
+ **$:eat** refers to the instance method called **eat** within the parent class. **\\$:eat;** invokes the **eat** method from **Animal** on the same object as the enclosing method. In other languages, sometimes refered to as invoking an instance method **eat** on super.

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
All the same instance methods are called like before, however there is an issue with the following statements:
```
\muffles:bark;
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
**\\muffles:makeNoise;** will invoke **makeNoise** from **[Dog]** thus invoking **bark**, and **\\chandler:makeNoise;** will invoke **makeNoise** from **[Bird]** thus invoking **chirp**. Although **muffles** and **chandler** are declared as the type **[Animal]**, they are also a **[Dog]** and a **[Bird]** and so the overriding methods are called instead, this is commonly called polymorphism.

In the following example, the **makeNoise**, **eat** and **sleep** instance methods are replaced by a new instance method called **eatSleepRoutine** which invokes all three methods.
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
Consider the **eatSleepRoutine** instance method:
```
+++ eatSleepRoutine *{
    \:makeNoise;
    \:eat;
    \:sleep;
}
```
If any of the instance methods **makeNoise** **eat** **sleep** are overriden, then **\\:makeNoise**, **\\:eat** and **\\:sleep** will invoke the overriden methods. The statement **\muffles:eatSleepRoutine;** will invoke the **makeNoise** method from the **Dog** class and the **eat** **sleep** methods from the **Animal** class. The statement **\chandler:eatSleepRoutine;** will invoke the **makeNoise** **eat** methods from the **Bird** class and the **sleep** method from the **Animal** class.

Daina allows a class to inherit from more then one other class. In the following example, the **eat** and **sleep** instance methods have been taken from **Animal** and put into new classes **HungryCreature** and **SleepyCreature**. The **Animal** clas inherits from both **[HungryCreature]** and **[SleepyCreature]**.
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
In the **createAnimal** constructor method, constructors from the parents **[HungryCreature]** and **[SleepyCreature]** are invoked. **$~createHungryCreature** refers to the constructor method **createHungryCreature** in the first parent **[HungryCreature]**. **$$~createSleepyCreature** refers to the constructor method **createSleepyCreature** in the second parent **[SleepyCreature]**. **$** is used to refer to the first parent, **$$** is used to refer to the second parent, **$$$** refers to the third parent and so on...

In summary:

+ Inheritance can be used to copy all the methods from an existing class into a new class.
+ A class can inherit from multiple parent classes.
+ Within a constructor method, a constructor from each inherited parent must be invoked.
+ An object can be represented as any of its parent types.
+ Instance methods copied from a parent can be overriden.

### Methods and Lambdas

A method is a basic building block of code which can have zero or more input objects, a method body with zero or more executable statements, and optionally an output object. There are a number of ways to express a method in Daina, here are a few examples:

1. A method with no inputs or outputs. The method body is always between the **{** **}** brackets:

```
*{
    @ method body
}
```

2. A method with a single input object. The input is called **aInput** and is of type **[A]**:

```
*([A]aInput){}
```

3. A method with two inputs and an output. The **->[B]** denotes that the output object is of type **[B]**. The **-> bInput** denotes that the object called **bInput** is the output:

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

5. A method returning an object which is determined by the result of an expression. The result of **\\[A]:newA** is the output. This method is equivalent to number 4:

```
*->[A]{} -> \[A]:newA
```

A method can be encasulated as a object, which is commonly called a lambda in other languages. The following example shows statements assigning the previous example methods as lambda objects:
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
Each of the lambda objects in the above example has a lambda type. A lambda type describes the input types and the output type. For example, the type **[[A][B][C]->[D]]** is the type of a lambda object with the input types **[A]**, **[B]**, **[C]** (in that order) and a **[D]** output type.

Methods are invoked by writing **\\**, then the method, and then each of the input objects in order. The result of a method invocation is the output object (if there is an output). We add an example invocation for each of the lambda methods from the previous example.
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
When invoking **method3**, the second input is the output, therefore **method3Output** and **inputB** both refer to the same object. Invoking **method4** or **method5** will generate a new **[A]** object, thus **inputA**, **method4Output**, and **method5Output** all refer to different **[A]** objects.

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
The intent of the **chooseTool** method is to choose a **[Tool]** out of the inputs **firstTool** and **secondTool**. The lambda method **choiceOutOfTwoTools** takes two **[Tool]**'s as input and returns one as the output. In the following example, **chooseFirst** and **chooseSecond** are used to pick between a **[Saw]** and a **[Hammer]**.
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
        [Tool] firstTool = \chooseTool chooseFirst hammer saw;
        [Tool] secondTool = \chooseTool chooseSecond hammer saw;
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

The names of local objects and inputs are not allowed to conflict with one another. In the previous example, **chooseHammer** and **chooseSaw** both have inputs called **h** and **s** which do not conflict because inputs are only accessable within the respective methods. However if we take the previous example and replace the identifiers **h** and **s** with **hammer** and **saw**, these conflict with the previous **hammer** and **saw** which were declared outside the lambda methods.
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

In summary:

+ A method has zero or more inputs objects, a body with statements, and an optional output object.
+ Methods are invoked by writing **\\**, then the method, and then each of the input objects. The result of a method invocation is the output object.
+ A method can be encapsulated as a lambda object.
+ A method can refer to objects which were previously declared outside of the method.


### Constructor Methods, Instance Methods and Type Methods

There are three kinds of methods that can be attached to a class; constructor methods, instance methods and type methods.

Constructor methods can have input objects but can't have an explict output object. Instead, a constructor's output object is always a new object of the class. In the following example, a constructor called **newHatContainer** is declared for **[HatContainer]** which takes an input **hatInput** and assigns it as the instance object **hat**.
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
A new object **hatContainer** is created by invoking the constructor **[HatContainer]:newHatContainer** with the input **someHat**.
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
The instance object **hat** within **hatContainer** now refers to the same object as **someHat**.

Instance methods can have inputs objects and an output object. Instance methods are invoked on an object of the class and can access the instance objects and methods of the object it is invoked on. We add an instance method **getHat** which returns the **hat** instance object from a **[HatContainer]**. The **hat** object in **hatContainer** is retrived as **hatTakenFromContainer**.
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
**hatTakenFromContainer** is referring to the same object as **someHat**.

Type methods (similar to static or class methods in other object oriented languages) can have input objects and an output object. A type method is not attached to any object and is instead invoked similar to a constructor. A type method **createHatContainer** is added which creates a **[HatContainer]** and then we invoke this method to create **hatContainer2**.
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
Constructor and type methods look similar when invoked, but a type method can have any output.

In the following example, we add type method **getHatFromHatContainer** which retrives the **hat** instance object from a **[HatContainer]**. Then we invoke this method and name the output **hatTakenFromContainer2**.
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

+ Instance methods and type methods have zero or more inputs objects and an optional output object. Constructor methods have zero or more inputs and always return a new object of the class.
+ An instance method is invoked on a object. Type methods and constructor methods are not invoked on an object.
+ An instance method can access the instance objects and methods of the object it is invoked on.
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
In the following example, a **[ShoeContainer]** is defined which is very similar to a **[HatContainer]** but contains a **[Shoe]** instead of a **[Hat]**. A **[ShoeContainer]** called **shoeContainer** is added.
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
Using class generics we can combine **ShoeContainer** and **HatContainer** into a single class. In the following example, we introduce a new class **Container** with a class generic type **[&CONTAINED_OBJECT]** and use this new class to replace **ShoeContainer** and **HatContainer**.
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
**< CONTAINED_OBJECT >** is written after the class name **Container** to declare the class generic type **[&CONTAINED_OBJECT]**. A class generic type is always represented with an **&** symbol. **[Container<[Hat]>]** is similar to **[HatContainer]** and represents the **Container** class where every usage of **[&CONTAINED_OBJECT]** is instantiated with **[Hat]**. Similarly, **[Container<[Shoe]>]** represents instantiating **[&CONTAINED_OBJECT]** with **[Shoe]**.

We manually replace **[&CONTAINED_OBJECT]** with **[Hat]** to give a visual representation of **[Container<[Hat]>]**.
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
Similarly, we manually replace **[&CONTAINED_OBJECT]** with **[Shoe]** to give a visual representation of **[Container<[Shoe]>]**.
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
Although **[Container<[Hat]>]** and **[Container<[Shoe]>]** are incompatible types, not all **Container** types are incompatible. In the following example, **[Container<[Hat]>]** **hatContainer** is assigned to a **[Container<[BowlerHat]>]** object. **BowlerHat** inherits from **Hat**.
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

[BowlerHat :[Hat]] (Hat) {
    ~ newBowlerHat *{
        \$~newHat;
    }
}

[Hat] {
    ~ newHat *{}
}
```
In the above example, **someBowlerHat** and **hatTakenFromContainer** represent the same object. In general, class types with a generic instantiation are compatible if the instantiated types are compatible. Applying this to **Container**, if **[G]** is a parent type of **[H]** then **[Container<[G]>]** is a parent type of **[Container<[H]>]**.

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
Any type can be used to instantiate a class generic type, including a type which itself has generic types. Embedded generics are demonstrated in the following example; using **Tuple**, an object **[Tuple<[Banana][Tuple<[Apple][Grape]>]>]** **bananaAndAppleAndGrape** is created which contains a **[Banana]** and a **[Tuple<[Apple][Grape]>]**.
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
In general, class types with a generic instantiation are compatible if the instantiated types are compatible, this also applies to types with multiple generic instantiations. Since **[Fruit]** is the parent type of **[Banana]**, **[Apple]** and **[Grape]**, the following are the parent types of **[Tuple<[Banana][Tuple<[Apple][Grape]>]>]**:

+ **[Tuple<[Fruit][Tuple<[Apple][Grape]>]>]**
+ **[Tuple<[Banana][Tuple<[Fruit][Grape]>]>]**
+ **[Tuple<[Banana][Tuple<[Apple][Fruit]>]>]**
+ **[Tuple<[Fruit][Tuple<[Fruit][Grape]>]>]**
+ **[Tuple<[Fruit][Tuple<[Apple][Fruit]>]>]**
+ **[Tuple<[Banana][Tuple<[Fruit][Fruit]>]>]**
+ **[Tuple<[Fruit][Tuple<[Fruit][Fruit]>]>]**

Following are some example assignments using parent types of the **bananaAndAppleAndGrape** object.
```
[] (Tuple, Banana, Apple, Grape, Fruit) {
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
For a type to be a parent, every generic instantiation must be a parent or equivalent. So for example, **[Tuple<[Fruit][Apple]>]** is not a parent or child type of **[Tuple<[Apple][Fruit]>]**, because **[Fruit]** is a parent of **[Apple]** but **[Apple]** is not a parent of **[Fruit]**. Following are some invalid assignments added alongside the previous examples.
```
[] (Tuple, Banana, Apple, Grape, Fruit) {
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
        [Tuple<[Fruit][Tuple<[Fruit][Grape]>]>] 2FruitsAndAGrape = 3Fruits;                  @ Invalid; a [Fruit] is not a [Grape]
        [Tuple<[Banana][Tuple<[Fruit][Fruit]>]>] 2FruitsAndABanana = 2FruitsAndAnApple;      @ Invalid; an [Apple] is a [Fruit], but a [Fruit] is not a [Banana]
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
+ All class generic types are instantiated when invoking a constructor, invoking a type method or declaring an object.
+ If one of the generic instantiations of a class type becomes a parent type, the new class type also becomes a parent type. For example, if **[C]** is a parent type of **[B]** then **[Tuple<[A][C]>]** is a parent type of **[Tuple<[A][B]>]**.


### Instance Method Visibility

The visibility of an instance method determines in which contexts it can be invoked. Some other languages with this concept have keywords such as 'public', 'private' and 'protected' to determine in which parts of the code can a given instance method be accessed. A Daina instance method has three aspects of visibility that can be set independantly:

+ Externally (can be either visible or invisible)
+ Type (can be either visible or invisible)
+ Inherited (can be either visible or invisible)

The instance method visibility is indicated with three **+** (meaning visible) or **-** (meaning hidden); for external visibility, type visibility and inherited visibility respectively. Following are eight examples instance methods showing all possible combinations of visibility.
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

When an instance method is marked with **---**, it is considered minimally visible and can only be accessed by other instance methods or constructors within the same object. An instance method can always be accessed by other instance methods or constructors within the same object. **---** is equivalent to 'private' in some other languages. The following example shows a minimally visible instance method called **cabbage**.
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
When overriding an instance method, the visibility can be the same or more visible then before, but not less visible. In the following example, **cabbage1** and **cabbage2** are correctly overriden, but **cabbage3** and **cabbage4** are invalid because they are overriden with missing visibilities from the original methods.
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
Most combinations of visibilities would not be used very often and dont usually need to be considered. The following are the most used:

+ **---** only allows access within the same instance, it is similar to the private modifer in some other languages.
+ **+++** allows access everywhere, it is similar to the public modifer in some other languages.
+ **--+** allows access within the same instance and child instances which inherit the method, it is similar to the protected modifer in some other languages.

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
A prologue statement can be a group of statements.
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
Assignments in prologue statements are only visible to the statement or group of statements which had **!** written after it. The following example is invalid becuase the assignment of **jay** is not visible to the statement **\jay:sleep;**.
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

Method generics allow the output type of a method to be based on the inputs. The following example method **identity** simply returns the input as output.
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
Methods can have multiple method generic types. In the following example, the return type of **chooseFirstOption** is determined by the first input, and the return type of **chooseSecondOption** is determined by the second input.
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
A method can use the same method generic type multiple times, but the uses of the same method generic type must all have a common parent. In the following example, the return type of **chooseFirstOption** is determined by the common type of both inputs.
```
[] (Hammer, Saw, Cat) {
    *{
        [['A]['A]->['A]] chooseFirstOption = *(['A] first, ['A] second)->['A] {} -> first;
        [Cat] cat = \[Cat]:newCat;
        [Saw] saw = \[Saw]:newSaw;
        [Hammer] hammer = \[Hammer]:newHammer;
        [Cat] theSameCat = \chooseFirstOption cat saw;          @ Invalid; [Saw] is not a [Cat], ['A] cant be determined
        [Tool] theSameSaw = \chooseFirstOption saw hammer;      @ Valid; [Tool] is a common type between [Saw] and [Hammer], ['A] is [Tool]
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
Method generic can be used for methods inside a class. The instance method **changeFirst** is added, which returns a new **[Tuple]** with just the first object changed.
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


## More Advanced Topics



---
***

