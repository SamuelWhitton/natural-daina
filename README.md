# Daina

## Index

* [Tutorial](#Tutorial)
	+ [Comments](#comments)
	+ [Entry Point of a Program](#entry-point-of-a-program)
	+ [Classes, Types, Objects and Dependancies](#classes-types-objects-and-dependancies)
	+ [Inheritance](#inheritance)
	+ [Methods and Lambdas](#methods-and-lambdas)
	+ [Constructor Methods, Instance Methods and Type Methods](#constructor-methods-instance-methods-and-type-methods)
	+ [Generics](#generics)
	+ [Method Visibility](#method-visibility)
	+ [Prologue Statements](#prologue-statements)
	+ [Data Segments](#data-segments)

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
This is the minimal definition of a class called **ClassA**. **ClassA** is the identifier of the class. An identifier can contain one or more alpha numeric characters or underscores. An identifier cannot be just an underscore.
```
[ClassA] {}
```
Adding another class called **ClassB**.
```
[ClassA] {}

[ClassB] {}
```
A class can reference other classes if it includes a dependancy list. A class **ClassC** is added which references **ClassA** and **ClassB** with a dependancy list. The dependancy list is comma seperated and can only include the identifiers of classes.
```
[ClassA] {}

[ClassB] {}

[ClassC] (ClassA, ClassB) {}
```
There is no circular dependancies allowed. So the following is impossible
```
[ClassA] (ClassC) {}

[ClassB] (ClassA) {}

[ClassC] (ClassB) {}
```
There is also a reverse dependancy list which restricts which classes depend on the given class. In the following example **ClassA** can only be depended apon by **ClassB**
```
[ClassA] -> (ClassB) {}

[ClassB] (ClassA) {}
```
Adding **ClassC** which depends on **ClassA** is invalid here since **ClassA** can only be depended apon by **ClassB**
```
[ClassA] -> (ClassB) {}

[ClassB] (ClassA) {}

[ClassC] (ClassA) {} @ Inavlid
```
A reverse dependancy must be adhered to strictly, thus in this example the definition of **ClassB** is invalid since it doesn't depend on **ClassA**
```
[ClassA] -> (ClassB) {}

[ClassB] () {} @ Inavlid
```
Classes are a template used to create objects. Instance is another word used for object. Instance objects are objects tied to another object/instance (often called instance variable in other languages). The instance object **aObject** is added to **ClassC** in the following example
```
[ClassA] {}

[ClassB] {}

[ClassC] (ClassA, ClassB)
	[ClassA] aObject
{
}
```
**[ClassA]** is the type of **aObject**. Types are used to classify objects. A second instance object **bObject** is added with the type **[ClassB]**
```
[ClassA] {}

[ClassB] {}

[ClassC] (ClassA, ClassB)
	[ClassA] aObject
	[ClassB] bObject
{
}
```
To create objects from these classes, constructor methods must be defined for each class. In this example, **newA** and **newB** are the constructors for the classes **ClassA** and **ClassB** respectively
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
}
```
To define a constructor for **ClassC** is more complex since it has instance objects. The following example adds the constructor **newC**. But this constructor is incomplete since **aObject** and **bObject** must be assigned within the constructor
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
    	@ Invalid because aObject and bObject are not defined here
    }
}
```
All instance objects must be assigned within a constructor. In this example the **newC** constructor is defined correctly by assigning **aObject** and **bObject**
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
This statement assigns the instance object **aObject** to a new **[ClassA]** object. Looking at each part individually:

+ **.aObject** refers to the instance object **aObject** (a period is used to refer to an instance object defined within the class).
+ **[ClassA]:newA** refers to the constructor **newA** within the class **ClassA**.
+ **=** assigns the left hand side to the right hand side.
+ **\\** represents the invocation of a method and the result is the object returned by the method.
+ **;** is used to seperate statements

When a constructor method is invoked, it creates a new object, executes all statements in the constructor and returns the new object. Thus **\\[ClassA]:newAObject** is an invocation of the constructor **newAObject** within **ClassA**, and so it evaluates to a new object of the type **[ClassA]**.
Similarly the second statement assigns **bObject** to a new **[ClassB]** object:

```
.bObject = \[ClassB]:newB;
```
The entry point is treated like a class, so it uses the same syntax for dependancies. It is limited compared to a class and so cannot have constructors and instance objects. Here the entry point is added and it is depending on **ClassA** and **ClassB**
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
Since the dependancies **ClassA** and **ClassB** have been added to the entry point, we can now add some statements to the entry point method which refer to the classes **ClassA** and **ClassB**. The following example creates a new local object of the type **[ClassA]** called **foo**
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
**[ClassA] foo =** declares a new object called **foo** with the type **[ClassA]** and assigns it with the result of the expression given after the **=**. It is possible to assign to a new local object from a previous one. In the following example **bar** is assigned to the same object as **foo**
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
Statements can only refer to local objects in a statement after they are defined. The following example is invalid because **bar** is assigned to **foo** but it is defined in the next statement and not before
```
[] (ClassA, ClassB) {
	*{
    	[ClassA] bar = foo; @ Invalid, foo is not defined yet
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
The type of each object must be strictly adhered to. In this next example, the type of **bar** is changed to **[ClassB]**. But this is invalid becuase it is assigned to **foo** which is type **[ClassA]**
```
[] (ClassA, ClassB) {
	*{
		[ClassA] foo = \[ClassA]:newA;
        [ClassB] bar = foo; @ Invalid, foo and bar have different types
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
**foo** and **bar** are changed to be type **[ClassC]** and the constructor to **[ClassC]:newC**. All the types match, but this new example is invalid because **ClassC** is not a dependancy
```
[] (ClassA, ClassB) {
	*{
		[ClassC] foo = \[ClassC]:newC; @ Invalid since ClassC is unknown
        [ClassC] bar = foo; @ Invalid since ClassC is unknown
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
Finally **ClassC** is added as a dependancy, so now the example is valid
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
Classes can have instance methods. An instance method called **greatTask** is added to **ClassC**
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
    +++ greatTask *{}
}
```
Instance methods can contain statements which are executed when the instance method is invoked. Different to a constructor, an instance method is invoked on an object. The instance method **greatTask** can be invoked on any **[ClassC]** object since it is defined within **ClassC**. In the following example the **greatTask** instance method is invoked for the object **bar** in the entry point method
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
**bar:greatTask** refers to the instance method **greatTask** on the object **bar**. In the following example, the method **middlingTask** to added to **ClassA** and then invoked within **greatTask** on the instance object **aObject**
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
Now when the program runs, the instance method **greatTask** will be invoked on the local object **bar** and this will cause the instance method **middlingTask** to be invoked on instance object **aObject** within **bar**

In summary:

+ Classes can have instance methods, instance objects and constructors.
+ Classes and the entry point can only refer to other classes which they have as a dependancy.
+ Circular dependancies are not allowed.
+ Reverse dependancy lists allow dependancies to be restricted to a limited set of other classes.
+ A constructor must assign all instance objects.
+ Types must be adhered to strictly and so instance and local objects cannot be assigned with the wrong type.

### Inheritance

To showcase inheritance we start with these classes **Bird** and **Dog**
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

There is a rule that a class must evaluate a constructor method of the inherited parent within its constructor. In other words, the constructor methods **createDog** and **createBird** must invoke a constructor from **[Animal]**. In the following example we complete **createBird** and **createDog** with a new constructor **createAnimal**
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

A method is a basic building block of code which can have zero or more input objects, a method body with zero or more executable statements, and optionally an output object. Constructor methods and instance methods are both types of methods. There are a number of ways to express a method, here are a few examples:

1. A method with no inputs or outputs
       *{
       	@ method body
       }
The method body is always between the **{** **}** brackets.

2. A method with a single input of type **[A]** called **aInput**
       *([A]aInput){}

3. A method with a **[A]** and **[B]** input, which returns the **[B]** input
       *([A]aInput,[B]bInput)->[B]{
       } -> bInput
The **->[B]** denotes that the return object is of type **[B]**. The **-> bInput** denotes that the object called **bInput** is returned by the method.

4. A method taking no arguments, and returns a object called **aOutput** of type **[A]** which is defined by a statement inside the method body
       *->[A]{
       	[A] aOutput = \[A]:newA;
       } -> aOutput

5. A method returning a **[A]** object defined as the result of an expression after the return **->**
       *->[A]{} -> \[A]:newA

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

Constructor methods are unique because they cannot explicitly return a value like other methods. A constructors job is to construct and return a new object of the type matching the class they are within. However, a constructor method can have input objects. In the following example, a constructor called **newQContainer** is defined for **[QContainer]** which takes a parameter of type **[Q]** and assigns it as an instance object
```
[QContainer] (Q)
	[Q] q
{
	~ newQContainer *([Q] qInput) {
		.q = qInput;
	}
}

[Q] {
	~ newQ *{}
}
```
**newQContainer** is invoked similar to other methods with the inputs written after **[QContainer]:newContainer**. A **[QContainer]** object is created called **containerOfQObject**
```
[] (Q, QContainer) {
	*{
		[Q] someQObject = \[Q]:newQ;
		[QContainer] containerOfQObject = \[QContainer]:newContainer someQObject;
	}
}

[QContainer] (Q)
	[Q] q
{
	~ newQContainer *([Q] qInput) {
		.q = qInput;
	}
}

[Q] {
	~ newQ *{}
}
```
Instance methods can have inputs and optionally return an object. Instance methods are invoked on an object and can access the instance objects and methods within the object it is invoked on. We add an instance method **getQ** which returns the **q** object from **[QContainer]**, and then we retrive it as **qObjectTakenFromContainer**
```
[] (Q, QContainer) {
	*{
		[Q] someQObject = \[Q]:newQ;
		[QContainer] containerOfQObject = \[QContainer]:newContainer someQObject;
		[Q] qObjectTakenFromContainer = \containerOfQObject:getQ;
    }
}

[QContainer] (Q)
	[Q] q
{
	~ newQContainer *([Q] qInput) {
		.q = qInput;
	}
    +++ getQ *->[Q]{}->.q
}

[Q] {
	~ newQ *{}
}
```
Type methods (similar to static or class methods in other object oriented languages) can take inputs and optionally return an object. A type method is not attached to an instance, and is invoked similarly to a constructor method. A type method **createQContainer** is added which creates a **[QContainer]**, similar to the constructor **newQContainer**, and then we invoke this method to create **container2OfQObject**
```
[] (Q, QContainer) {
	*{
		[Q] someQObject = \[Q]:newQ;
		[QContainer] containerOfQObject = \[QContainer]:newContainer someQObject;
		[Q] qObjectTakenFromContainer = \containerOfQObject:getQ;
        [QContainer] container2OfQObject = \[QContainer]:createQContainer someQObject;
    }
}

[QContainer] (Q)
	[Q] q
{
	:: createQContainer *([Q] qObject) -> [QContainer] {
		[QContainer] newQContainer = \[QContainer]:newQContainer qObject;
	} -> newQContainer

	~ newQContainer *([Q] qInput) {
		.q = qInput;
	}
    +++ getQ *->[Q]{}->.q
}

[Q] {
	~ newQ *{}
}
```
In the following example, we add type method **getQFromQContainer** which gets the **q** from a **[QContainer]**, then we invoke this method and name the result **qObjectTakenFromContainer2**
```
[] (Q, QContainer) {
	*{
		[Q] someQObject = \[Q]:newQ;
		[QContainer] containerOfQObject = \[QContainer]:newContainer someQObject;
		[Q] qObjectTakenFromContainer = \containerOfQObject:getQ;
        [QContainer] container2OfQObject = \[QContainer]:createQContainer someQObject;
        [Q] qObjectTakenFromContainer2 = \[QContainer]:getQFromQContainer container2OfQObject;
    }
}

[QContainer] (Q)
	[Q] q
{
	:: createQContainer *([Q] qObject) -> [QContainer] {
		[QContainer] newQContainer = \[QContainer]:newQContainer qObject;
	} -> newQContainer

    :: getQFromQContainer *([QContainer] qContainer) -> [Q] {
		[Q] qObjectFromQContainer = \qContainer:getQ;
	} -> qObjectFromQContainer

	~ newQContainer *([Q] qInput) {
		.q = qInput;
	}
    +++ getQ *->[Q]{}->.q
}

[Q] {
	~ newQ *{}
}
```
**someQObject**, **qObjectTakenFromContainer** and **qObjectTakenFromContainer2** are all refering to the same object.

In summary:

+ Instance methods and type methods have zero or more inputs objects and an optional output object. Constructor methods can have zero or more inputs and always return a new object of the enclosing class.
+ An instance method is invoked on a object. Type methods and constructor methods are not invoked on an object.
+ An instance method can access the instance objects and methods within the object it is invoked on.
+ Instance methods, type methods and constructor methods are invoked by writing **\\**, then the method, and then each of the input objects. The result of a method invocation is the output object.
