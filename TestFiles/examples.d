
import std.stdio, std.string, std.algorithm, std.conv;

void main()
{


    B b = new B();
    assert(b.foo() == 2);

    I i = new C();    // ok since B inherits A's I implementation
    assert(i.foo() == 3);
}


interface I
{
    int foo();
}

interface G
{
    int foo();
}

class OBJECT
{
}

class B : OBJECT, I
{
    override int foo() { return 2; }
}

class C : OBJECT, I, G
{
    override int foo() { return 3; }
}

