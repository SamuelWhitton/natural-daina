/* *** HEADER *** */
interface OBJECT {}
class WRAP(E) : OBJECT { E it; this(E v) {this.it = v;} }
interface LAMBDA {
   OBJECT method(OBJECT caller, OBJECT[] parameters);
}

/* *** ENTRY POINT CLASS *** */
void main() { ENTRY_POINT_CLASS.entryPointMethod(null, []); }
class ENTRY_POINT_CLASS {
   static OBJECT entryPointMethod(OBJECT caller, OBJECT[] parameters) {
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_nothingStr = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("<NOTHING>")]);
         return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_y1 = CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
            OBJECT LOBJECT_y2 = CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Hello Worl!")])]);
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
   static OBJECT TMETHOD_stdout(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_SystemIO self = cast(CLASSTYPE_SystemIO)caller;
      OBJECT LOBJECT_data = parameters[0];
      return caller;
   }
   static OBJECT TMETHOD_stdin(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_SystemIO self = cast(CLASSTYPE_SystemIO)caller;
      OBJECT LOBJECT_bytesToRead = parameters[0];
      return CLASSIMPL_Data.TMETHOD_copy(caller, cast(OBJECT[])[CLASSIMPL_Sequence.TMETHOD_empty(caller, cast(OBJECT[])[])]);
   }
   static OBJECT TMETHOD_log(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_SystemIO self = cast(CLASSTYPE_SystemIO)caller;
      OBJECT LOBJECT_s = parameters[0];
/* dlang injection start */
            writeln((cast(WRAP!(string))((cast(CLASSTYPE_String)LOBJECT_s).IMETHOD_internalString(null, []))).it);
         /* dlang injection end */
      return caller;
   }
}

/* *** CLASS: Data *** */
interface CLASSTYPE_Data : OBJECT, LAMBDA, CLASSTYPE_Sequence {
   OBJECT IMETHOD_iterate(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Data : CLASSTYPE_Data {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   CLASSIMPL_Sequence PARENT_1 = new CLASSIMPL_Sequence();
   override OBJECT IMETHOD_appending(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_appending(caller, parameters); }
   static OBJECT TMETHOD_copy(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Data newInstance = new CLASSIMPL_Data(); return newInstance.CMETHOD_copy(newInstance, parameters); }
   OBJECT CMETHOD_copy(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Data self = cast(CLASSTYPE_Data)caller;
      OBJECT LOBJECT_bytes = parameters[0];
      return caller;
   }
   override OBJECT IMETHOD_iterate(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Data self = cast(CLASSTYPE_Data)caller;
      OBJECT LOBJECT_getNext = parameters[0];
      return caller;
   }
}

/* *** CLASS: Byte *** */
interface CLASSTYPE_Byte : OBJECT, LAMBDA {
}
class CLASSIMPL_Byte : CLASSTYPE_Byte {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
}

/* *** CLASS: Sequence *** */
interface CLASSTYPE_Sequence : OBJECT, LAMBDA {
   OBJECT IMETHOD_iterate(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_appending(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Sequence : CLASSTYPE_Sequence {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private LAMBDA ASSIGNIMETHOD_iterate = null;
   override OBJECT IMETHOD_iterate(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
      return ASSIGNIMETHOD_iterate.method(caller, parameters);
   }
   override OBJECT IMETHOD_appending(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
      OBJECT LOBJECT_other = parameters[0];
      OBJECT LOBJECT_this = caller;
      return ((){
         CLASSIMPL_Sequence PARENT_1 = new CLASSIMPL_Sequence();
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_Sequence {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_appending(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_appending(caller, parameters); }
            override OBJECT IMETHOD_iterate(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               OBJECT LOBJECT_getNext = parameters[0];
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_this;
                  return (cast(CLASSTYPE_Sequence)instance).IMETHOD_iterate(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_getNext]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_other;
                  return (cast(CLASSTYPE_Sequence)instance).IMETHOD_iterate(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_getNext]);
               return caller;
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
         return anonymousClassObject;
      })();
   }
   static OBJECT TMETHOD_empty(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
      return ((){
         CLASSIMPL_Sequence PARENT_1 = new CLASSIMPL_Sequence();
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_Sequence {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_appending(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_appending(caller, parameters); }
            override OBJECT IMETHOD_iterate(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               OBJECT LOBJECT__ = parameters[0];
               return caller;
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
         return anonymousClassObject;
      })();
   }
   static OBJECT TMETHOD_single(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
      OBJECT LOBJECT_e = parameters[0];
      return ((){
         CLASSIMPL_Sequence PARENT_1 = new CLASSIMPL_Sequence();
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_Sequence {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_appending(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_appending(caller, parameters); }
            override OBJECT IMETHOD_iterate(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               OBJECT LOBJECT_getNext = parameters[0];
               (cast(LAMBDA)LOBJECT_getNext).method(caller, cast(OBJECT[])[LOBJECT_e]);
               return caller;
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
         return anonymousClassObject;
      })();
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
   OBJECT IMETHOD_internalString(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_String : CLASSTYPE_String {
/* dlang injection start */
            WRAP!(string) value;
         /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_String newInstance = new CLASSIMPL_String(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
      OBJECT LOBJECT_literal = parameters[0];
/* dlang injection start */
            this.value = cast(WRAP!(string))LOBJECT_literal;
         /* dlang injection end */
      return caller;
   }
   override OBJECT IMETHOD_internalString(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
/* dlang injection start */
            return this.value;
         /* dlang injection end */
      return caller;
   }
}

