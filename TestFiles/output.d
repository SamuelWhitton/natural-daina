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
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_nothingStr = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new LITERAL_STRING("<NOTHING>")]);
         return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_y1 = CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
            OBJECT LOBJECT_y2 = CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new LITERAL_STRING("Hello Worl!")])]);
            CLASSIMPL_SystemIO.TMETHOD_log(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_y1;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_s = parameters[0];
               return LOBJECT_s;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return LOBJECT_nothingStr;
            } })])]);
            CLASSIMPL_SystemIO.TMETHOD_log(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_y2;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_s = parameters[0];
               return LOBJECT_s;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return LOBJECT_nothingStr;
            } })])]);
            return caller;
         } });
      } }).method(caller, [])).method(caller, []);
   }
}

/* *** CLASS: SystemIO *** */
interface CLASSTYPE_SystemIO : OBJECT, LAMBDA {
}
class CLASSIMPL_SystemIO : CLASSTYPE_SystemIO {
/* dlang injection start */
            import std.stdio;
         /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_log(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_SystemIO self = cast(CLASSTYPE_SystemIO)caller;
      OBJECT LOBJECT_s = parameters[0];
/* dlang injection start */
            writeln((cast(CLASSIMPL_String)LOBJECT_s).value);
         /* dlang injection end */
      return caller;
   }
}

/* *** CLASS: Maybe *** */
interface CLASSTYPE_Maybe : OBJECT, LAMBDA {
   OBJECT IMETHOD_isOrElse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Maybe : CLASSTYPE_Maybe {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_nothing(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Maybe newInstance = new CLASSIMPL_Maybe(); return newInstance.CMETHOD_nothing(newInstance, parameters); }
   OBJECT CMETHOD_nothing(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Maybe self = cast(CLASSTYPE_Maybe)caller;
      ASSIGNIMETHOD_isOrElse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_is = parameters[0];
         OBJECT LOBJECT_else = parameters[1];
         return (cast(LAMBDA)LOBJECT_else).method(caller, cast(OBJECT[])[]);
      } });
      return caller;
   }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Maybe newInstance = new CLASSIMPL_Maybe(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Maybe self = cast(CLASSTYPE_Maybe)caller;
      OBJECT LOBJECT_it = parameters[0];
      ASSIGNIMETHOD_isOrElse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_is = parameters[0];
         OBJECT LOBJECT_else = parameters[1];
         return (cast(LAMBDA)LOBJECT_is).method(caller, cast(OBJECT[])[LOBJECT_it]);
      } });
      return caller;
   }
   private LAMBDA ASSIGNIMETHOD_isOrElse = null;
   override OBJECT IMETHOD_isOrElse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Maybe self = cast(CLASSTYPE_Maybe)caller;
      return ASSIGNIMETHOD_isOrElse.method(caller, parameters);
   }
}

/* *** CLASS: String *** */
interface CLASSTYPE_String : OBJECT, LAMBDA {
}
class CLASSIMPL_String : CLASSTYPE_String {
/* dlang injection start */
            string value;
         /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_String newInstance = new CLASSIMPL_String(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
      OBJECT LOBJECT_literal = parameters[0];
/* dlang injection start */
            this.value = (cast(LITERAL_STRING)LOBJECT_literal).it;
         /* dlang injection end */
      return caller;
   }
}

