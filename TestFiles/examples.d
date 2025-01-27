
import std.stdio, std.string, std.algorithm, std.conv;


void main()
{


    B b = new B();
    assert(b.foo() == 2);

    I i = new C();    // ok since B inherits A's I implementation
    assert(i.foo() == 3);


    OBJECT asdf1 = ((){
        OBJECT P;

        OBJECT adsfwerq = OBJECT.constr();

        return adsfwerq;


        })();
    OBJECT asdf = (cast(G)asdf1).PPP([OBJECT.constr()]);
    assert((cast(G)asdf).foo() == 3);

    int k = 5;
    I iw = new class OBJECT, I, G
        {
             int foo() { return k; }
             OBJECT PPP(OBJECT[] asdf) { return asdf[0]; }
        };
        writeln(iw.foo());
        k = 2;
         writeln(iw.foo());
    
}


interface I
{
    int foo();
}

interface M
{
}

interface G : M
{
    int foo();
    OBJECT PPP(OBJECT[] asdf);
}

class OBJECT
{
    private OBJECT p = null;
    static OBJECT constr() {
        new class I, G
        {
             int foo() { return 3; }
             OBJECT PPP(OBJECT[] asdf) { return asdf[0]; }
        };
        return new class OBJECT, I, G
        {
             int foo() { return 3; }
             OBJECT PPP(OBJECT[] asdf) { return asdf[0]; }
        };

    }
}

class B : I
{
    override int foo() { return 2; }
}

class C : OBJECT, I
{
    override int foo() { return 3; }
}




