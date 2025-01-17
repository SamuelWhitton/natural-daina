void main()
{
    import std.stdio, std.string, std.algorithm, std.conv;

    // arr is real[] and sym is the current symbol
    readln.split.fold!((arr, sym)
    {
        static foreach (c; "+-*/")
            if (sym == [c])
                // replace the last 2 elements with the binary op
                return arr[0 .. $-2] ~
                    mixin("arr[$-2] " ~ c ~ " arr[$-1]");

        // sym must be a number
        return arr ~ sym.to!real;
    })((real[]).init).writeln;
}