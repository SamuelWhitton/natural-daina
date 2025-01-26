/* *** HEADER *** */
interface OBJECT {}
class LITERAL_STRING : OBJECT { string it; this(string s) {this.it = s;} }
interface LAMBDA {
   OBJECT method(OBJECT caller, OBJECT[] parameters);
}

/* *** ENTRY POINT CLASS *** */
void main() { ENTRY_POINT_CLASS.entryPointMethod(null, []); }
class ENTRY_POINT_CLASS {
   static OBJECT entryPointMethod(OBJECT caller, OBJECT[] parameters) {
            (cast(CLASSTYPE_Integer)CLASSIMPL_Integer.TMETHOD_add(caller, [CLASSIMPL_Integer.TMETHOD_add(caller, [CLASSIMPL_Integer.TMETHOD_one(caller, []), CLASSIMPL_Integer.TMETHOD_one(caller, [])]), CLASSIMPL_Integer.TMETHOD_one(caller, [])])).IMETHOD_debugPrint(caller, []);
      return caller;
   }
}

/* *** CLASS: Integer *** */
interface CLASSTYPE_Integer : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT IMETHOD_debugPrint(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Integer : CLASSTYPE_Integer {
/* dlang injection start */
            import std.conv;
            import std.stdio;
            int value;
         /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private CLASSIMPL_Object PARENT_1 = new CLASSIMPL_Object();
   override OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_asdf(caller, parameters); }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Integer newInstance = new CLASSIMPL_Integer(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      OBJECT LOBJECT_literal = parameters[0];
/* dlang injection start */
            this.value = to!int((cast(LITERAL_STRING)LOBJECT_literal).it);
         /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_zero(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Integer newInstance = new CLASSIMPL_Integer(); return newInstance.CMETHOD_zero(newInstance, parameters); }
   OBJECT CMETHOD_zero(OBJECT caller, OBJECT[] parameters) {
this.CMETHOD_as(this, [new LITERAL_STRING("0")]);
      return caller;
   }
   static OBJECT TMETHOD_one(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Integer newInstance = new CLASSIMPL_Integer(); return newInstance.CMETHOD_one(newInstance, parameters); }
   OBJECT CMETHOD_one(OBJECT caller, OBJECT[] parameters) {
this.CMETHOD_as(this, [new LITERAL_STRING("1")]);
      return caller;
   }
   static OBJECT TMETHOD_add(OBJECT caller, OBJECT[] parameters) {
      OBJECT LOBJECT_i1 = parameters[0];
      OBJECT LOBJECT_i2 = parameters[1];
      OBJECT LOBJECT_result = CLASSIMPL_Integer.TMETHOD_zero(caller, []);
/* dlang injection start */
            (cast(CLASSIMPL_Integer)LOBJECT_result).value = (cast(CLASSIMPL_Integer)LOBJECT_i1).value + (cast(CLASSIMPL_Integer)LOBJECT_i2).value;
         /* dlang injection end */
      return LOBJECT_result;
   }
   override OBJECT IMETHOD_debugPrint(OBJECT caller, OBJECT[] parameters) {
/* dlang injection start */
            writeln(this.value);
         /* dlang injection end */
      return caller;
   }
}

/* *** CLASS: Object *** */
interface CLASSTYPE_Object : OBJECT, LAMBDA {
   OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Object : CLASSTYPE_Object {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   override OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
}

