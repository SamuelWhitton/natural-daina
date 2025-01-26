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
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = CLASSIMPL_DebugLogHelloWorld.TMETHOD_new(caller, []);
         return (cast(CLASSTYPE_DebugLogHelloWorld)instance).IMETHOD_log(instance, parameters);
      } })).method(caller, []);
      return caller;
   }
}

/* *** CLASS: DebugLogHelloWorld *** */
interface CLASSTYPE_DebugLogHelloWorld : OBJECT, LAMBDA, CLASSTYPE_DebugLog {
   OBJECT CMETHOD_new(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_toString(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DebugLogHelloWorld : CLASSTYPE_DebugLogHelloWorld {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private CLASSIMPL_DebugLog PARENT_1 = new CLASSIMPL_DebugLog();
   override OBJECT IMETHOD_log(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_log(caller, parameters); }
   static OBJECT TMETHOD_new(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DebugLogHelloWorld newInstance = new CLASSIMPL_DebugLogHelloWorld(); return newInstance.CMETHOD_new(newInstance, parameters); }
   OBJECT CMETHOD_new(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DebugLogHelloWorld self = cast(CLASSTYPE_DebugLogHelloWorld)caller;
      return caller;
   }
   override OBJECT IMETHOD_toString(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DebugLogHelloWorld self = cast(CLASSTYPE_DebugLogHelloWorld)caller;
      return CLASSIMPL_String.TMETHOD_as(caller, [new LITERAL_STRING("Hello World!")]);
   }
}

/* *** CLASS: DebugLog *** */
interface CLASSTYPE_DebugLog : OBJECT, LAMBDA {
   OBJECT IMETHOD_toString(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_log(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DebugLog : CLASSTYPE_DebugLog {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private LAMBDA ASSIGNIMETHOD_toString = null;
   override OBJECT IMETHOD_toString(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DebugLog self = cast(CLASSTYPE_DebugLog)caller;
      return ASSIGNIMETHOD_toString.method(caller, parameters);
   }
   override OBJECT IMETHOD_log(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DebugLog self = cast(CLASSTYPE_DebugLog)caller;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = self.IMETHOD_toString(caller, []);
         return (cast(CLASSTYPE_String)instance).IMETHOD_debugPrint(instance, parameters);
      } })).method(caller, []);
      return caller;
   }
}

/* *** CLASS: String *** */
interface CLASSTYPE_String : OBJECT, LAMBDA {
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_debugPrint(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_String : CLASSTYPE_String {
/* dlang injection start */
            import std.conv;
            import std.stdio;
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
   override OBJECT IMETHOD_debugPrint(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
/* dlang injection start */
            writeln(this.value);
         /* dlang injection end */
      return caller;
   }
}

