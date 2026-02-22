/* *** HEADER *** */
interface OBJECT {}
class WRAP(E) : OBJECT { E it; this(E v) {this.it = v;} }
interface LAMBDA {
   OBJECT method(OBJECT caller, OBJECT[] parameters);
}

/* *** CLASS: Debug *** */
interface CLASSTYPE_Debug : OBJECT, LAMBDA {
}
class CLASSIMPL_Debug : CLASSTYPE_Debug {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_log(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Debug self = cast(CLASSTYPE_Debug)caller;
      OBJECT LOBJECT_s = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_out = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_StandardIO.TMETHOD_stdout(caller, parameters);
      } });
      (cast(LAMBDA)LOBJECT_out).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_s;
         return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      return caller;
   }
}

/* *** ENTRY POINT CLASS *** */
void main() { ENTRY_POINT_CLASS.entryPointMethod(null, []); }
class ENTRY_POINT_CLASS {
   static OBJECT entryPointMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSIMPL_Daina.TMETHOD_run(caller, cast(OBJECT[])[CLASSIMPL_Configuration.TMETHOD_init(caller, cast(OBJECT[])[])]);
      return caller;
   }
}

/* *** CLASS: SourcePosition *** */
interface CLASSTYPE_SourcePosition : OBJECT, LAMBDA {
   OBJECT IMETHOD_description(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_nextColumn(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_startOfNextLine(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_SourcePosition : CLASSTYPE_SourcePosition {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_sourceName = null;
   private OBJECT IOBJECT_line = null;
   private OBJECT IOBJECT_column = null;
   private OBJECT IOBJECT_lineContent = null;
   static OBJECT TMETHOD_initialPositionIn(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_SourcePosition newInstance = new CLASSIMPL_SourcePosition(); return newInstance.CMETHOD_initialPositionIn(newInstance, parameters); }
   OBJECT CMETHOD_initialPositionIn(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_SourcePosition self = cast(CLASSTYPE_SourcePosition)caller;
      OBJECT LOBJECT_sourceName = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_lineContent = parameters.length > 1 ? parameters[1] : null;
      (cast(CLASSIMPL_SourcePosition)self).CMETHOD_lineAndColumnIn(this, [CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]), CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]), LOBJECT_sourceName, LOBJECT_lineContent]);
      return caller;
   }
   static OBJECT TMETHOD_lineAndColumnIn(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_SourcePosition newInstance = new CLASSIMPL_SourcePosition(); return newInstance.CMETHOD_lineAndColumnIn(newInstance, parameters); }
   OBJECT CMETHOD_lineAndColumnIn(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_SourcePosition self = cast(CLASSTYPE_SourcePosition)caller;
      OBJECT LOBJECT_line = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_column = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_sourceName = parameters.length > 2 ? parameters[2] : null;
      OBJECT LOBJECT_lineContent = parameters.length > 3 ? parameters[3] : null;
      IOBJECT_sourceName = LOBJECT_sourceName;
      IOBJECT_column = LOBJECT_column;
      IOBJECT_line = LOBJECT_line;
      IOBJECT_lineContent = LOBJECT_lineContent;
      return caller;
   }
   override OBJECT IMETHOD_description(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_SourcePosition self = cast(CLASSTYPE_SourcePosition)caller;
      OBJECT LOBJECT_colon = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(":")]);
      OBJECT LOBJECT_pos = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" pos ")]);
      OBJECT LOBJECT_line = CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_line;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
      OBJECT LOBJECT_column = CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_column;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
      OBJECT LOBJECT_tabulation = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("\n    ")]);
      OBJECT LOBJECT_linePositionArrow = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")])]);
      CLASSIMPL_Loops.TMETHOD_iterate(caller, cast(OBJECT[])[((){
         CLASSTYPE_Sequence PARENT_1 = new CLASSIMPL_Sequence();
         void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_Sequence)parent; }
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_Sequence {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               return IOBJECT_column;
            }
            override OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               OBJECT LOBJECT_i = parameters.length > 0 ? parameters[0] : null;
               return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_i]);
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
         return anonymousClassObject;
      })(), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_curr = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_linePositionArrow;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_linePositionArrow;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_curr;
            return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" ")])])]);
         return caller;
      } })]);
      OBJECT LOBJECT_curr = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_linePositionArrow;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_linePositionArrow;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_curr;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("^")])])]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_sourceName;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_colon;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_line;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_pos;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_column;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_tabulation;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_lineContent;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_tabulation;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_linePositionArrow;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])])])])])])])])]);
   }
   override OBJECT IMETHOD_nextColumn(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_SourcePosition self = cast(CLASSTYPE_SourcePosition)caller;
      return CLASSIMPL_SourcePosition.TMETHOD_lineAndColumnIn(caller, cast(OBJECT[])[IOBJECT_line, (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_column;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]), IOBJECT_sourceName, IOBJECT_lineContent]);
   }
   override OBJECT IMETHOD_startOfNextLine(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_SourcePosition self = cast(CLASSTYPE_SourcePosition)caller;
      OBJECT LOBJECT_lineContent = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_SourcePosition.TMETHOD_lineAndColumnIn(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_line;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]), CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]), IOBJECT_sourceName, LOBJECT_lineContent]);
   }
}

/* *** CLASS: Error *** */
interface CLASSTYPE_Error : OBJECT, LAMBDA {
   OBJECT IMETHOD_description(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Error : CLASSTYPE_Error {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_errorString = null;
   override OBJECT IMETHOD_description(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_errorPrefix = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("ERROR; ")]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_errorPrefix;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[IOBJECT_errorString]);
   }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Error newInstance = new CLASSIMPL_Error(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_errorString = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_errorString = LOBJECT_errorString;
      return caller;
   }
   static OBJECT TMETHOD_errorWithContext(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Error newInstance = new CLASSIMPL_Error(); return newInstance.CMETHOD_errorWithContext(newInstance, parameters); }
   OBJECT CMETHOD_errorWithContext(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_errorString = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_errorWithContext = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_errorString]);
      CLASSIMPL_Loops.TMETHOD_iterate(caller, cast(OBJECT[])[LOBJECT_context, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT__ = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_sourcePosition = parameters.length > 1 ? parameters[1] : null;
         OBJECT LOBJECT_addedContext = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_prefix = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" - ")]);
            return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_prefix;
               return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_sourcePosition;
               return (cast(CLASSTYPE_SourcePosition)instance).IMETHOD_description(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
         } }).method(caller, []);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_errorWithContext;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_prefix = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_errorWithContext;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_prefix;
               return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_addedContext]);
         } }).method(caller, [])]);
         return caller;
      } })]);
      IOBJECT_errorString = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_errorWithContext;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return caller;
   }
   static OBJECT TMETHOD_sourceFileNotAccessible(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_fileName = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_prefix = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Source file not accessible: ")]);
      return CLASSIMPL_Error.TMETHOD_as(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_prefix;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_fileName])]);
   }
   static OBJECT TMETHOD_unrecognisedToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_position = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_prefix = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Unrecognised token: ")]);
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_prefix;
         return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_token]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_invalidVisibilityIndicator(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_error = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Invalid visibility indicator")]);
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[LOBJECT_error, LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingSecondHashForDataSegmentAnchor(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting second hash for data segment anchor")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingSecondDataSegmentAnchor(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting second data segment anchor")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClassAtTopLevel(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting class at top level")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingBodyOfClass(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting body of class")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingEntryPointMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting entry point method")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForClassBody(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for class body")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClassName(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting class name")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingParentType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting parent type")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingSquareBracketAfterClassHeader(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing square bracket after class header")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingGenericIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting generic identifier")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForGenericDeclarationList(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for generic declaration list")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingDependancy(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting dependancy")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingReverseDependancy(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting reverse dependancy")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForDependancyList(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for dependancy list")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingReverseDependancyList(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting reverse dependancy list")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting type")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingOneOrMoreTypesForClassGenericInstantiation(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting one or more types for class generic instantiation")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForClassGenericInstantiations(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for class generic instantiations")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for type")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForDependancyWithDerivatives(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for dependancy with derivatives")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingIdentifierForObjectDeclaration(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting identifier for object declaration")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingVisibilityIndicatorForInstanceMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting visibility indicator for instance method")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingIdentifierForClassMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting identifier for class method")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClassMethodExpression(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting class method expression")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingIdentifierForCompilerInjection(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting identifier for compiler injection")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingDataSegmentForCompilerInjection(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting data segment for compiler injection")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingPrologueStatement(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting prologue statement")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingMethodInput(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting method input")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForMethodInputs(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for method inputs")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingMethodBody(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting method body")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingMethodOutput(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting method output")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForStatementGroup(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for statement group")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingParentTypeForAnonymousClassObject(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting parent type for anonymous class object")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingSquareBracketAfterAnonymousClassHeader(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing square bracket after anonymous class header")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingAnonymousClassBody(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting anonymous class body")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForAnonymousClassBody(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for anonymous class body")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_unexpectedTokenAfterType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Unexpected token after type")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingInstanceMethodIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting instance method identifier")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingExpressionToBeCast(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting expression to be cast")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForCastExpression(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for cast expression")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingIdentifierForTypeMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting identifier for type method")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingEqualsToAssignLocalDeclaration(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting equals to assign local declaration")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingExpressionToAssignLocalDeclaration(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting expression to assign local declaration")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingExpressionToAssignInstanceMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting expression to assign instance method")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingExpressionToAssignInstanceObject(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting expression to assign instance object")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingInstanceObjectIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting instance object identifier")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_unexpectedTokenBeforeTilde(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Unexpected token before tilde")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingMethodToInvoke(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting method to invoke")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingProxyObject(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting proxy object")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingCompilerInjectionIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting compiler injection identifier")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingCompilerInjectionDataSegment(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting compiler injection data segment")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingExpression(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting expression")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingClosingBracketForExpression(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting closing bracket for expression")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingConstructorIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting constructor identifier")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingTypeOrArrowForMethodType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting type or arrow for method type")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingIdentifierForClassGenericType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting identifier for class generic type")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingIdentifierForMethodGenericType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting identifier for method generic type")]), LOBJECT_context]);
   }
   static OBJECT TMETHOD_expectingIdentifierForDataSegmentType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Error self = cast(CLASSTYPE_Error)caller;
      OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_context = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_context;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
      return CLASSIMPL_Error.TMETHOD_errorWithContext(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Expecting identifier for data segment type")]), LOBJECT_context]);
   }
}

/* *** CLASS: CommandReader *** */
interface CLASSTYPE_CommandReader : OBJECT, LAMBDA {
   OBJECT IMETHOD_exit(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parseSourceFile(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_compileToFile(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_invalidCommand(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_CommandReader : CLASSTYPE_CommandReader {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private LAMBDA ASSIGNIMETHOD_exit = null;
   override OBJECT IMETHOD_exit(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_CommandReader self = cast(CLASSTYPE_CommandReader)caller;
      return ASSIGNIMETHOD_exit.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_parseSourceFile = null;
   override OBJECT IMETHOD_parseSourceFile(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_CommandReader self = cast(CLASSTYPE_CommandReader)caller;
      return ASSIGNIMETHOD_parseSourceFile.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_compileToFile = null;
   override OBJECT IMETHOD_compileToFile(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_CommandReader self = cast(CLASSTYPE_CommandReader)caller;
      return ASSIGNIMETHOD_compileToFile.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_invalidCommand = null;
   override OBJECT IMETHOD_invalidCommand(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_CommandReader self = cast(CLASSTYPE_CommandReader)caller;
      return ASSIGNIMETHOD_invalidCommand.method(caller, parameters);
   }
}

/* *** CLASS: Character *** */
interface CLASSTYPE_Character : OBJECT, LAMBDA {
   OBJECT IMETHOD_asASCII(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_description(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isNULL(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isSemicolon(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isPlus(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isUnderscore(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isBackslash(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isForwardslash(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isFullstop(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isColon(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isTilde(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isHash(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isDollarSign(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isBacktick(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isAmpersand(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isSingleApostrophe(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isDash(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isArrowBracketOpen(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isArrowBracketClose(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isAsterisk(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isCaret(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isComma(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isCurlyBracketOpen(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isCurlyBracketClose(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isDoubleApostrophe(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isPipe(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isStrudel(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isEqualsSign(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isExclamationMark(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isPercentSign(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isQuestionMark(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isRoundBracketOpen(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isRoundBracketClose(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isSquareBracketOpen(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isSquareBracketClose(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isTab(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isNewline(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isAlphanumeric(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isWhitespace(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Character : CLASSTYPE_Character {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_asciiByte = null;
   static OBJECT TMETHOD_fromASCII(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Character newInstance = new CLASSIMPL_Character(); return newInstance.CMETHOD_fromASCII(newInstance, parameters); }
   OBJECT CMETHOD_fromASCII(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      OBJECT LOBJECT_asciiByte = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_asciiByte = LOBJECT_asciiByte;
      return caller;
   }
   static OBJECT TMETHOD_space(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Character newInstance = new CLASSIMPL_Character(); return newInstance.CMETHOD_space(newInstance, parameters); }
   OBJECT CMETHOD_space(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      IOBJECT_asciiByte = CLASSIMPL_Byte.TMETHOD_0x20(caller, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_asASCII(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return IOBJECT_asciiByte;
   }
   override OBJECT IMETHOD_description(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return CLASSIMPL_String.TMETHOD_asASCII(caller, cast(OBJECT[])[CLASSIMPL_Data.TMETHOD_copy(caller, cast(OBJECT[])[((){
         CLASSTYPE_Sequence PARENT_1 = new CLASSIMPL_Sequence();
         void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_Sequence)parent; }
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_Sequence {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               return CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")]);
            }
            override OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[IOBJECT_asciiByte]);
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
         return anonymousClassObject;
      })()])]);
   }
   override OBJECT IMETHOD_isNULL(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x00(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isSemicolon(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x3B(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isPlus(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x2B(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isUnderscore(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x5F(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isBackslash(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x5C(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isForwardslash(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x2F(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isFullstop(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x2E(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isColon(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x3A(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isTilde(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x7E(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isHash(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x23(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isDollarSign(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x24(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isBacktick(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x60(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isAmpersand(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x26(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isSingleApostrophe(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x27(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isDash(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x2D(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isArrowBracketOpen(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x3C(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isArrowBracketClose(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x3E(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isAsterisk(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x2A(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isCaret(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x5E(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isComma(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x2C(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isCurlyBracketOpen(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x7B(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isCurlyBracketClose(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x7D(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isDoubleApostrophe(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x22(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isPipe(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x7C(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isStrudel(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x40(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isEqualsSign(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x3D(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isExclamationMark(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x21(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isPercentSign(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x25(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isQuestionMark(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x3F(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isRoundBracketOpen(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x28(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isRoundBracketClose(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x29(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isSquareBracketOpen(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x5B(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isSquareBracketClose(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x5D(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isTab(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x09(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isNewline(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x0A(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_isAlphanumeric(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      return CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_inclusiveBetween(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x30(caller, cast(OBJECT[])[]), CLASSIMPL_Byte.TMETHOD_0x39(caller, cast(OBJECT[])[])]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_inclusiveBetween(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x41(caller, cast(OBJECT[])[]), CLASSIMPL_Byte.TMETHOD_0x5A(caller, cast(OBJECT[])[])])]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_inclusiveBetween(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x61(caller, cast(OBJECT[])[]), CLASSIMPL_Byte.TMETHOD_0x7A(caller, cast(OBJECT[])[])])]);
   }
   override OBJECT IMETHOD_isWhitespace(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Character self = cast(CLASSTYPE_Character)caller;
      OBJECT LOBJECT_b = CLASSIMPL_Byte.TMETHOD_0x09(caller, cast(OBJECT[])[]);
      OBJECT LOBJECT_thing = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_inclusiveBetween(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_b, CLASSIMPL_Byte.TMETHOD_0x0D(caller, cast(OBJECT[])[])]);
      return CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[LOBJECT_thing, (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_asciiByte;
         return (cast(CLASSTYPE_Byte)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Byte.TMETHOD_0x20(caller, cast(OBJECT[])[])])]);
   }
}

/* *** CLASS: Configuration *** */
interface CLASSTYPE_Configuration : OBJECT, LAMBDA {
   OBJECT IMETHOD_outputError(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_commandInput(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_compilationFileOutput(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_sourceFileInput(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Configuration : CLASSTYPE_Configuration {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_init(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Configuration newInstance = new CLASSIMPL_Configuration(); return newInstance.CMETHOD_init(newInstance, parameters); }
   OBJECT CMETHOD_init(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Configuration self = cast(CLASSTYPE_Configuration)caller;
      return caller;
   }
   override OBJECT IMETHOD_outputError(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Configuration self = cast(CLASSTYPE_Configuration)caller;
      OBJECT LOBJECT_error = parameters.length > 0 ? parameters[0] : null;
      CLASSIMPL_StandardIO.TMETHOD_stdout(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_error;
            return (cast(CLASSTYPE_Error)instance).IMETHOD_description(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      CLASSIMPL_StandardIO.TMETHOD_stdout(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("\n")]);
         return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      return caller;
   }
   override OBJECT IMETHOD_commandInput(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Configuration self = cast(CLASSTYPE_Configuration)caller;
      OBJECT LOBJECT_input = CLASSIMPL_StandardIO.TMETHOD_stdin(caller, cast(OBJECT[])[]);
      OBJECT LOBJECT_emptyInput = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_0 = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]);
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_0;
            return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_input;
            return (cast(CLASSTYPE_Data)instance).IMETHOD_length(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
      } }).method(caller, []);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_emptyInput;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_input]);
      } })]);
   }
   override OBJECT IMETHOD_compilationFileOutput(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Configuration self = cast(CLASSTYPE_Configuration)caller;
      OBJECT LOBJECT_filePath = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_file = CLASSIMPL_File.TMETHOD_atPath(caller, cast(OBJECT[])[LOBJECT_filePath]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_file;
         return (cast(CLASSTYPE_File)instance).IMETHOD_clearContents(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      OBJECT LOBJECT_fileExists = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_file;
         return (cast(CLASSTYPE_File)instance).IMETHOD_exists(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_fileExists;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_file;
            return (cast(CLASSTYPE_File)instance).IMETHOD_appendContents(instance, parameters);
         } })]);
      } }), CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
   }
   override OBJECT IMETHOD_sourceFileInput(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Configuration self = cast(CLASSTYPE_Configuration)caller;
      OBJECT LOBJECT_filePath = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_file = CLASSIMPL_File.TMETHOD_atPath(caller, cast(OBJECT[])[LOBJECT_filePath]);
      OBJECT LOBJECT_fileExists = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_file;
         return (cast(CLASSTYPE_File)instance).IMETHOD_exists(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_fileExists;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_data = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_file;
            return (cast(CLASSTYPE_File)instance).IMETHOD_readContents(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1000000")])]);
         OBJECT LOBJECT_pos = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]);
         return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_thisPos = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_pos;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            OBJECT LOBJECT_bbite = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_data;
               return (cast(CLASSTYPE_Data)instance).IMETHOD_atIndex(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_thisPos]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_pos;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_thisPos;
               return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_bbite;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_bbbbite = parameters.length > 0 ? parameters[0] : null;
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            return LOBJECT_bbite;
         } })]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
      } })]);
   }
}

/* *** CLASS: Token *** */
interface CLASSTYPE_Token : OBJECT, LAMBDA {
   OBJECT IMETHOD_id(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_content(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_secondId(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifIdentifier(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Token : CLASSTYPE_Token {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_id = null;
   private OBJECT IOBJECT_secondId = null;
   private OBJECT IOBJECT_content = null;
   static OBJECT TMETHOD_basicToken(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Token newInstance = new CLASSIMPL_Token(); return newInstance.CMETHOD_basicToken(newInstance, parameters); }
   OBJECT CMETHOD_basicToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_id = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_id = LOBJECT_id;
      IOBJECT_content = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")]);
      IOBJECT_secondId = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]);
      return caller;
   }
   static OBJECT TMETHOD_secondIdToken(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Token newInstance = new CLASSIMPL_Token(); return newInstance.CMETHOD_secondIdToken(newInstance, parameters); }
   OBJECT CMETHOD_secondIdToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_id = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_secondId = parameters.length > 1 ? parameters[1] : null;
      IOBJECT_id = LOBJECT_id;
      IOBJECT_content = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")]);
      IOBJECT_secondId = LOBJECT_secondId;
      return caller;
   }
   static OBJECT TMETHOD_contentToken(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Token newInstance = new CLASSIMPL_Token(); return newInstance.CMETHOD_contentToken(newInstance, parameters); }
   OBJECT CMETHOD_contentToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_id = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_content = parameters.length > 1 ? parameters[1] : null;
      IOBJECT_id = LOBJECT_id;
      IOBJECT_content = LOBJECT_content;
      IOBJECT_secondId = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]);
      return caller;
   }
   override OBJECT IMETHOD_id(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return IOBJECT_id;
   }
   override OBJECT IMETHOD_content(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return IOBJECT_content;
   }
   override OBJECT IMETHOD_secondId(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return IOBJECT_secondId;
   }
   override OBJECT IMETHOD_ifIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_ifIdentifier = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_idToken = CLASSIMPL_Token.TMETHOD_identifier(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")])]);
      OBJECT LOBJECT_isIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_id;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_idToken;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_id(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_isIdentifier;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)LOBJECT_ifIdentifier).method(caller, cast(OBJECT[])[IOBJECT_content]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return caller;
   }
   static OBJECT TMETHOD_isVisibilityIndicator(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_id = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_id(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_id;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
   }
   static OBJECT TMETHOD_isDataSegment(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_id = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_id(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_id;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("4")])]);
   }
   static OBJECT TMETHOD_isIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_id = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_id(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_id;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("3")])]);
   }
   static OBJECT TMETHOD_isParentIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_id = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_id(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_id;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("2")])]);
   }
   static OBJECT TMETHOD_equals(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_t2 = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_content = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t2;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_content(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      OBJECT LOBJECT_id = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t2;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_id(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      OBJECT LOBJECT_secondId = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t2;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_secondId(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return CLASSIMPL_Boolean.TMETHOD_and(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_and(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_content;
         return (cast(CLASSTYPE_String)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_content(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_secondId;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_secondId(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])])]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_id;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_t;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_id(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])])]);
   }
   static OBJECT TMETHOD_visibilityIndicator(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_externalVisibility = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_classVisibility = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_inheritedVisibility = parameters.length > 2 ? parameters[2] : null;
      OBJECT LOBJECT_visibility = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_externalVisibility;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_one = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")]);
         return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_visibility;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_one;
               return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_visibility;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } });
      } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classVisibility;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_ten = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("10")]);
         return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_visibility;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_ten;
               return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_visibility;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } });
      } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_inheritedVisibility;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_hundred = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("100")]);
         return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_visibility;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_hundred;
               return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_visibility;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } });
      } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return CLASSIMPL_Token.TMETHOD_secondIdToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_visibility;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
   }
   static OBJECT TMETHOD_parentIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_repetitionCount = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_Token.TMETHOD_secondIdToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("2")]), LOBJECT_repetitionCount]);
   }
   static OBJECT TMETHOD_identifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_identifierString = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_Token.TMETHOD_contentToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("3")]), LOBJECT_identifierString]);
   }
   static OBJECT TMETHOD_dataSegment(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      OBJECT LOBJECT_content = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_Token.TMETHOD_contentToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("4")]), LOBJECT_content]);
   }
   static OBJECT TMETHOD_ampersand(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("5")])]);
   }
   static OBJECT TMETHOD_singleApostrophe(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("6")])]);
   }
   static OBJECT TMETHOD_arrow(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("7")])]);
   }
   static OBJECT TMETHOD_arrowBracketOpen(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("8")])]);
   }
   static OBJECT TMETHOD_arrowBracketClose(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("9")])]);
   }
   static OBJECT TMETHOD_asterisk(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("10")])]);
   }
   static OBJECT TMETHOD_asteriskCaret(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("11")])]);
   }
   static OBJECT TMETHOD_asteriskArrow(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("12")])]);
   }
   static OBJECT TMETHOD_backslash(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("13")])]);
   }
   static OBJECT TMETHOD_caret(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("14")])]);
   }
   static OBJECT TMETHOD_colon(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("15")])]);
   }
   static OBJECT TMETHOD_comma(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("16")])]);
   }
   static OBJECT TMETHOD_curlyBracketOpen(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("17")])]);
   }
   static OBJECT TMETHOD_curlyBracketClose(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("18")])]);
   }
   static OBJECT TMETHOD_doubleApostrophe(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("19")])]);
   }
   static OBJECT TMETHOD_doubleColon(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("20")])]);
   }
   static OBJECT TMETHOD_equalsSign(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("23")])]);
   }
   static OBJECT TMETHOD_exclamationMark(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("24")])]);
   }
   static OBJECT TMETHOD_forwardSlash(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("25")])]);
   }
   static OBJECT TMETHOD_fullStop(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("26")])]);
   }
   static OBJECT TMETHOD_percentSign(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("27")])]);
   }
   static OBJECT TMETHOD_pipe(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("28")])]);
   }
   static OBJECT TMETHOD_questionMark(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("29")])]);
   }
   static OBJECT TMETHOD_roundBracketOpen(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("30")])]);
   }
   static OBJECT TMETHOD_roundBracketClose(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("31")])]);
   }
   static OBJECT TMETHOD_semicolon(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("32")])]);
   }
   static OBJECT TMETHOD_squareBracketOpen(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("33")])]);
   }
   static OBJECT TMETHOD_squareBracketClose(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("34")])]);
   }
   static OBJECT TMETHOD_tilde(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("36")])]);
   }
   static OBJECT TMETHOD_doubleLessThan(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("37")])]);
   }
   static OBJECT TMETHOD_EOF(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Token self = cast(CLASSTYPE_Token)caller;
      return CLASSIMPL_Token.TMETHOD_basicToken(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("38")])]);
   }
}

/* *** CLASS: Parser *** */
interface CLASSTYPE_Parser : OBJECT, LAMBDA {
   OBJECT IMETHOD_getCopyOfNextLine(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_stringFromCharacters(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_gotoNextCharacter(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_gotoNextCharacterTrue(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_eatWhitespaceCharacters(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_hasErrors(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_errors(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_addError(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_token(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_position(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_peekAtNextToken(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_gotoNextSameTokens(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_gotoNextToken(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Parser : CLASSTYPE_Parser {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_inputStream = null;
   private OBJECT IOBJECT_errors = null;
   private OBJECT IOBJECT_currentToken = null;
   private OBJECT IOBJECT_currentTokenPosition = null;
   private OBJECT IOBJECT_ifNextTokenOrElse = null;
   private OBJECT IOBJECT_currentCharacter = null;
   private OBJECT IOBJECT_currentCharacterPosition = null;
   private OBJECT IOBJECT_buffer = null;
   static OBJECT TMETHOD_withSourceNameAndInput(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Parser newInstance = new CLASSIMPL_Parser(); return newInstance.CMETHOD_withSourceNameAndInput(newInstance, parameters); }
   OBJECT CMETHOD_withSourceNameAndInput(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      OBJECT LOBJECT_sourceName = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_inputStream = parameters.length > 1 ? parameters[1] : null;
      IOBJECT_inputStream = LOBJECT_inputStream;
      IOBJECT_errors = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_currentToken = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
      IOBJECT_buffer = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_currentCharacter = CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
      OBJECT LOBJECT_initialPosition = CLASSIMPL_SourcePosition.TMETHOD_initialPositionIn(caller, cast(OBJECT[])[LOBJECT_sourceName, self.IMETHOD_getCopyOfNextLine(self, cast(OBJECT[])[])]);
      IOBJECT_currentCharacterPosition = LOBJECT_initialPosition;
      IOBJECT_currentTokenPosition = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_initialPosition]);
      IOBJECT_ifNextTokenOrElse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
         (cast(LAMBDA)LOBJECT_else).method(caller, cast(OBJECT[])[]);
         return caller;
      } });
      self.IMETHOD_gotoNextCharacterTrue(self, cast(OBJECT[])[]);
      self.IMETHOD_gotoNextToken(self, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_getCopyOfNextLine(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      OBJECT LOBJECT_line = self.IMETHOD_stringFromCharacters(self, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_useCharacter = parameters.length > 0 ? parameters[0] : null;
         CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_nextChar = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = (cast(LAMBDA)IOBJECT_inputStream).method(caller, cast(OBJECT[])[]);
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_b = parameters.length > 0 ? parameters[0] : null;
               return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Character.TMETHOD_fromASCII(caller, cast(OBJECT[])[LOBJECT_b])]);
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return CLASSIMPL_Maybe.TMETHOD_nothing(caller, parameters);
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_nextChar;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_c = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_buffer;
                  return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_c]);
               OBJECT LOBJECT_notEndOfLine = CLASSIMPL_Boolean.TMETHOD_not(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_c;
                  return (cast(CLASSTYPE_Character)instance).IMETHOD_isNewline(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_notEndOfLine;
                  return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_cIsTab = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_c;
                     return (cast(CLASSTYPE_Character)instance).IMETHOD_isTab(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_cIsTab;
                     return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)LOBJECT_useCharacter).method(caller, cast(OBJECT[])[CLASSIMPL_Character.TMETHOD_space(caller, cast(OBJECT[])[])]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)LOBJECT_useCharacter).method(caller, cast(OBJECT[])[LOBJECT_c]);
                     return caller;
                  } })]);
                  return caller;
               } }), LOBJECT_stop]);
               return caller;
            } }), LOBJECT_stop]);
            return caller;
         } })]);
         return caller;
      } })]);
      return LOBJECT_line;
   }
   override OBJECT IMETHOD_stringFromCharacters(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      OBJECT LOBJECT_getCharacters = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_asciiString = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)LOBJECT_getCharacters).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_character = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_asciiString;
            return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_character;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_asASCII(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      return CLASSIMPL_String.TMETHOD_asASCII(caller, cast(OBJECT[])[CLASSIMPL_Data.TMETHOD_copy(caller, cast(OBJECT[])[LOBJECT_asciiString])]);
   }
   override OBJECT IMETHOD_gotoNextCharacter(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      OBJECT LOBJECT_currentCharacter = IOBJECT_currentCharacter;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_currentCharacter;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_t;
               return (cast(CLASSTYPE_Character)instance).IMETHOD_isNULL(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            self.IMETHOD_gotoNextCharacterTrue(self, cast(OBJECT[])[]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_gotoNextCharacterTrue(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      OBJECT LOBJECT_currentCharacter = IOBJECT_currentCharacter;
      OBJECT LOBJECT_isNewline = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_currentCharacter;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_c = parameters.length > 0 ? parameters[0] : null;
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_c;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_isNewline(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      } })]);
      OBJECT LOBJECT_currentCharacterPosition = IOBJECT_currentCharacterPosition;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_isNewline;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         IOBJECT_currentCharacterPosition = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_currentCharacterPosition;
            return (cast(CLASSTYPE_SourcePosition)instance).IMETHOD_startOfNextLine(instance, parameters);
         } })).method(caller, cast(OBJECT[])[self.IMETHOD_getCopyOfNextLine(self, cast(OBJECT[])[])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         IOBJECT_currentCharacterPosition = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_currentCharacterPosition;
            return (cast(CLASSTYPE_SourcePosition)instance).IMETHOD_nextColumn(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         return caller;
      } })]);
      OBJECT LOBJECT_bufferedChar = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_buffer;
         return (cast(CLASSTYPE_List)instance).IMETHOD_removeFirst(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_bufferedChar;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_chaa = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      IOBJECT_currentCharacter = LOBJECT_bufferedChar;
      return caller;
   }
   override OBJECT IMETHOD_eatWhitespaceCharacters(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      CLASSIMPL_Loops.TMETHOD_while(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_isWhitespace = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
         OBJECT LOBJECT_currentCharacter = IOBJECT_currentCharacter;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_currentCharacter;
            return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_character = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_isWhitespace;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_character;
               return (cast(CLASSTYPE_Character)instance).IMETHOD_isWhitespace(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_isWhitespace;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = self;
         return self.IMETHOD_gotoNextCharacter(instance, parameters);
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_hasErrors(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      return CLASSIMPL_Boolean.TMETHOD_not(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_0 = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]);
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_0;
            return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_errors;
            return (cast(CLASSTYPE_List)instance).IMETHOD_length(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
      } }).method(caller, [])]);
   }
   override OBJECT IMETHOD_errors(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      return IOBJECT_errors;
   }
   override OBJECT IMETHOD_addError(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      OBJECT LOBJECT_error = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_errors;
         return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_error]);
      return caller;
   }
   override OBJECT IMETHOD_token(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      OBJECT LOBJECT_token = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_EOF(caller, cast(OBJECT[])[])]);
      OBJECT LOBJECT_m = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_currentToken;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_m;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_token;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_t]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_token;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_position(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_currentTokenPosition;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_peekAtNextToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      OBJECT LOBJECT_token = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_EOF(caller, cast(OBJECT[])[])]);
      (cast(LAMBDA)IOBJECT_ifNextTokenOrElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_p = parameters.length > 1 ? parameters[1] : null;
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_currT = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_currentToken;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_currS = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_currentTokenPosition;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         self.IMETHOD_gotoNextToken(self, cast(OBJECT[])[]);
         OBJECT LOBJECT_nextT = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_currentToken;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_nextS = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_currentTokenPosition;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_currentToken;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_currT]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_currentTokenPosition;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_currS]);
         IOBJECT_ifNextTokenOrElse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_e = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_nextT, LOBJECT_nextS]);
            return caller;
         } });
         return caller;
      } })]);
      (cast(LAMBDA)IOBJECT_ifNextTokenOrElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_m = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_p = parameters.length > 1 ? parameters[1] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_m;
            return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_token;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_t]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_token;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_gotoNextSameTokens(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_number = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]);
      OBJECT LOBJECT_1 = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")]);
      CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_nextTokenIsSame = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[self.IMETHOD_token(self, cast(OBJECT[])[]), LOBJECT_token]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_nextTokenIsSame;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            self.IMETHOD_gotoNextToken(self, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_number;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_1;
               return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_number;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } }), LOBJECT_stop]);
         return caller;
      } })]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_number;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_gotoNextToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Parser self = cast(CLASSTYPE_Parser)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_setToken = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_position = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_token = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_currentToken;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_token])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_currentTokenPosition;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_position]);
            return caller;
         } });
         OBJECT LOBJECT_ifNoToken = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_noToken = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_currentToken = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_currentToken;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_currentToken;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } }), LOBJECT_noToken]);
            return caller;
         } });
         OBJECT LOBJECT_if = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_condition = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_action = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_result = (cast(LAMBDA)LOBJECT_condition).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_result;
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_action, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            return caller;
         } });
         OBJECT LOBJECT_ifElse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_condition = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_action = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_else = parameters.length > 2 ? parameters[2] : null;
            OBJECT LOBJECT_result = (cast(LAMBDA)LOBJECT_condition).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_result;
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_action, LOBJECT_else]);
            return caller;
         } });
         OBJECT LOBJECT_scanToken = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_provideCharacterAndContinueScannning = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_continuing = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
            CLASSIMPL_Loops.TMETHOD_while(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_continuing;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_continuing;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
               OBJECT LOBJECT_maybeCurrentCharacter = IOBJECT_currentCharacter;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_maybeCurrentCharacter;
                  return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_character = parameters.length > 0 ? parameters[0] : null;
                  (cast(LAMBDA)LOBJECT_provideCharacterAndContinueScannning).method(caller, cast(OBJECT[])[LOBJECT_character, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_continuing;
                        return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
                     self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                     return caller;
                  } })]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } });
         OBJECT LOBJECT_stringFromCharacters = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_getCharacters = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_asciiString = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)LOBJECT_getCharacters).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_character = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_asciiString;
                  return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_character;
                  return (cast(CLASSTYPE_Character)instance).IMETHOD_asASCII(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               return caller;
            } })]);
            return CLASSIMPL_String.TMETHOD_asASCII(caller, cast(OBJECT[])[CLASSIMPL_Data.TMETHOD_copy(caller, cast(OBJECT[])[LOBJECT_asciiString])]);
         } });
         OBJECT LOBJECT_ifStrudelOrElse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_action = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_maybeCurrentCharacter = IOBJECT_currentCharacter;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_maybeCurrentCharacter;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_currentCharacter = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_currentCharacter;
                  return (cast(CLASSTYPE_Character)instance).IMETHOD_isStrudel(instance, parameters);
               } }), LOBJECT_action, LOBJECT_else]);
               return caller;
            } }), LOBJECT_else]);
            return caller;
         } });
         OBJECT LOBJECT_ifHashOrElse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_action = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_maybeCurrentCharacter = IOBJECT_currentCharacter;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_maybeCurrentCharacter;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_currentCharacter = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_currentCharacter;
                  return (cast(CLASSTYPE_Character)instance).IMETHOD_isHash(instance, parameters);
               } }), LOBJECT_action, LOBJECT_else]);
               return caller;
            } }), LOBJECT_else]);
            return caller;
         } });
         OBJECT LOBJECT_ifPlusOrDashOrElse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_maybeChar = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_plus = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_dash = parameters.length > 2 ? parameters[2] : null;
            OBJECT LOBJECT_else = parameters.length > 3 ? parameters[3] : null;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_maybeChar;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_char = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_char;
                  return (cast(CLASSTYPE_Character)instance).IMETHOD_isPlus(instance, parameters);
               } }), LOBJECT_plus, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_char;
                     return (cast(CLASSTYPE_Character)instance).IMETHOD_isDash(instance, parameters);
                  } }), LOBJECT_dash, LOBJECT_else]);
                  return caller;
               } })]);
               return caller;
            } }), LOBJECT_else]);
            return caller;
         } });
         return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)IOBJECT_ifNextTokenOrElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_m = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_p = parameters.length > 1 ? parameters[1] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_m;
                  return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_t = parameters.length > 0 ? parameters[0] : null;
                  (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_p, LOBJECT_t]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return caller;
               } })]);
               IOBJECT_ifNextTokenOrElse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
                  (cast(LAMBDA)LOBJECT_else).method(caller, cast(OBJECT[])[]);
                  return caller;
               } });
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_currentToken;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
               self.IMETHOD_eatWhitespaceCharacters(self, cast(OBJECT[])[]);
               (cast(LAMBDA)LOBJECT_ifStrudelOrElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  CLASSIMPL_Loops.TMETHOD_while(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_currentCharacter = IOBJECT_currentCharacter;
                     return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_currentCharacter;
                        return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_c = parameters.length > 0 ? parameters[0] : null;
                        return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_c;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isStrudel(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[]);
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        return CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
                     } })]);
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                     (cast(LAMBDA)LOBJECT_ifStrudelOrElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                        OBJECT LOBJECT_lastCharacterWasStrudel = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
                        (cast(LAMBDA)LOBJECT_scanToken).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_thisCharacter = parameters.length > 0 ? parameters[0] : null;
                           OBJECT LOBJECT_continueScanning = parameters.length > 1 ? parameters[1] : null;
                           (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_thisCharacter;
                              return (cast(CLASSTYPE_Character)instance).IMETHOD_isStrudel(instance, parameters);
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_lastCharacterWasStrudel;
                                 return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_lastCharacterWasStrudel;
                                    return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
                                 self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                                 self.IMETHOD_eatWhitespaceCharacters(self, cast(OBJECT[])[]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_lastCharacterWasStrudel;
                                    return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
                                 (cast(LAMBDA)LOBJECT_continueScanning).method(caller, cast(OBJECT[])[]);
                                 return caller;
                              } })]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_lastCharacterWasStrudel;
                                 return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
                              (cast(LAMBDA)LOBJECT_continueScanning).method(caller, cast(OBJECT[])[]);
                              return caller;
                           } })]);
                           return caller;
                        } })]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        (cast(LAMBDA)LOBJECT_scanToken).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_thisCharacter = parameters.length > 0 ? parameters[0] : null;
                           OBJECT LOBJECT_continueScanning = parameters.length > 1 ? parameters[1] : null;
                           (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_thisCharacter;
                              return (cast(CLASSTYPE_Character)instance).IMETHOD_isNewline(instance, parameters);
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_eatWhitespaceCharacters(self, cast(OBJECT[])[]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)LOBJECT_continueScanning).method(caller, cast(OBJECT[])[]);
                              return caller;
                           } })]);
                           return caller;
                        } })]);
                        return caller;
                     } })]);
                     return caller;
                  } })]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return caller;
               } })]);
               (cast(LAMBDA)LOBJECT_ifHashOrElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_position1 = IOBJECT_currentCharacterPosition;
                  self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                  (cast(LAMBDA)LOBJECT_ifHashOrElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                     OBJECT LOBJECT_dataSegmentString = (cast(LAMBDA)LOBJECT_stringFromCharacters).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_useCharacter = parameters.length > 0 ? parameters[0] : null;
                        OBJECT LOBJECT_variablePreviousCharacter = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Character.TMETHOD_space(caller, cast(OBJECT[])[])]);
                        CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
                           OBJECT LOBJECT_previousCharacter = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_variablePreviousCharacter;
                              return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[]);
                           OBJECT LOBJECT_currentCharacter = IOBJECT_currentCharacter;
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_currentCharacter;
                              return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT LOBJECT_char = parameters.length > 0 ? parameters[0] : null;
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_variablePreviousCharacter;
                                 return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[LOBJECT_char]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              return caller;
                           } })]);
                           (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_previousCharacter;
                              return (cast(CLASSTYPE_Character)instance).IMETHOD_isHash(instance, parameters);
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)LOBJECT_ifHashOrElse).method(caller, cast(OBJECT[])[LOBJECT_stop, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 (cast(LAMBDA)LOBJECT_useCharacter).method(caller, cast(OBJECT[])[LOBJECT_previousCharacter]);
                                 (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_currentCharacter;
                                    return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT LOBJECT_char = parameters.length > 0 ? parameters[0] : null;
                                    (cast(LAMBDA)LOBJECT_useCharacter).method(caller, cast(OBJECT[])[LOBJECT_char]);
                                    return caller;
                                 } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    self.IMETHOD_addError(self, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingSecondDataSegmentAnchor(caller, cast(OBJECT[])[LOBJECT_position1])]);
                                    (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
                                    return caller;
                                 } })]);
                                 return caller;
                              } })]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)LOBJECT_ifHashOrElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_currentCharacter;
                                    return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT LOBJECT_char = parameters.length > 0 ? parameters[0] : null;
                                    (cast(LAMBDA)LOBJECT_useCharacter).method(caller, cast(OBJECT[])[LOBJECT_char]);
                                    return caller;
                                 } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    self.IMETHOD_addError(self, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingSecondDataSegmentAnchor(caller, cast(OBJECT[])[LOBJECT_position1])]);
                                    (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
                                    return caller;
                                 } })]);
                                 return caller;
                              } })]);
                              return caller;
                           } })]);
                           self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                           return caller;
                        } })]);
                        return caller;
                     } })]);
                     (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_0 = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]);
                        return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_0;
                           return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = IOBJECT_errors;
                           return (cast(CLASSTYPE_List)instance).IMETHOD_length(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])]);
                     } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_dataSegment(caller, cast(OBJECT[])[LOBJECT_dataSegmentString])]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        return caller;
                     } })]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     self.IMETHOD_addError(self, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingSecondHashForDataSegmentAnchor(caller, cast(OBJECT[])[LOBJECT_position1])]);
                     return caller;
                  } })]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_currentCharacter = IOBJECT_currentCharacter;
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_currentCharacter;
                     return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_character1 = parameters.length > 0 ? parameters[0] : null;
                     OBJECT LOBJECT_position1 = IOBJECT_currentCharacterPosition;
                     self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                     OBJECT LOBJECT_isIdentifier = CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_character1;
                        return (cast(CLASSTYPE_Character)instance).IMETHOD_isAlphanumeric(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_character1;
                        return (cast(CLASSTYPE_Character)instance).IMETHOD_isUnderscore(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_isIdentifier;
                        return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_identifierString = (cast(LAMBDA)LOBJECT_stringFromCharacters).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_useCharacter = parameters.length > 0 ? parameters[0] : null;
                           (cast(LAMBDA)LOBJECT_useCharacter).method(caller, cast(OBJECT[])[LOBJECT_character1]);
                           (cast(LAMBDA)LOBJECT_scanToken).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT LOBJECT_thisCharacter = parameters.length > 0 ? parameters[0] : null;
                              OBJECT LOBJECT_continueScanning = parameters.length > 1 ? parameters[1] : null;
                              OBJECT LOBJECT_thisCharacterIsForIdentifier = CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_thisCharacter;
                                 return (cast(CLASSTYPE_Character)instance).IMETHOD_isAlphanumeric(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_thisCharacter;
                                 return (cast(CLASSTYPE_Character)instance).IMETHOD_isUnderscore(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[])]);
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_thisCharacterIsForIdentifier;
                                 return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 (cast(LAMBDA)LOBJECT_useCharacter).method(caller, cast(OBJECT[])[LOBJECT_thisCharacter]);
                                 (cast(LAMBDA)LOBJECT_continueScanning).method(caller, cast(OBJECT[])[]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 return caller;
                              } })]);
                              return caller;
                           } })]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_identifier(caller, cast(OBJECT[])[LOBJECT_identifierString])]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        return caller;
                     } })]);
                     (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_character1;
                        return (cast(CLASSTYPE_Character)instance).IMETHOD_isDollarSign(instance, parameters);
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_repetitionCount = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
                        (cast(LAMBDA)LOBJECT_scanToken).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_thisCharacter = parameters.length > 0 ? parameters[0] : null;
                           OBJECT LOBJECT_continueScanning = parameters.length > 1 ? parameters[1] : null;
                           (cast(LAMBDA)LOBJECT_ifElse).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_thisCharacter;
                              return (cast(CLASSTYPE_Character)instance).IMETHOD_isDollarSign(instance, parameters);
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_repetitionCount;
                                 return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT LOBJECT_x = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_repetitionCount;
                                    return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[]);
                                 return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_x;
                                    return (cast(CLASSTYPE_Integer)instance).IMETHOD_adding(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
                              } }).method(caller, [])]);
                              (cast(LAMBDA)LOBJECT_continueScanning).method(caller, cast(OBJECT[])[]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              return caller;
                           } })]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_parentIdentifier(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_repetitionCount;
                           return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])])]);
                        return caller;
                     } })]);
                     (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        return CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isDash(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isPlus(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])]);
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        (cast(LAMBDA)LOBJECT_ifPlusOrDashOrElse).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_character1]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_ifPlusOrDashOrElse).method(caller, cast(OBJECT[])[IOBJECT_currentCharacter, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                              (cast(LAMBDA)LOBJECT_ifPlusOrDashOrElse).method(caller, cast(OBJECT[])[IOBJECT_currentCharacter, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                                 (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])])]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                                 (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])])]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])])]);
                                 return caller;
                              } })]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                              (cast(LAMBDA)LOBJECT_ifPlusOrDashOrElse).method(caller, cast(OBJECT[])[IOBJECT_currentCharacter, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                                 (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])])]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                                 (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])])]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_addError(self, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_invalidVisibilityIndicator(caller, cast(OBJECT[])[LOBJECT_position1])]);
                                 return caller;
                              } })]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])])]);
                              return caller;
                           } })]);
                           return caller;
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_ifPlusOrDashOrElse).method(caller, cast(OBJECT[])[IOBJECT_currentCharacter, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                              (cast(LAMBDA)LOBJECT_ifPlusOrDashOrElse).method(caller, cast(OBJECT[])[IOBJECT_currentCharacter, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                                 (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])])]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                                 (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])])]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_addError(self, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_invalidVisibilityIndicator(caller, cast(OBJECT[])[LOBJECT_position1])]);
                                 return caller;
                              } })]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                              (cast(LAMBDA)LOBJECT_ifPlusOrDashOrElse).method(caller, cast(OBJECT[])[IOBJECT_currentCharacter, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                                 (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])])]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                                 (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])])]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 self.IMETHOD_addError(self, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_invalidVisibilityIndicator(caller, cast(OBJECT[])[LOBJECT_position1])]);
                                 return caller;
                              } })]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_visibilityIndicator(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])])]);
                              return caller;
                           } })]);
                           return caller;
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           return caller;
                        } })]);
                        return caller;
                     } })]);
                     OBJECT LOBJECT_currentCharacter2 = IOBJECT_currentCharacter;
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_currentCharacter2;
                        return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_character2 = parameters.length > 0 ? parameters[0] : null;
                        OBJECT LOBJECT_position2 = IOBJECT_currentCharacterPosition;
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isDash(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_character2;
                              return (cast(CLASSTYPE_Character)instance).IMETHOD_isArrowBracketClose(instance, parameters);
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                              (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_arrow(caller, cast(OBJECT[])[])]);
                              return caller;
                           } })]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isAsterisk(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_character2;
                              return (cast(CLASSTYPE_Character)instance).IMETHOD_isCaret(instance, parameters);
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                              (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_asteriskCaret(caller, cast(OBJECT[])[])]);
                              return caller;
                           } })]);
                           (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_character2;
                              return (cast(CLASSTYPE_Character)instance).IMETHOD_isArrowBracketClose(instance, parameters);
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                              (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_asteriskArrow(caller, cast(OBJECT[])[])]);
                              return caller;
                           } })]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isColon(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_character2;
                              return (cast(CLASSTYPE_Character)instance).IMETHOD_isColon(instance, parameters);
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                              (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_doubleColon(caller, cast(OBJECT[])[])]);
                              return caller;
                           } })]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isArrowBracketOpen(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_character2;
                              return (cast(CLASSTYPE_Character)instance).IMETHOD_isArrowBracketOpen(instance, parameters);
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              self.IMETHOD_gotoNextCharacter(self, cast(OBJECT[])[]);
                              (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_doubleLessThan(caller, cast(OBJECT[])[])]);
                              return caller;
                           } })]);
                           return caller;
                        } })]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        return caller;
                     } })]);
                     (cast(LAMBDA)LOBJECT_ifNoToken).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isAmpersand(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_ampersand(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isSingleApostrophe(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_singleApostrophe(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isArrowBracketOpen(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_arrowBracketOpen(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isArrowBracketClose(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_arrowBracketClose(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isAsterisk(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_asterisk(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isBackslash(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_backslash(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isCaret(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_caret(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isColon(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isComma(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_comma(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isCurlyBracketOpen(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_curlyBracketOpen(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isCurlyBracketClose(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_curlyBracketClose(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isDoubleApostrophe(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_doubleApostrophe(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isEqualsSign(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_equalsSign(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isExclamationMark(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_exclamationMark(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isForwardslash(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_forwardSlash(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isFullstop(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_fullStop(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isPercentSign(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_percentSign(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isPipe(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_pipe(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isQuestionMark(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_questionMark(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isRoundBracketOpen(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_roundBracketOpen(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isRoundBracketClose(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_roundBracketClose(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isSemicolon(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_semicolon(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isSquareBracketOpen(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_squareBracketOpen(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isSquareBracketClose(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_squareBracketClose(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_isTilde(instance, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)LOBJECT_setToken).method(caller, cast(OBJECT[])[LOBJECT_position1, CLASSIMPL_Token.TMETHOD_tilde(caller, cast(OBJECT[])[])]);
                           return caller;
                        } })]);
                        return caller;
                     } })]);
                     (cast(LAMBDA)LOBJECT_ifNoToken).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        self.IMETHOD_addError(self, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_unrecognisedToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_character1;
                           return (cast(CLASSTYPE_Character)instance).IMETHOD_description(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[]), LOBJECT_position1])]);
                        return caller;
                     } })]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     return caller;
                  } })]);
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } });
      } }).method(caller, [])).method(caller, parameters);
   }
}

/* *** CLASS: Commands *** */
interface CLASSTYPE_Commands : OBJECT, LAMBDA {
   OBJECT IMETHOD_readNext(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_readNextCharacter(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_readNextString(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_readNextFilePath(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_eatWhitespaceCharacters(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Commands : CLASSTYPE_Commands {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_inputStream = null;
   private OBJECT IOBJECT_currentCharacter = null;
   static OBJECT TMETHOD_from(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Commands newInstance = new CLASSIMPL_Commands(); return newInstance.CMETHOD_from(newInstance, parameters); }
   OBJECT CMETHOD_from(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Commands self = cast(CLASSTYPE_Commands)caller;
      OBJECT LOBJECT_dataInputStream = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_varCurrentData = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
      OBJECT LOBJECT_currentIndex = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]);
      OBJECT LOBJECT_1 = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")]);
      OBJECT LOBJECT_0 = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]);
      IOBJECT_inputStream = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_nextByte = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
         OBJECT LOBJECT_maybeCurrentData = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_varCurrentData;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_gotoNextData = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_varCurrentData;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)LOBJECT_dataInputStream).method(caller, cast(OBJECT[])[])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_currentIndex;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_0]);
            return caller;
         } });
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_maybeCurrentData;
            return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_currentData = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_inCurrentData = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_currentData;
               return (cast(CLASSTYPE_Data)instance).IMETHOD_atIndex(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_currentIndex;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_inCurrentData;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_b = parameters.length > 0 ? parameters[0] : null;
               return caller;
            } }), LOBJECT_gotoNextData]);
            return caller;
         } }), LOBJECT_gotoNextData]);
         OBJECT LOBJECT_maybeCurrentData2 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_varCurrentData;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_maybeCurrentData2;
            return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_currentData = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_inCurrentData = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_currentData;
               return (cast(CLASSTYPE_Data)instance).IMETHOD_atIndex(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_currentIndex;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_inCurrentData;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_b = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_nextByte;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_b])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_currentIndex;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_1;
                  return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_currentIndex;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_nextByte;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
      } });
      IOBJECT_currentCharacter = CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
      self.IMETHOD_readNextCharacter(self, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_readNext(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Commands self = cast(CLASSTYPE_Commands)caller;
      OBJECT LOBJECT_reader = parameters.length > 0 ? parameters[0] : null;
      self.IMETHOD_eatWhitespaceCharacters(self, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_currentCharacter;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_character = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_exit = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_character;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_isSemicolon(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_exit;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_reader;
            return (cast(CLASSTYPE_CommandReader)instance).IMETHOD_exit(instance, parameters);
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         OBJECT LOBJECT_validCommand = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_exit]);
         OBJECT LOBJECT_parseSourceFile = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_character;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_isPlus(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parseSourceFile;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_reader;
               return (cast(CLASSTYPE_CommandReader)instance).IMETHOD_parseSourceFile(instance, parameters);
            } })).method(caller, cast(OBJECT[])[self.IMETHOD_readNextFilePath(self, cast(OBJECT[])[])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_validCommand;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         OBJECT LOBJECT_compileToFile = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_character;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_isTilde(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_compileToFile;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_compilationMethod = self.IMETHOD_readNextString(self, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_c = parameters.length > 0 ? parameters[0] : null;
               return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_c;
                  return (cast(CLASSTYPE_Character)instance).IMETHOD_isAlphanumeric(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
            } })]);
            self.IMETHOD_eatWhitespaceCharacters(self, cast(OBJECT[])[]);
            OBJECT LOBJECT_colonPresent = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_currentCharacter;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_c = parameters.length > 0 ? parameters[0] : null;
               return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_c;
                  return (cast(CLASSTYPE_Character)instance).IMETHOD_isColon(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_colonPresent;
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_reader;
                  return (cast(CLASSTYPE_CommandReader)instance).IMETHOD_compileToFile(instance, parameters);
               } })).method(caller, cast(OBJECT[])[self.IMETHOD_readNextFilePath(self, cast(OBJECT[])[])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_validCommand;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         OBJECT LOBJECT_invalidCommand = CLASSIMPL_Boolean.TMETHOD_not(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_validCommand;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_invalidCommand;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_reader;
               return (cast(CLASSTYPE_CommandReader)instance).IMETHOD_invalidCommand(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_readNextCharacter(self, cast(OBJECT[])[]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_reader;
         return (cast(CLASSTYPE_CommandReader)instance).IMETHOD_exit(instance, parameters);
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_readNextCharacter(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Commands self = cast(CLASSTYPE_Commands)caller;
      OBJECT LOBJECT_input = (cast(LAMBDA)IOBJECT_inputStream).method(caller, cast(OBJECT[])[]);
      IOBJECT_currentCharacter = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_input;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_b = parameters.length > 0 ? parameters[0] : null;
         return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Character.TMETHOD_fromASCII(caller, cast(OBJECT[])[LOBJECT_b])]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Maybe.TMETHOD_nothing(caller, parameters);
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_readNextString(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Commands self = cast(CLASSTYPE_Commands)caller;
      OBJECT LOBJECT_inString = parameters.length > 0 ? parameters[0] : null;
      self.IMETHOD_eatWhitespaceCharacters(self, cast(OBJECT[])[]);
      OBJECT LOBJECT_asciiString = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      CLASSIMPL_Loops.TMETHOD_while(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_charcterInString = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
         self.IMETHOD_readNextCharacter(self, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_currentCharacter;
            return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_character = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_charcterInString;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)LOBJECT_inString).method(caller, cast(OBJECT[])[LOBJECT_character])]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_charcterInString;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_currentCharacter;
            return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_character = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_asciiString;
               return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_character;
               return (cast(CLASSTYPE_Character)instance).IMETHOD_asASCII(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return caller;
      } })]);
      return CLASSIMPL_String.TMETHOD_asASCII(caller, cast(OBJECT[])[CLASSIMPL_Data.TMETHOD_copy(caller, cast(OBJECT[])[LOBJECT_asciiString])]);
   }
   override OBJECT IMETHOD_readNextFilePath(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Commands self = cast(CLASSTYPE_Commands)caller;
      return self.IMETHOD_readNextString(self, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_c = parameters.length > 0 ? parameters[0] : null;
         return CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_c;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_isAlphanumeric(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_c;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_isFullstop(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_c;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_isForwardslash(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_c;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_isBackslash(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_c;
            return (cast(CLASSTYPE_Character)instance).IMETHOD_isUnderscore(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
      } })]);
   }
   override OBJECT IMETHOD_eatWhitespaceCharacters(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Commands self = cast(CLASSTYPE_Commands)caller;
      CLASSIMPL_Loops.TMETHOD_while(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_isWhitespace = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_currentCharacter;
            return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_character = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_isWhitespace;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_character;
               return (cast(CLASSTYPE_Character)instance).IMETHOD_isWhitespace(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_isWhitespace;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = self;
         return self.IMETHOD_readNextCharacter(instance, parameters);
      } })]);
      return caller;
   }
}

/* *** CLASS: DainaGeneralIdentifier *** */
interface CLASSTYPE_DainaGeneralIdentifier : OBJECT, LAMBDA {
   OBJECT IMETHOD_content(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isVoidIdentifier(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaGeneralIdentifier : CLASSTYPE_DainaGeneralIdentifier {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_content = null;
   static OBJECT TMETHOD_isFirstToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaGeneralIdentifier self = cast(CLASSTYPE_DainaGeneralIdentifier)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_isIdentifier = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_token;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_ifIdentifier(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_s = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_isIdentifier;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_isIdentifier;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   static OBJECT TMETHOD_base(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaGeneralIdentifier newInstance = new CLASSIMPL_DainaGeneralIdentifier(); return newInstance.CMETHOD_base(newInstance, parameters); }
   OBJECT CMETHOD_base(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaGeneralIdentifier self = cast(CLASSTYPE_DainaGeneralIdentifier)caller;
      IOBJECT_content = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")]);
      return caller;
   }
   override OBJECT IMETHOD_content(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaGeneralIdentifier self = cast(CLASSTYPE_DainaGeneralIdentifier)caller;
      return IOBJECT_content;
   }
   override OBJECT IMETHOD_isVoidIdentifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaGeneralIdentifier self = cast(CLASSTYPE_DainaGeneralIdentifier)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_content;
         return (cast(CLASSTYPE_String)instance).IMETHOD_isEqualTo(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("_")])]);
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaGeneralIdentifier self = cast(CLASSTYPE_DainaGeneralIdentifier)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_identifierToken = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_identifierToken;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_ifIdentifier(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_s = parameters.length > 0 ? parameters[0] : null;
         IOBJECT_content = LOBJECT_s;
         return caller;
      } })]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return caller;
   }
}

/* *** CLASS: DainaGenericDeclarationList *** */
interface CLASSTYPE_DainaGenericDeclarationList : OBJECT, LAMBDA {
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaGenericDeclarationList : CLASSTYPE_DainaGenericDeclarationList {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_generics = null;
   static OBJECT TMETHOD_base(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaGenericDeclarationList newInstance = new CLASSIMPL_DainaGenericDeclarationList(); return newInstance.CMETHOD_base(newInstance, parameters); }
   OBJECT CMETHOD_base(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaGenericDeclarationList self = cast(CLASSTYPE_DainaGenericDeclarationList)caller;
      IOBJECT_generics = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaGenericDeclarationList self = cast(CLASSTYPE_DainaGenericDeclarationList)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrowBracketOpen(caller, cast(OBJECT[])[])]);
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_generic = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_generic;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_generics;
                  return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_generic]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_comma(caller, cast(OBJECT[])[])]);
                  return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  return caller;
               } }), LOBJECT_stop]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingGenericIdentifier(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
               return caller;
            } })]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrowBracketClose(caller, cast(OBJECT[])[])]);
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForGenericDeclarationList(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return caller;
   }
}

/* *** CLASS: DainaDependancyStructure *** */
interface CLASSTYPE_DainaDependancyStructure : OBJECT, LAMBDA {
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaDependancyStructure : CLASSTYPE_DainaDependancyStructure {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_dependancies = null;
   private OBJECT IOBJECT_dependanciesWithDerivatives = null;
   private OBJECT IOBJECT_reverseDependancies = null;
   static OBJECT TMETHOD_base(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaDependancyStructure newInstance = new CLASSIMPL_DainaDependancyStructure(); return newInstance.CMETHOD_base(newInstance, parameters); }
   OBJECT CMETHOD_base(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaDependancyStructure self = cast(CLASSTYPE_DainaDependancyStructure)caller;
      IOBJECT_dependancies = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_reverseDependancies = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_dependanciesWithDerivatives = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaDependancyStructure self = cast(CLASSTYPE_DainaDependancyStructure)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_parseIDList = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_list = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_missingIDError = parameters.length > 1 ? parameters[1] : null;
         OBJECT LOBJECT_maybeDerivativeList = parameters.length > 2 ? parameters[2] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_id = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_id;
                     return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_list;
                     return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_id]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_comma(caller, cast(OBJECT[])[])]);
                     return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]);
                     return caller;
                  } }), LOBJECT_stop]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_missingId = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)LOBJECT_missingIDError).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])])]);
                     (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
                     return caller;
                  } });
                  return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_maybeDerivativeList;
                        return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_derivativeList = parameters.length > 0 ? parameters[0] : null;
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketOpen(caller, cast(OBJECT[])[])]);
                           return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[]);
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_parser;
                                 return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[])]);
                              return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT LOBJECT_id = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_id;
                                 return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_list;
                                 return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[LOBJECT_id]);
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_derivativeList;
                                 return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[LOBJECT_id]);
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_parser;
                                    return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketClose(caller, cast(OBJECT[])[])]);
                                 return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_parser;
                                    return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[]);
                                 (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                       OBJECT instance = LOBJECT_parser;
                                       return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                                    } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_comma(caller, cast(OBJECT[])[])]);
                                    return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                       OBJECT instance = LOBJECT_parser;
                                       return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                                    } })).method(caller, cast(OBJECT[])[]);
                                    return caller;
                                 } }), LOBJECT_stop]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_parser;
                                    return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForDependancyWithDerivatives(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_parser;
                                    return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[])])]);
                                 (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
                                 return caller;
                              } })]);
                              return caller;
                           } }), LOBJECT_missingId]);
                           return caller;
                        } }), LOBJECT_missingId]);
                        return caller;
                     } }), LOBJECT_missingId]);
                     return caller;
                  } });
               } }).method(caller, [])]);
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketClose(caller, cast(OBJECT[])[])]);
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForDependancyList(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } });
      {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketOpen(caller, cast(OBJECT[])[])]);
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)LOBJECT_parseIDList).method(caller, cast(OBJECT[])[IOBJECT_dependancies, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return CLASSIMPL_Error.TMETHOD_expectingDependancy(caller, parameters);
            } }), CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[IOBJECT_dependanciesWithDerivatives])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrow(caller, cast(OBJECT[])[])]);
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketOpen(caller, cast(OBJECT[])[])]);
                  return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)LOBJECT_parseIDList).method(caller, cast(OBJECT[])[IOBJECT_reverseDependancies, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     return CLASSIMPL_Error.TMETHOD_expectingReverseDependancy(caller, parameters);
                  } }), CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingReverseDependancyList(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
      }
      return caller;
   }
}

/* *** CLASS: DainaClassIdentifier *** */
interface CLASSTYPE_DainaClassIdentifier : OBJECT, LAMBDA {
   OBJECT IMETHOD_content(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaClassIdentifier : CLASSTYPE_DainaClassIdentifier {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_content = null;
   static OBJECT TMETHOD_isFirstToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassIdentifier self = cast(CLASSTYPE_DainaClassIdentifier)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_isIdentifier = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_token;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_ifIdentifier(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_s = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_isIdentifier;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_isIdentifier;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   static OBJECT TMETHOD_base(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaClassIdentifier newInstance = new CLASSIMPL_DainaClassIdentifier(); return newInstance.CMETHOD_base(newInstance, parameters); }
   OBJECT CMETHOD_base(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassIdentifier self = cast(CLASSTYPE_DainaClassIdentifier)caller;
      IOBJECT_content = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")]);
      return caller;
   }
   override OBJECT IMETHOD_content(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassIdentifier self = cast(CLASSTYPE_DainaClassIdentifier)caller;
      return IOBJECT_content;
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassIdentifier self = cast(CLASSTYPE_DainaClassIdentifier)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_identifierToken = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_identifierToken;
         return (cast(CLASSTYPE_Token)instance).IMETHOD_ifIdentifier(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_s = parameters.length > 0 ? parameters[0] : null;
         IOBJECT_content = LOBJECT_s;
         return caller;
      } })]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return caller;
   }
}

/* *** CLASS: DainaObjectDeclaration *** */
interface CLASSTYPE_DainaObjectDeclaration : OBJECT, LAMBDA {
   OBJECT IMETHOD_type(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_identifier(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaObjectDeclaration : CLASSTYPE_DainaObjectDeclaration {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_type = null;
   private OBJECT IOBJECT_identifier = null;
   static OBJECT TMETHOD_isFirstToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaObjectDeclaration self = cast(CLASSTYPE_DainaObjectDeclaration)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[LOBJECT_token]), CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[LOBJECT_token])]);
   }
   override OBJECT IMETHOD_type(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaObjectDeclaration self = cast(CLASSTYPE_DainaObjectDeclaration)caller;
      return IOBJECT_type;
   }
   override OBJECT IMETHOD_identifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaObjectDeclaration self = cast(CLASSTYPE_DainaObjectDeclaration)caller;
      return IOBJECT_identifier;
   }
   static OBJECT TMETHOD_base(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaObjectDeclaration newInstance = new CLASSIMPL_DainaObjectDeclaration(); return newInstance.CMETHOD_base(newInstance, parameters); }
   OBJECT CMETHOD_base(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaObjectDeclaration self = cast(CLASSTYPE_DainaObjectDeclaration)caller;
      IOBJECT_type = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
      IOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
      return caller;
   }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaObjectDeclaration newInstance = new CLASSIMPL_DainaObjectDeclaration(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaObjectDeclaration self = cast(CLASSTYPE_DainaObjectDeclaration)caller;
      OBJECT LOBJECT_type = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_identifier = parameters.length > 1 ? parameters[1] : null;
      IOBJECT_type = LOBJECT_type;
      IOBJECT_identifier = LOBJECT_identifier;
      return caller;
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaObjectDeclaration self = cast(CLASSTYPE_DainaObjectDeclaration)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_identifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_type;
            return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_identifier;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingIdentifierForObjectDeclaration(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } })]);
      return caller;
   }
}

/* *** CLASS: DainaClassMethod *** */
interface CLASSTYPE_DainaClassMethod : OBJECT, LAMBDA {
   OBJECT IMETHOD_isInstanceTypeOrConstructor(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isUnimplementedMethod(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isOverridingMethod(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_unimplementedType(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_methodExpression(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_identifier(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaClassMethod : CLASSTYPE_DainaClassMethod {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_unimplementedMethod = null;
   private OBJECT IOBJECT_identifier = null;
   private OBJECT IOBJECT_methodExpression = null;
   private OBJECT IOBJECT_isInstanceTypeOrConstructor = null;
   private OBJECT IOBJECT_parseExpression = null;
   private OBJECT IOBJECT_isExpressionFirstToken = null;
   private OBJECT IOBJECT_unimplementedType = null;
   private OBJECT IOBJECT_overriding = null;
   override OBJECT IMETHOD_isInstanceTypeOrConstructor(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassMethod self = cast(CLASSTYPE_DainaClassMethod)caller;
      OBJECT LOBJECT_isInstance = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_isType = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_isConstructor = parameters.length > 2 ? parameters[2] : null;
      (cast(LAMBDA)IOBJECT_isInstanceTypeOrConstructor).method(caller, cast(OBJECT[])[LOBJECT_isInstance, LOBJECT_isType, LOBJECT_isConstructor]);
      return caller;
   }
   override OBJECT IMETHOD_isUnimplementedMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassMethod self = cast(CLASSTYPE_DainaClassMethod)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_unimplementedMethod;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_isOverridingMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassMethod self = cast(CLASSTYPE_DainaClassMethod)caller;
      return IOBJECT_overriding;
   }
   override OBJECT IMETHOD_unimplementedType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassMethod self = cast(CLASSTYPE_DainaClassMethod)caller;
      return IOBJECT_unimplementedType;
   }
   override OBJECT IMETHOD_methodExpression(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassMethod self = cast(CLASSTYPE_DainaClassMethod)caller;
      return IOBJECT_methodExpression;
   }
   override OBJECT IMETHOD_identifier(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassMethod self = cast(CLASSTYPE_DainaClassMethod)caller;
      return IOBJECT_identifier;
   }
   static OBJECT TMETHOD_isFirstToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassMethod self = cast(CLASSTYPE_DainaClassMethod)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isVisibilityIndicator(caller, cast(OBJECT[])[LOBJECT_token]), CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_pipe(caller, cast(OBJECT[])[])])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_doubleColon(caller, cast(OBJECT[])[])]), CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_tilde(caller, cast(OBJECT[])[])])])]);
   }
   static OBJECT TMETHOD_base(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaClassMethod newInstance = new CLASSIMPL_DainaClassMethod(); return newInstance.CMETHOD_base(newInstance, parameters); }
   OBJECT CMETHOD_base(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassMethod self = cast(CLASSTYPE_DainaClassMethod)caller;
      OBJECT LOBJECT_getBase = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_parseExpression = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_isExpressionFirstToken = parameters.length > 2 ? parameters[2] : null;
      IOBJECT_isInstanceTypeOrConstructor = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_b = parameters.length > 1 ? parameters[1] : null;
         OBJECT LOBJECT_c = parameters.length > 2 ? parameters[2] : null;
         return caller;
      } });
      IOBJECT_methodExpression = (cast(LAMBDA)LOBJECT_getBase).method(caller, cast(OBJECT[])[]);
      IOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
      IOBJECT_unimplementedMethod = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
      IOBJECT_parseExpression = LOBJECT_parseExpression;
      IOBJECT_isExpressionFirstToken = LOBJECT_isExpressionFirstToken;
      IOBJECT_unimplementedType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
      IOBJECT_overriding = CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClassMethod self = cast(CLASSTYPE_DainaClassMethod)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_isInstanceTypeOrConstructor = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_b = parameters.length > 1 ? parameters[1] : null;
         OBJECT LOBJECT_c = parameters.length > 2 ? parameters[2] : null;
         (cast(LAMBDA)LOBJECT_a).method(caller, cast(OBJECT[])[]);
         return caller;
      } });
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_tilde(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         IOBJECT_isInstanceTypeOrConstructor = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_b = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_c = parameters.length > 2 ? parameters[2] : null;
            (cast(LAMBDA)LOBJECT_c).method(caller, cast(OBJECT[])[]);
            return caller;
         } });
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_doubleColon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            IOBJECT_isInstanceTypeOrConstructor = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_b = parameters.length > 1 ? parameters[1] : null;
               OBJECT LOBJECT_c = parameters.length > 2 ? parameters[2] : null;
               (cast(LAMBDA)LOBJECT_b).method(caller, cast(OBJECT[])[]);
               return caller;
            } });
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_pipe(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         IOBJECT_overriding = CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      (cast(LAMBDA)IOBJECT_isInstanceTypeOrConstructor).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isVisibilityIndicator(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingVisibilityIndicatorForInstanceMethod(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isVisibilityIndicator(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isVisibilityIndicator(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_identifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_unimplementedMethod;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
            OBJECT LOBJECT_typeForUnimplemented = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_unimplementedType;
               return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)IOBJECT_isExpressionFirstToken).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)IOBJECT_parseExpression).method(caller, cast(OBJECT[])[LOBJECT_parser, IOBJECT_methodExpression]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClassMethodExpression(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } })]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingIdentifierForClassMethod(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])])]);
         return caller;
      } })]);
      return caller;
   }
}

/* *** CLASS: DainaCompilerInjection *** */
interface CLASSTYPE_DainaCompilerInjection : OBJECT, LAMBDA {
   OBJECT IMETHOD_identifierString(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_dataSegment(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaCompilerInjection : CLASSTYPE_DainaCompilerInjection {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_identifier = null;
   private OBJECT IOBJECT_dataSegment = null;
   static OBJECT TMETHOD_isFirstToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaCompilerInjection self = cast(CLASSTYPE_DainaCompilerInjection)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_doubleLessThan(caller, cast(OBJECT[])[])]);
   }
   static OBJECT TMETHOD_base(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaCompilerInjection newInstance = new CLASSIMPL_DainaCompilerInjection(); return newInstance.CMETHOD_base(newInstance, parameters); }
   OBJECT CMETHOD_base(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaCompilerInjection self = cast(CLASSTYPE_DainaCompilerInjection)caller;
      IOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
      IOBJECT_dataSegment = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")]);
      return caller;
   }
   override OBJECT IMETHOD_identifierString(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaCompilerInjection self = cast(CLASSTYPE_DainaCompilerInjection)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_identifier;
         return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_dataSegment(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaCompilerInjection self = cast(CLASSTYPE_DainaCompilerInjection)caller;
      return IOBJECT_dataSegment;
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaCompilerInjection self = cast(CLASSTYPE_DainaCompilerInjection)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_identifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isDataSegment(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_token = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            IOBJECT_dataSegment = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_token;
               return (cast(CLASSTYPE_Token)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingDataSegmentForCompilerInjection(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingIdentifierForCompilerInjection(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])])]);
         return caller;
      } })]);
      return caller;
   }
}

/* *** CLASS: DainaExpression *** */
interface CLASSTYPE_DainaExpression : OBJECT, LAMBDA {
   OBJECT IMETHOD_toBase(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_outputType(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_setOutputType(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifInvocation(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifConstructorInvocation(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifInstanceMethodAssignment(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifInstanceObjectAssignment(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifProxyObject(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifCompilerInjection(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifLocalObject(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifInternalInstanceMethod(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifInternalInstanceObject(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifSelfReference(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifMethodSelfReference(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifStatementGroup(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifDataSegment(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifWithPrologueStatement(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifMethodExpression(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifAnonymousClassObject(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifInstanceMethod(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifLocalObjectAssignment(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifTypeMethod(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_copy(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_makeEmptyStatement(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parseStrongBinding(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parseStrongestBinding(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaExpression : CLASSTYPE_DainaExpression {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_outputType = null;
   private OBJECT IOBJECT_ifStatementGroup = null;
   private OBJECT IOBJECT_ifDataSegment = null;
   private OBJECT IOBJECT_ifWithPrologueStatement = null;
   private OBJECT IOBJECT_ifMethodExpression = null;
   private OBJECT IOBJECT_ifAnonymousClassObject = null;
   private OBJECT IOBJECT_ifInstanceMethod = null;
   private OBJECT IOBJECT_ifLocalObjectAssignment = null;
   private OBJECT IOBJECT_ifTypeMethod = null;
   private OBJECT IOBJECT_ifInvocation = null;
   private OBJECT IOBJECT_ifConstructorInvocation = null;
   private OBJECT IOBJECT_ifInstanceMethodAssignment = null;
   private OBJECT IOBJECT_ifInstanceObjectAssignment = null;
   private OBJECT IOBJECT_ifProxyObject = null;
   private OBJECT IOBJECT_ifCompilerInjection = null;
   private OBJECT IOBJECT_ifLocalObject = null;
   private OBJECT IOBJECT_ifInternalInstanceMethod = null;
   private OBJECT IOBJECT_ifInternalInstanceObject = null;
   private OBJECT IOBJECT_ifSelfReference = null;
   private OBJECT IOBJECT_ifMethodSelfReference = null;
   static OBJECT TMETHOD_isFirstToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_backslash(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_fullStop(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_asteriskCaret(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_asteriskArrow(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_caret(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_doubleLessThan(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_roundBracketOpen(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isIdentifier(caller, cast(OBJECT[])[LOBJECT_token]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isParentIdentifier(caller, cast(OBJECT[])[LOBJECT_token]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_squareBracketOpen(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_curlyBracketOpen(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isDataSegment(caller, cast(OBJECT[])[LOBJECT_token]), CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_asterisk(caller, cast(OBJECT[])[])])])])])])])])])])])])])])]);
   }
   static OBJECT TMETHOD_base(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaExpression newInstance = new CLASSIMPL_DainaExpression(); return newInstance.CMETHOD_base(newInstance, parameters); }
   OBJECT CMETHOD_base(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      IOBJECT_ifStatementGroup = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifDataSegment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifWithPrologueStatement = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifMethodExpression = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifAnonymousClassObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInstanceMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifLocalObjectAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifTypeMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_outputType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
      IOBJECT_ifInvocation = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifConstructorInvocation = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInstanceMethodAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInstanceObjectAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifProxyObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifCompilerInjection = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifLocalObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInternalInstanceMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInternalInstanceObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifSelfReference = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifMethodSelfReference = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      return caller;
   }
   override OBJECT IMETHOD_toBase(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      IOBJECT_ifStatementGroup = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifDataSegment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifWithPrologueStatement = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifMethodExpression = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifAnonymousClassObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInstanceMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifLocalObjectAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifTypeMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_outputType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
      IOBJECT_ifInvocation = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifConstructorInvocation = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInstanceMethodAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInstanceObjectAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifProxyObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifCompilerInjection = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifLocalObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInternalInstanceMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifInternalInstanceObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifSelfReference = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      IOBJECT_ifMethodSelfReference = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
         return caller;
      } });
      return caller;
   }
   override OBJECT IMETHOD_outputType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      return IOBJECT_outputType;
   }
   override OBJECT IMETHOD_setOutputType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_outputType = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_outputType = LOBJECT_outputType;
      return caller;
   }
   override OBJECT IMETHOD_ifInvocation(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifInvocation).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifConstructorInvocation(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifConstructorInvocation).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifInstanceMethodAssignment(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifInstanceMethodAssignment).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifInstanceObjectAssignment(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifInstanceObjectAssignment).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifProxyObject(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifProxyObject).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifCompilerInjection(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifCompilerInjection).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifLocalObject(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifLocalObject).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifInternalInstanceMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifInternalInstanceMethod).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifInternalInstanceObject(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifInternalInstanceObject).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifSelfReference(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifSelfReference).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifMethodSelfReference(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifMethodSelfReference).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifStatementGroup(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifStatementGroup).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifDataSegment(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifDataSegment).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifWithPrologueStatement(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifWithPrologueStatement).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifMethodExpression(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifMethodExpression).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifAnonymousClassObject(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifAnonymousClassObject).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifInstanceMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifInstanceMethod).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifLocalObjectAssignment(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifLocalObjectAssignment).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_ifTypeMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)IOBJECT_ifTypeMethod).method(caller, cast(OBJECT[])[LOBJECT_get]);
      return caller;
   }
   override OBJECT IMETHOD_copy(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_other = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_ifStatementGroup = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifStatementGroup(instance, parameters);
      } });
      IOBJECT_ifDataSegment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifDataSegment(instance, parameters);
      } });
      IOBJECT_ifWithPrologueStatement = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifWithPrologueStatement(instance, parameters);
      } });
      IOBJECT_ifMethodExpression = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifMethodExpression(instance, parameters);
      } });
      IOBJECT_ifAnonymousClassObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifAnonymousClassObject(instance, parameters);
      } });
      IOBJECT_ifInstanceMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInstanceMethod(instance, parameters);
      } });
      IOBJECT_ifLocalObjectAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifLocalObjectAssignment(instance, parameters);
      } });
      IOBJECT_ifTypeMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifTypeMethod(instance, parameters);
      } });
      IOBJECT_outputType = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_outputType(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      IOBJECT_ifInvocation = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInvocation(instance, parameters);
      } });
      IOBJECT_ifConstructorInvocation = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifConstructorInvocation(instance, parameters);
      } });
      IOBJECT_ifInstanceMethodAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInstanceMethodAssignment(instance, parameters);
      } });
      IOBJECT_ifInstanceObjectAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInstanceObjectAssignment(instance, parameters);
      } });
      IOBJECT_ifProxyObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifProxyObject(instance, parameters);
      } });
      IOBJECT_ifCompilerInjection = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifCompilerInjection(instance, parameters);
      } });
      IOBJECT_ifLocalObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifLocalObject(instance, parameters);
      } });
      IOBJECT_ifInternalInstanceMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInternalInstanceMethod(instance, parameters);
      } });
      IOBJECT_ifInternalInstanceObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInternalInstanceObject(instance, parameters);
      } });
      IOBJECT_ifSelfReference = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifSelfReference(instance, parameters);
      } });
      IOBJECT_ifMethodSelfReference = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_other;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifMethodSelfReference(instance, parameters);
      } });
      return caller;
   }
   override OBJECT IMETHOD_makeEmptyStatement(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      IOBJECT_ifStatementGroup = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[])]);
         return caller;
      } });
      return caller;
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_left = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_left;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parseStrongBinding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_exclamationMark(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_right = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_right;
               return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            IOBJECT_ifWithPrologueStatement = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_left, LOBJECT_right]);
               return caller;
            } });
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingPrologueStatement(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_copy(self, cast(OBJECT[])[LOBJECT_left]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_parseStrongBinding(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_left = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_left;
         return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parseStrongestBinding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_right = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_right;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            IOBJECT_ifInstanceMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_left, LOBJECT_right]);
               return caller;
            } });
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingInstanceMethodIdentifier(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_copy(self, cast(OBJECT[])[LOBJECT_left]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_parseStrongestBinding(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaExpression self = cast(CLASSTYPE_DainaExpression)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_token1 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      OBJECT LOBJECT_token2 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_peekAtNextToken(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isDataSegment(caller, cast(OBJECT[])[LOBJECT_token1]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         IOBJECT_ifDataSegment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_token1;
               return (cast(CLASSTYPE_Token)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            return caller;
         } });
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_asterisk(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_parameters = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_body = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_output = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
         IOBJECT_ifMethodExpression = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_parameters, LOBJECT_body, (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_output;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            return caller;
         } });
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketOpen(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaObjectDeclaration.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_parameter = CLASSIMPL_DainaObjectDeclaration.TMETHOD_base(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parameter;
                     return (cast(CLASSTYPE_DainaObjectDeclaration)instance).IMETHOD_parse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parameters;
                     return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parameter]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingMethodInput(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_comma(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } }), LOBJECT_stop]);
               return caller;
            } })]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForMethodInputs(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_body;
               return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parseStrongBinding(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrow(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_and(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), CLASSIMPL_Boolean.TMETHOD_not(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_peekAtNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])])])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_outputType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_outputType;
                     return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                  IOBJECT_outputType = LOBJECT_outputType;
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_body;
                        return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parseStrongBinding(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingMethodBody(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])])]);
                     return caller;
                  } })]);
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrow(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingMethodOutput(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])])]);
                     return caller;
                  } })]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_body;
                     return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_makeEmptyStatement(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  return caller;
               } })]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_outputExpression = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_outputExpression;
                     return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parseStrongBinding(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_output;
                     return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_outputExpression])]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingMethodOutput(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_body;
                  return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_makeEmptyStatement(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               return caller;
            } })]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_curlyBracketOpen(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_statements = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
         IOBJECT_ifStatementGroup = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_statements]);
            return caller;
         } });
         CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_statement = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_statement;
                  return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_statements;
                  return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_statement]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_semicolon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } }), LOBJECT_stop]);
            return caller;
         } })]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_curlyBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForStatementGroup(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_and(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_squareBracketOpen(caller, cast(OBJECT[])[])]), CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token2, CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_parents = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_constructor = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_classMethods = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
         IOBJECT_ifAnonymousClassObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_parents, LOBJECT_constructor, LOBJECT_classMethods]);
            return caller;
         } });
         CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_parent = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parent;
                  return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parents;
                  return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parent]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } }), LOBJECT_stop]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingParentTypeForAnonymousClassObject(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
               return caller;
            } })]);
            return caller;
         } })]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_squareBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_curlyBracketOpen(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_constructorStatement = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_constructorStatement;
                        return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_constructor;
                        return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_constructorStatement]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     return caller;
                  } })]);
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_semicolon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                  } }), LOBJECT_stop]);
                  return caller;
               } })]);
               CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaClassMethod.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_classMethod = CLASSIMPL_DainaClassMethod.TMETHOD_base(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        return CLASSIMPL_DainaExpression.TMETHOD_base(caller, parameters);
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
                        OBJECT LOBJECT_e = parameters.length > 1 ? parameters[1] : null;
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_e;
                           return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        return CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, parameters);
                     } })]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_classMethod;
                        return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_parse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_classMethods;
                        return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_classMethod]);
                     return caller;
                  } }), LOBJECT_stop]);
                  return caller;
               } })]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_curlyBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForAnonymousClassBody(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingAnonymousClassBody(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingSquareBracketAfterAnonymousClassHeader(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_and(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[LOBJECT_token1]), CLASSIMPL_Boolean.TMETHOD_not(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token2, CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])])])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_type = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_type;
            return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketOpen(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_expr = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_expr;
                  return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
               self.IMETHOD_copy(self, cast(OBJECT[])[LOBJECT_expr]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForCastExpression(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingExpressionToBeCast(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_identifier;
                     return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                  IOBJECT_ifTypeMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
                     (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_type, LOBJECT_identifier]);
                     return caller;
                  } });
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingIdentifierForTypeMethod(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_identifier;
                     return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                  OBJECT LOBJECT_localDeclaration = CLASSIMPL_DainaObjectDeclaration.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_type, LOBJECT_identifier]);
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_equalsSign(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]);
                     CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_expr = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_expr;
                           return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                        IOBJECT_ifLocalObjectAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
                           (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_localDeclaration, LOBJECT_expr]);
                           return caller;
                        } });
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingExpressionToAssignLocalDeclaration(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])])]);
                        return caller;
                     } })]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingEqualsToAssignLocalDeclaration(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])])]);
                     return caller;
                  } })]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_unexpectedTokenAfterType(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_identifier;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_equalsSign(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_expr = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_expr;
                     return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                  IOBJECT_ifInstanceMethodAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
                     (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_identifier, LOBJECT_expr]);
                     return caller;
                  } });
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingExpressionToAssignInstanceMethod(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               IOBJECT_ifInternalInstanceMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
                  (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]), LOBJECT_identifier]);
                  return caller;
               } });
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingInstanceMethodIdentifier(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_fullStop(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_identifier;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_equalsSign(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_expr = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_expr;
                     return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                  IOBJECT_ifInstanceObjectAssignment = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
                     (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_identifier, LOBJECT_expr]);
                     return caller;
                  } });
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingExpressionToAssignInstanceObject(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               IOBJECT_ifInternalInstanceObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
                  (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_identifier]);
                  return caller;
               } });
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingInstanceObjectIdentifier(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isParentIdentifier(caller, cast(OBJECT[])[LOBJECT_token1]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_parentNum = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_token1;
            return (cast(CLASSTYPE_Token)instance).IMETHOD_secondId(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_identifier;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            IOBJECT_ifInternalInstanceMethod = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_parentNum, LOBJECT_identifier]);
               return caller;
            } });
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingInstanceObjectIdentifier(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_backslash(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_parseParameterList = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_paramList = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
            CLASSIMPL_Loops.TMETHOD_while(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_expr = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_expr;
                  return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_paramList;
                  return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_expr]);
               return caller;
            } })]);
            return LOBJECT_paramList;
         } });
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_peekAtNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_tilde(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_idToken = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            OBJECT LOBJECT_parentNum = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isParentIdentifier(caller, cast(OBJECT[])[LOBJECT_idToken]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentNum;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_idToken;
                  return (cast(CLASSTYPE_Token)instance).IMETHOD_secondId(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_idToken, CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parentNum;
                     return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])])]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_unexpectedTokenBeforeTilde(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } })]);
            OBJECT LOBJECT_m = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parentNum;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_m;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_parentNumber = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               OBJECT LOBJECT_isPointerConstructor = CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrowBracketClose(caller, cast(OBJECT[])[])]);
               OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[LOBJECT_isPointerConstructor, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_identifier;
                        return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingConstructorIdentifier(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])])]);
                     return caller;
                  } })]);
                  return caller;
               } })]);
               OBJECT LOBJECT_paramList = (cast(LAMBDA)LOBJECT_parseParameterList).method(caller, cast(OBJECT[])[]);
               IOBJECT_ifConstructorInvocation = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
                  (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_parentNumber, LOBJECT_identifier, LOBJECT_isPointerConstructor, LOBJECT_paramList]);
                  return caller;
               } });
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_methodExpr = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_methodExpr;
                  return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
               OBJECT LOBJECT_paramList = (cast(LAMBDA)LOBJECT_parseParameterList).method(caller, cast(OBJECT[])[]);
               IOBJECT_ifInvocation = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
                  (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_methodExpr, LOBJECT_paramList]);
                  return caller;
               } });
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingMethodToInvoke(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } })]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_asteriskArrow(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_expr = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_expr;
               return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            IOBJECT_ifProxyObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_expr]);
               return caller;
            } });
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingProxyObject(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaCompilerInjection.TMETHOD_isFirstToken(caller, cast(OBJECT[])[LOBJECT_token1]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_inj = CLASSIMPL_DainaCompilerInjection.TMETHOD_base(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_inj;
            return (cast(CLASSTYPE_DainaCompilerInjection)instance).IMETHOD_parse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
         IOBJECT_ifCompilerInjection = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_inj]);
            return caller;
         } });
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_roundBracketOpen(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_expr = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_expr;
               return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            self.IMETHOD_copy(self, cast(OBJECT[])[LOBJECT_expr]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_roundBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForExpression(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingExpression(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[LOBJECT_token1]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_identifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
         IOBJECT_ifLocalObject = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_identifier]);
            return caller;
         } });
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_caret(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         IOBJECT_ifSelfReference = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[]);
            return caller;
         } });
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token1, CLASSIMPL_Token.TMETHOD_asteriskCaret(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         IOBJECT_ifMethodSelfReference = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[]);
            return caller;
         } });
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return caller;
   }
}

/* *** CLASS: DainaClass *** */
interface CLASSTYPE_DainaClass : OBJECT, LAMBDA {
   OBJECT IMETHOD_isEntryPointOrRegularClass(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaClass : CLASSTYPE_DainaClass {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_isEntryPointClass = null;
   private OBJECT IOBJECT_dependancyStructure = null;
   private OBJECT IOBJECT_entryPointMethod = null;
   private OBJECT IOBJECT_className = null;
   private OBJECT IOBJECT_genericDeclarationList = null;
   private OBJECT IOBJECT_inheritedParentTypes = null;
   private OBJECT IOBJECT_instanceObjects = null;
   private OBJECT IOBJECT_classMethods = null;
   private OBJECT IOBJECT_compilerInjections = null;
   static OBJECT TMETHOD_parseClasses(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClass self = cast(CLASSTYPE_DainaClass)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_classes = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaClass.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_class = CLASSIMPL_DainaClass.TMETHOD_base(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_class;
               return (cast(CLASSTYPE_DainaClass)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_classes;
               return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_class]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_EOF(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClassAtTopLevel(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } })]);
            (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
            return caller;
         } })]);
         return caller;
      } })]);
      return LOBJECT_classes;
   }
   override OBJECT IMETHOD_isEntryPointOrRegularClass(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClass self = cast(CLASSTYPE_DainaClass)caller;
      OBJECT LOBJECT_getEntryPoint = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_getRegularClass = parameters.length > 1 ? parameters[1] : null;
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_isEntryPointClass;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)LOBJECT_getEntryPoint).method(caller, cast(OBJECT[])[IOBJECT_dependancyStructure, IOBJECT_entryPointMethod]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)LOBJECT_getRegularClass).method(caller, cast(OBJECT[])[IOBJECT_className, IOBJECT_inheritedParentTypes, IOBJECT_instanceObjects, IOBJECT_classMethods, IOBJECT_compilerInjections]);
         return caller;
      } })]);
      return caller;
   }
   static OBJECT TMETHOD_isFirstToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClass self = cast(CLASSTYPE_DainaClass)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_squareBracketOpen(caller, cast(OBJECT[])[])]);
   }
   static OBJECT TMETHOD_base(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaClass newInstance = new CLASSIMPL_DainaClass(); return newInstance.CMETHOD_base(newInstance, parameters); }
   OBJECT CMETHOD_base(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClass self = cast(CLASSTYPE_DainaClass)caller;
      IOBJECT_isEntryPointClass = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
      IOBJECT_dependancyStructure = CLASSIMPL_DainaDependancyStructure.TMETHOD_base(caller, cast(OBJECT[])[]);
      IOBJECT_entryPointMethod = CLASSIMPL_DainaExpression.TMETHOD_base(caller, cast(OBJECT[])[]);
      IOBJECT_className = CLASSIMPL_DainaClassIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
      IOBJECT_genericDeclarationList = CLASSIMPL_DainaGenericDeclarationList.TMETHOD_base(caller, cast(OBJECT[])[]);
      IOBJECT_inheritedParentTypes = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_instanceObjects = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_classMethods = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_compilerInjections = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaClass self = cast(CLASSTYPE_DainaClass)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_squareBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_isEntryPointClass;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_dependancyStructure;
            return (cast(CLASSTYPE_DainaDependancyStructure)instance).IMETHOD_parse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_curlyBracketOpen(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_entryPointMethod;
                  return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_curlyBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForClassBody(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingEntryPointMethod(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingBodyOfClass(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaClassIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_className;
               return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_genericDeclarationList;
               return (cast(CLASSTYPE_DainaGenericDeclarationList)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_parentType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parentType;
                        return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = IOBJECT_inheritedParentTypes;
                        return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_parentType]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingParentType(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])])]);
                     (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
                     return caller;
                  } })]);
                  return caller;
               } }), LOBJECT_stop]);
               return caller;
            } })]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_squareBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_dependancyStructure;
                  return (cast(CLASSTYPE_DainaDependancyStructure)instance).IMETHOD_parse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
               CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaObjectDeclaration.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_instanceObject = CLASSIMPL_DainaObjectDeclaration.TMETHOD_base(caller, cast(OBJECT[])[]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_instanceObject;
                        return (cast(CLASSTYPE_DainaObjectDeclaration)instance).IMETHOD_parse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = IOBJECT_instanceObjects;
                        return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_instanceObject]);
                     return caller;
                  } }), LOBJECT_stop]);
                  return caller;
               } })]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_curlyBracketOpen(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
                     CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaClassMethod.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_classMethod = CLASSIMPL_DainaClassMethod.TMETHOD_base(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           return CLASSIMPL_DainaExpression.TMETHOD_base(caller, parameters);
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
                           OBJECT LOBJECT_e = parameters.length > 1 ? parameters[1] : null;
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_e;
                              return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_parse(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                           return caller;
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           return CLASSIMPL_DainaExpression.TMETHOD_isFirstToken(caller, parameters);
                        } })]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_classMethod;
                           return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_parse(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_classMethod;
                           return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_isInstanceTypeOrConstructor(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           return caller;
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           return caller;
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_classType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_classType;
                              return (cast(CLASSTYPE_DainaType)instance).IMETHOD_setAsClassName(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[IOBJECT_className]);
                           OBJECT LOBJECT_methodExpression = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_classMethod;
                              return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_methodExpression(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[]);
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_methodExpression;
                              return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_setOutputType(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[LOBJECT_classType]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = IOBJECT_classMethods;
                           return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[LOBJECT_classMethod]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaCompilerInjection.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_compilerInjection = CLASSIMPL_DainaCompilerInjection.TMETHOD_base(caller, cast(OBJECT[])[]);
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_compilerInjection;
                              return (cast(CLASSTYPE_DainaCompilerInjection)instance).IMETHOD_parse(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = IOBJECT_compilerInjections;
                              return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[LOBJECT_compilerInjection]);
                           return caller;
                        } }), LOBJECT_stop]);
                        return caller;
                     } })]);
                     return caller;
                  } })]);
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_curlyBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForClassBody(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])])]);
                     return caller;
                  } })]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingBodyOfClass(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingSquareBracketAfterClassHeader(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClassName(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } })]);
      return caller;
   }
}

/* *** CLASS: DLangSynthesizer *** */
interface CLASSTYPE_DLangSynthesizer : OBJECT, LAMBDA {
   OBJECT IMETHOD_outputNextTemporaryVariableName(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_output(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_outputTabbed(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_incrementTab(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_decrementTab(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_iterateUnoverridenInstanceMethods(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_iterateUnoverridenInstanceMethodsAnon(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeClasses(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeClass(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeInstanceObjectDeclaration(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeParentObjectDeclaration(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeParentUnoverridenMethod(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeClassMethodInterface(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeClassMethodImplementation(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_pushScope(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_popScope(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_pushPrologueScope(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_pushPrelogueScopeAfterPrologue(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_popPrelogueAndPrologueScope(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_addLocalObjectToScope(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_getLocalObjectType(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeMethodBodyContent(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeStatement(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeMethodInputs(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_synthesizeInPlaceExpression(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DLangSynthesizer : CLASSTYPE_DLangSynthesizer {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_output = null;
   private OBJECT IOBJECT_tab = null;
   private OBJECT IOBJECT_blockOutput = null;
   private OBJECT IOBJECT_mappedClasses = null;
   private OBJECT IOBJECT_mappedClassMethods = null;
   private OBJECT IOBJECT_selfClassName = null;
   private OBJECT IOBJECT_selfInstanceObjects = null;
   private OBJECT IOBJECT_temporaryNumber = null;
   private OBJECT IOBJECT_synthesizedExpressionType = null;
   private OBJECT IOBJECT_localObjectScope = null;
   static OBJECT TMETHOD_to(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DLangSynthesizer newInstance = new CLASSIMPL_DLangSynthesizer(); return newInstance.CMETHOD_to(newInstance, parameters); }
   OBJECT CMETHOD_to(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_output = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_tab = CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]);
      IOBJECT_output = LOBJECT_output;
      IOBJECT_mappedClasses = CLASSIMPL_Mapping.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_mappedClassMethods = CLASSIMPL_Mapping.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_temporaryNumber = CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]);
      IOBJECT_selfClassName = CLASSIMPL_DainaClassIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
      IOBJECT_synthesizedExpressionType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
      IOBJECT_selfInstanceObjects = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_localObjectScope = CLASSIMPL_Mapping.TMETHOD_empty(caller, cast(OBJECT[])[]);
      IOBJECT_blockOutput = CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_outputNextTemporaryVariableName(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      IOBJECT_temporaryNumber = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_temporaryNumber;
         return (cast(CLASSTYPE_Integer)instance).IMETHOD_adding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("temp")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[IOBJECT_temporaryNumber])]);
      return caller;
   }
   override OBJECT IMETHOD_output(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_string = parameters.length > 0 ? parameters[0] : null;
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[IOBJECT_blockOutput, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)IOBJECT_output).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_string;
            return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_outputTabbed(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_string = parameters.length > 0 ? parameters[0] : null;
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[IOBJECT_blockOutput, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         CLASSIMPL_Loops.TMETHOD_iterate(caller, cast(OBJECT[])[((){
            CLASSTYPE_Sequence PARENT_1 = new CLASSIMPL_Sequence();
            void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_Sequence)parent; }
            OBJECT caller;
            OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_Sequence {
               override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
               override OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters) {
                  CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
                  return CLASSIMPL_Natural.TMETHOD_magnitudeOf(caller, cast(OBJECT[])[IOBJECT_tab]);
               }
               override OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters) {
                  CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
                  OBJECT LOBJECT_i = parameters.length > 0 ? parameters[0] : null;
                  return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_i]);
               }
            };
            caller = anonymousClassObject;
            CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
            return anonymousClassObject;
         })(), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_tab = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("   ")]);
            (cast(LAMBDA)IOBJECT_output).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_tab;
               return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            return caller;
         } })]);
         (cast(LAMBDA)IOBJECT_output).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_string;
            return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_incrementTab(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      IOBJECT_tab = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_tab;
         return (cast(CLASSTYPE_Integer)instance).IMETHOD_adding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
      return caller;
   }
   override OBJECT IMETHOD_decrementTab(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      IOBJECT_tab = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_tab;
         return (cast(CLASSTYPE_Integer)instance).IMETHOD_subtracting(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
      return caller;
   }
   override OBJECT IMETHOD_iterateUnoverridenInstanceMethods(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_class = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_get = parameters.length > 1 ? parameters[1] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_class;
         return (cast(CLASSTYPE_DainaClass)instance).IMETHOD_isEntryPointOrRegularClass(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_dependancyStructure = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_entryPointMethod = parameters.length > 1 ? parameters[1] : null;
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_className = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_inheritedParentTypes = parameters.length > 1 ? parameters[1] : null;
         OBJECT LOBJECT_instanceObjects = parameters.length > 2 ? parameters[2] : null;
         OBJECT LOBJECT_classMethods = parameters.length > 3 ? parameters[3] : null;
         OBJECT LOBJECT_compilerInjections = parameters.length > 4 ? parameters[4] : null;
         OBJECT LOBJECT_getIfNotOverriden = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_parentNumber = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_parentMethod = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_parentMethodIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parentMethod;
               return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_identifier(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_mappedClassMethods;
               return (cast(CLASSTYPE_Mapping)instance).IMETHOD_retriveMappedValueWithKey(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_className;
               return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_ownClassMethods = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_ifOverriden = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_ownClassMethods;
                  return (cast(CLASSTYPE_Mapping)instance).IMETHOD_maybeRetriveMappedValueWithKey(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentMethodIdentifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_ifOverriden;
                  return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_parentNumber, LOBJECT_parentMethod]);
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } });
         {
            OBJECT LOBJECT_varParentNumber = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
            CLASSIMPL_Loops.TMETHOD_iterate(caller, cast(OBJECT[])[LOBJECT_inheritedParentTypes, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT__ = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_parentType = parameters.length > 1 ? parameters[1] : null;
               OBJECT LOBJECT_parentNumber = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_varParentNumber;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_varParentNumber;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentNumber;
                  return (cast(CLASSTYPE_Integer)instance).IMETHOD_adding(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentType;
                  return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_parentTypeIdentifier = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
                  OBJECT LOBJECT_parentID = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parentTypeIdentifier;
                     return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = IOBJECT_mappedClasses;
                     return (cast(CLASSTYPE_Mapping)instance).IMETHOD_retriveMappedValueWithKey(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parentID, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_parentClass = parameters.length > 0 ? parameters[0] : null;
                     self.IMETHOD_iterateUnoverridenInstanceMethods(self, cast(OBJECT[])[LOBJECT_parentClass, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_i = parameters.length > 0 ? parameters[0] : null;
                        OBJECT LOBJECT_c = parameters.length > 1 ? parameters[1] : null;
                        (cast(LAMBDA)LOBJECT_getIfNotOverriden).method(caller, cast(OBJECT[])[LOBJECT_parentNumber, LOBJECT_c]);
                        return caller;
                     } })]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parentClass;
                        return (cast(CLASSTYPE_DainaClass)instance).IMETHOD_isEntryPointOrRegularClass(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_dependancyStructure = parameters.length > 0 ? parameters[0] : null;
                        OBJECT LOBJECT_entryPointMethod = parameters.length > 1 ? parameters[1] : null;
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_a1 = parameters.length > 0 ? parameters[0] : null;
                        OBJECT LOBJECT_a2 = parameters.length > 1 ? parameters[1] : null;
                        OBJECT LOBJECT_a3 = parameters.length > 2 ? parameters[2] : null;
                        OBJECT LOBJECT_parentClassMethods = parameters.length > 3 ? parameters[3] : null;
                        OBJECT LOBJECT_a5 = parameters.length > 4 ? parameters[4] : null;
                        CLASSIMPL_Loops.TMETHOD_iterate(caller, cast(OBJECT[])[LOBJECT_parentClassMethods, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT__ = parameters.length > 0 ? parameters[0] : null;
                           OBJECT LOBJECT_parentClassMethod = parameters.length > 1 ? parameters[1] : null;
                           (cast(LAMBDA)LOBJECT_getIfNotOverriden).method(caller, cast(OBJECT[])[LOBJECT_parentNumber, LOBJECT_parentClassMethod]);
                           return caller;
                        } })]);
                        return caller;
                     } })]);
                     return caller;
                  } })]);
                  return caller;
               } })]);
               return caller;
            } })]);
         }
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_iterateUnoverridenInstanceMethodsAnon(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_classMethods = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_inheritedParentTypes = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_get = parameters.length > 2 ? parameters[2] : null;
      OBJECT LOBJECT_ownClassMethods = CLASSIMPL_Mapping.TMETHOD_empty(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classMethods;
         return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_classMethod = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_classMethodIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethod;
            return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_identifier(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_ownClassMethods;
            return (cast(CLASSTYPE_Mapping)instance).IMETHOD_mapKeyToValue(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethodIdentifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), LOBJECT_classMethod]);
         return caller;
      } })]);
      OBJECT LOBJECT_getIfNotOverriden = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_parentNumber = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_parentMethod = parameters.length > 1 ? parameters[1] : null;
         OBJECT LOBJECT_parentMethodIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parentMethod;
            return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_identifier(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_ifOverriden = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_ownClassMethods;
            return (cast(CLASSTYPE_Mapping)instance).IMETHOD_maybeRetriveMappedValueWithKey(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parentMethodIdentifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_ifOverriden;
            return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)LOBJECT_get).method(caller, cast(OBJECT[])[LOBJECT_parentNumber, LOBJECT_parentMethod]);
            return caller;
         } })]);
         return caller;
      } });
      {
         OBJECT LOBJECT_varParentNumber = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_inheritedParentTypes;
            return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_parentType = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_parentNumber = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_varParentNumber;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_varParentNumber;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parentNumber;
               return (cast(CLASSTYPE_Integer)instance).IMETHOD_adding(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parentType;
               return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_parentTypeIdentifier = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
               OBJECT LOBJECT_parentID = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentTypeIdentifier;
                  return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_mappedClasses;
                  return (cast(CLASSTYPE_Mapping)instance).IMETHOD_retriveMappedValueWithKey(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parentID, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_parentClass = parameters.length > 0 ? parameters[0] : null;
                  self.IMETHOD_iterateUnoverridenInstanceMethods(self, cast(OBJECT[])[LOBJECT_parentClass, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_i = parameters.length > 0 ? parameters[0] : null;
                     OBJECT LOBJECT_c = parameters.length > 1 ? parameters[1] : null;
                     (cast(LAMBDA)LOBJECT_getIfNotOverriden).method(caller, cast(OBJECT[])[LOBJECT_parentNumber, LOBJECT_c]);
                     return caller;
                  } })]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parentClass;
                     return (cast(CLASSTYPE_DainaClass)instance).IMETHOD_isEntryPointOrRegularClass(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_dependancyStructure = parameters.length > 0 ? parameters[0] : null;
                     OBJECT LOBJECT_entryPointMethod = parameters.length > 1 ? parameters[1] : null;
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_a1 = parameters.length > 0 ? parameters[0] : null;
                     OBJECT LOBJECT_a2 = parameters.length > 1 ? parameters[1] : null;
                     OBJECT LOBJECT_a3 = parameters.length > 2 ? parameters[2] : null;
                     OBJECT LOBJECT_parentClassMethods = parameters.length > 3 ? parameters[3] : null;
                     OBJECT LOBJECT_a5 = parameters.length > 4 ? parameters[4] : null;
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parentClassMethods;
                        return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_parentClassMethod = parameters.length > 0 ? parameters[0] : null;
                        (cast(LAMBDA)LOBJECT_getIfNotOverriden).method(caller, cast(OBJECT[])[LOBJECT_parentNumber, LOBJECT_parentClassMethod]);
                        return caller;
                     } })]);
                     return caller;
                  } })]);
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } })]);
      }
      return caller;
   }
   override OBJECT IMETHOD_synthesizeClasses(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_classes = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classes;
         return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_class = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_class;
            return (cast(CLASSTYPE_DainaClass)instance).IMETHOD_isEntryPointOrRegularClass(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_dependancyStructure = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_entryPointMethod = parameters.length > 1 ? parameters[1] : null;
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_className = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_inheritedParentTypes = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_instanceObjects = parameters.length > 2 ? parameters[2] : null;
            OBJECT LOBJECT_classMethods = parameters.length > 3 ? parameters[3] : null;
            OBJECT LOBJECT_compilerInjections = parameters.length > 4 ? parameters[4] : null;
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_mappedClasses;
               return (cast(CLASSTYPE_Mapping)instance).IMETHOD_mapKeyToValue(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_className;
               return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), LOBJECT_class]);
            OBJECT LOBJECT_classMethodsMapping = CLASSIMPL_Mapping.TMETHOD_empty(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_classMethods;
               return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_classMethod = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_classMethodIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_classMethod;
                  return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_identifier(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_classMethodsMapping;
                  return (cast(CLASSTYPE_Mapping)instance).IMETHOD_mapKeyToValue(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_classMethodIdentifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), LOBJECT_classMethod]);
               return caller;
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_mappedClassMethods;
               return (cast(CLASSTYPE_Mapping)instance).IMETHOD_mapKeyToValue(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_className;
               return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), LOBJECT_classMethodsMapping]);
            return caller;
         } })]);
         return caller;
      } })]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("/* *** HEADER *** */\n")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("interface OBJECT {}\n")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("class WRAP(E) : OBJECT { E it; this(E v) {this.it = v;} }\n")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("interface LAMBDA {\n   OBJECT method(OBJECT caller, OBJECT[] parameters);\n}\n\n")])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classes;
         return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = self;
         return self.IMETHOD_synthesizeClass(instance, parameters);
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_synthesizeClass(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_class = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_class;
         return (cast(CLASSTYPE_DainaClass)instance).IMETHOD_isEntryPointOrRegularClass(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_dependancyStructure = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_entryPointMethod = parameters.length > 1 ? parameters[1] : null;
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("/* *** ENTRY POINT CLASS *** */\n")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("void main() { ENTRY_POINT_CLASS.entryPointMethod(null, []); }\n")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("class ENTRY_POINT_CLASS {\n")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("   static OBJECT entryPointMethod(OBJECT caller, OBJECT[] parameters) {\n")])]);
         self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
         self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
         self.IMETHOD_synthesizeMethodBodyContent(self, cast(OBJECT[])[LOBJECT_entryPointMethod]);
         self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
         self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("   }\n}\n\n")])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_className = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_inheritedParentTypes = parameters.length > 1 ? parameters[1] : null;
         OBJECT LOBJECT_instanceObjects = parameters.length > 2 ? parameters[2] : null;
         OBJECT LOBJECT_classMethods = parameters.length > 3 ? parameters[3] : null;
         OBJECT LOBJECT_compilerInjections = parameters.length > 4 ? parameters[4] : null;
         IOBJECT_selfClassName = LOBJECT_className;
         IOBJECT_selfInstanceObjects = LOBJECT_instanceObjects;
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("/* *** CLASS: ")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_className;
            return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" *** */\n")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("interface CLASSTYPE_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_className;
            return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" : OBJECT, LAMBDA")])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_inheritedParentTypes;
            return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_parentType = parameters.length > 0 ? parameters[0] : null;
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(", ")])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parentType;
               return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_parentTypeIdentifier = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
               self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentTypeIdentifier;
                  return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               return caller;
            } })]);
            return caller;
         } })]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" {\n")])]);
         self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethods;
            return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = self;
            return self.IMETHOD_synthesizeClassMethodInterface(instance, parameters);
         } })]);
         self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("}\n")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("class CLASSIMPL_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_className;
            return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" : CLASSTYPE_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_className;
            return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" {\n")])]);
         self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_compilerInjections;
            return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_compilerInjection = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_dlang = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("dlang")]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_dlang;
               return (cast(CLASSTYPE_String)instance).IMETHOD_isEqualTo(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_compilerInjection;
               return (cast(CLASSTYPE_DainaCompilerInjection)instance).IMETHOD_identifierString(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("/* dlang injection start */")])]);
               self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_compilerInjection;
                  return (cast(CLASSTYPE_DainaCompilerInjection)instance).IMETHOD_dataSegment(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("/* dlang injection end */\n")])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("ERROR UNKNOWN INJECTION!!!\n")])]);
               return caller;
            } })]);
            return caller;
         } })]);
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }\n")])]);
         OBJECT LOBJECT_parentNumber = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_inheritedParentTypes;
            return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_parentType = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_curr = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parentNumber;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_synthesizeParentObjectDeclaration(self, cast(OBJECT[])[LOBJECT_curr, LOBJECT_parentType]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parentNumber;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_curr;
               return (cast(CLASSTYPE_Integer)instance).IMETHOD_adding(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_instanceObjects;
            return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = self;
            return self.IMETHOD_synthesizeInstanceObjectDeclaration(instance, parameters);
         } })]);
         self.IMETHOD_iterateUnoverridenInstanceMethods(self, cast(OBJECT[])[LOBJECT_class, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = self;
            return self.IMETHOD_synthesizeParentUnoverridenMethod(instance, parameters);
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethods;
            return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_classMethod = parameters.length > 0 ? parameters[0] : null;
            self.IMETHOD_synthesizeClassMethodImplementation(self, cast(OBJECT[])[LOBJECT_classMethod, CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
            return caller;
         } })]);
         self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("}\n\n")])]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_synthesizeInstanceObjectDeclaration(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_instanceObject = parameters.length > 0 ? parameters[0] : null;
      self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("private OBJECT IOBJECT_")])]);
      OBJECT LOBJECT_instanceObjectIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_instanceObject;
         return (cast(CLASSTYPE_DainaObjectDeclaration)instance).IMETHOD_identifier(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_instanceObjectIdentifier;
         return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" = null;\n")])]);
      return caller;
   }
   override OBJECT IMETHOD_synthesizeParentObjectDeclaration(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_parentNumber = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_parentType = parameters.length > 1 ? parameters[1] : null;
      self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parentType;
         return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_parentTypeIdentifier = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parentTypeIdentifier;
            return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" ")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("PARENT_")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[LOBJECT_parentNumber])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" = new ")])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parentType;
         return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_parentTypeIdentifier = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSIMPL_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parentTypeIdentifier;
            return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("();\n")])]);
      self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("void PARENT_")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[LOBJECT_parentNumber])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("_SET(OBJECT parent) { ")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("PARENT_")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[LOBJECT_parentNumber])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" = cast(")])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parentType;
         return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_parentTypeIdentifier = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parentTypeIdentifier;
            return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(")parent; }\n")])]);
      return caller;
   }
   override OBJECT IMETHOD_synthesizeParentUnoverridenMethod(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_parentNumber = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_unoverridenMethod = parameters.length > 1 ? parameters[1] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_unoverridenMethod;
         return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_isInstanceTypeOrConstructor(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_unoverridenMethodIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_unoverridenMethod;
            return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_identifier(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("override OBJECT IMETHOD_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_unoverridenMethodIdentifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(OBJECT caller, OBJECT[] parameters) { return PARENT_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[LOBJECT_parentNumber])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(".IMETHOD_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_unoverridenMethodIdentifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(caller, parameters); }\n")])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_synthesizeClassMethodInterface(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_classMethod = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_classMethodIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classMethod;
         return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_identifier(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classMethod;
         return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_isInstanceTypeOrConstructor(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT IMETHOD_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethodIdentifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(OBJECT caller, OBJECT[] parameters);\n")])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_synthesizeClassMethodImplementation(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_classMethod = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_anonymousClass = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_classMethodIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classMethod;
         return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_identifier(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classMethod;
         return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_isUnimplementedMethod(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("private LAMBDA ASSIGNIMETHOD_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethodIdentifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" = null;\n")])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classMethod;
         return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_isInstanceTypeOrConstructor(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_anonymousClass;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_overriding = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_classMethod;
               return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_isOverridingMethod(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_overriding;
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("override OBJECT IMETHOD_")])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT IMETHOD_")])]);
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("override OBJECT IMETHOD_")])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("static OBJECT TMETHOD_")])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("static OBJECT TMETHOD_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethodIdentifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(OBJECT caller, OBJECT[] parameters) { ")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSIMPL_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_selfClassName;
            return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" newInstance = new ")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSIMPL_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_selfClassName;
            return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(); return newInstance.CMETHOD_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethodIdentifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(newInstance, parameters); }\n")])]);
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT CMETHOD_")])]);
         return caller;
      } })]);
      self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classMethodIdentifier;
         return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(OBJECT caller, OBJECT[] parameters)")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" {\n")])]);
      self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
      self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_selfClassName;
         return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" self = ")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("cast(")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_selfClassName;
         return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(")caller")])]);
      self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_classMethod;
         return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_isUnimplementedMethod(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return ASSIGNIMETHOD_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethodIdentifier;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(".method(caller, parameters);\n")])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_synthesizeMethodBodyContent(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_classMethod;
            return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_methodExpression(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
      self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("}\n")])]);
      return caller;
   }
   override OBJECT IMETHOD_pushScope(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_parameters = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_paramNumber = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]);
      OBJECT LOBJECT_one = CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parameters;
         return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_parameter = parameters.length > 0 ? parameters[0] : null;
         self.IMETHOD_addLocalObjectToScope(self, cast(OBJECT[])[LOBJECT_parameter]);
         OBJECT LOBJECT_id = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parameter;
            return (cast(CLASSTYPE_DainaObjectDeclaration)instance).IMETHOD_identifier(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT LOBJECT_")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_id;
            return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" = parameters.length > ")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_paramNumber;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" ? parameters[")])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_paramNumber;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])])]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("] : null;\n")])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_paramNumber;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_one;
            return (cast(CLASSTYPE_Integer)instance).IMETHOD_adding(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_paramNumber;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])])]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_popScope(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      return caller;
   }
   override OBJECT IMETHOD_pushPrologueScope(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      return caller;
   }
   override OBJECT IMETHOD_pushPrelogueScopeAfterPrologue(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      return caller;
   }
   override OBJECT IMETHOD_popPrelogueAndPrologueScope(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      return caller;
   }
   override OBJECT IMETHOD_addLocalObjectToScope(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_localObject = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_id = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_localObject;
         return (cast(CLASSTYPE_DainaObjectDeclaration)instance).IMETHOD_identifier(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_localObjectScope;
         return (cast(CLASSTYPE_Mapping)instance).IMETHOD_mapKeyToValue(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_id;
         return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_localObject;
         return (cast(CLASSTYPE_DainaObjectDeclaration)instance).IMETHOD_type(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      return caller;
   }
   override OBJECT IMETHOD_getLocalObjectType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_localObjectIdentifier = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_ret = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_localObjectScope;
         return (cast(CLASSTYPE_Mapping)instance).IMETHOD_retriveMappedValueWithKey(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_localObjectIdentifier;
         return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_ret;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
      } })]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_ret;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_synthesizeMethodBodyContent(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_methodExpression = parameters.length > 0 ? parameters[0] : null;
      CLASSIMPL_O.TMETHOD_selectOrDefault(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_select = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_methodExpression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifMethodExpression(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_inputs = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_body = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_output = parameters.length > 2 ? parameters[2] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_pushScope(self, cast(OBJECT[])[LOBJECT_inputs]);
            self.IMETHOD_synthesizeStatement(self, cast(OBJECT[])[LOBJECT_body, CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_output;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return caller;\n")])]);
               return caller;
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_output;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_outputExpression = parameters.length > 0 ? parameters[0] : null;
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return ")])]);
               self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_outputExpression]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            self.IMETHOD_popScope(self, cast(OBJECT[])[]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return (cast(LAMBDA)")])]);
         self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_methodExpression]);
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(").method(caller, parameters);\n")])]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_synthesizeStatement(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_statement = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_baseStatement = parameters.length > 1 ? parameters[1] : null;
      CLASSIMPL_O.TMETHOD_selectOrDefault(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_select = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_statement;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifStatementGroup(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_statements = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[LOBJECT_baseStatement, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_pushScope(self, cast(OBJECT[])[CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[])]);
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("{\n")])]);
               self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
               return caller;
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_statements;
               return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_subStatement = parameters.length > 0 ? parameters[0] : null;
               self.IMETHOD_synthesizeStatement(self, cast(OBJECT[])[LOBJECT_subStatement, CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
               return caller;
            } })]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[LOBJECT_baseStatement, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("}\n")])]);
               self.IMETHOD_popScope(self, cast(OBJECT[])[]);
               return caller;
            } })]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_statement;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifWithPrologueStatement(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_prelogueStatement = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_prologueStatement = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_pushPrologueScope(self, cast(OBJECT[])[]);
            self.IMETHOD_synthesizeStatement(self, cast(OBJECT[])[LOBJECT_prologueStatement, CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
            self.IMETHOD_pushPrelogueScopeAfterPrologue(self, cast(OBJECT[])[]);
            self.IMETHOD_synthesizeStatement(self, cast(OBJECT[])[LOBJECT_prelogueStatement, LOBJECT_baseStatement]);
            self.IMETHOD_popPrelogueAndPrologueScope(self, cast(OBJECT[])[]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_statement;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifLocalObjectAssignment(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_declaration = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_assginedExpression = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            CLASSIMPL_O.TMETHOD_selectOrDefault(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT__select = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_assginedExpression;
                  return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifCompilerInjection(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_compilerInjection = parameters.length > 0 ? parameters[0] : null;
                  (cast(LAMBDA)LOBJECT__select).method(caller, cast(OBJECT[])[]);
                  OBJECT LOBJECT_dlang = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("dlang")]);
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_dlang;
                     return (cast(CLASSTYPE_String)instance).IMETHOD_isEqualTo(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_compilerInjection;
                     return (cast(CLASSTYPE_DainaCompilerInjection)instance).IMETHOD_identifierString(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("/* dlang injection start */")])]);
                     self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_compilerInjection;
                        return (cast(CLASSTYPE_DainaCompilerInjection)instance).IMETHOD_dataSegment(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]);
                     self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("/* dlang injection end */\n")])]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("ERROR UNKNOWN INJECTION!!!\n")])]);
                     return caller;
                  } })]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_nothing = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")]);
               OBJECT LOBJECT_identifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_declaration;
                  return (cast(CLASSTYPE_DainaObjectDeclaration)instance).IMETHOD_identifier(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")])]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_nothing;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_isEqualTo(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_identifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  self.IMETHOD_addLocalObjectToScope(self, cast(OBJECT[])[LOBJECT_declaration]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT LOBJECT_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_identifier;
                     return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" = ")])]);
                  return caller;
               } })]);
               self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_assginedExpression]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
               return caller;
            } })]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_statement;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInvocation(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_b = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")])]);
            self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_statement]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_statement;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInstanceMethodAssignment(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_identifier = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_assignedExpression = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("ASSIGNIMETHOD_")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_identifier;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" = cast(LAMBDA)")])]);
            self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_assignedExpression]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_statement;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInstanceObjectAssignment(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_identifier = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_assignedExpression = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("IOBJECT_")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_identifier;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" = ")])]);
            self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_assignedExpression]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_statement;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifConstructorInvocation(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_parentNumber = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_identifier = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_isPointerConstructor = parameters.length > 2 ? parameters[2] : null;
            OBJECT LOBJECT_inputs = parameters.length > 3 ? parameters[3] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parentNumber;
               return (cast(CLASSTYPE_Integer)instance).IMETHOD_isEqualTo(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[LOBJECT_isPointerConstructor, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("caller = ")])]);
                  self.IMETHOD_synthesizeMethodInputs(self, cast(OBJECT[])[LOBJECT_inputs]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(cast(")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSIMPL_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = IOBJECT_selfClassName;
                     return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(")")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("self).CMETHOD_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_identifier;
                     return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(this")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(", [")])]);
                  self.IMETHOD_synthesizeMethodInputs(self, cast(OBJECT[])[LOBJECT_inputs]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("]);\n")])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("PARENT_")])]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[LOBJECT_parentNumber])]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[LOBJECT_isPointerConstructor, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("_SET(")])]);
                  self.IMETHOD_synthesizeMethodInputs(self, cast(OBJECT[])[LOBJECT_inputs]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(");\n")])]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(".CMETHOD_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_identifier;
                     return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(PARENT_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[LOBJECT_parentNumber])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(", [")])]);
                  self.IMETHOD_synthesizeMethodInputs(self, cast(OBJECT[])[LOBJECT_inputs]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("]);\n")])]);
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("INTERNAL STATEMENT ERROR!!!\n")])]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_synthesizeMethodInputs(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_inputs = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_seperator = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")])]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_inputs;
         return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_input = parameters.length > 0 ? parameters[0] : null;
         self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_seperator;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_input]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_seperator;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(", ")])]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_synthesizeInPlaceExpression(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DLangSynthesizer self = cast(CLASSTYPE_DLangSynthesizer)caller;
      OBJECT LOBJECT_usedAsInstantMethod = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_expression = parameters.length > 1 ? parameters[1] : null;
      IOBJECT_synthesizedExpressionType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
      CLASSIMPL_O.TMETHOD_selectOrDefault(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_select = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifWithPrologueStatement(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_prelogue = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_prologue = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {\n")])]);
            self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
            self.IMETHOD_synthesizeStatement(self, cast(OBJECT[])[LOBJECT_prologue, CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
            CLASSIMPL_O.TMETHOD_selectOrDefault(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_selectInner = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_prelogue;
                  return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifStatementGroup(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
                  (cast(LAMBDA)LOBJECT_selectInner).method(caller, cast(OBJECT[])[]);
                  self.IMETHOD_synthesizeStatement(self, cast(OBJECT[])[LOBJECT_prelogue, CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
                  self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return caller;\n")])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return ")])]);
               self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_prelogue]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
               return caller;
            } })]);
            self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("} }).method(caller, [])")])]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifLocalObject(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_identifier = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            OBJECT LOBJECT_isVoidIdentifier = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_identifier;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_isVoidIdentifier(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_isVoidIdentifier;
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("new class OBJECT {}")])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("LOBJECT_")])]);
               self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_identifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               return caller;
            } })]);
            IOBJECT_synthesizedExpressionType = self.IMETHOD_getLocalObjectType(self, cast(OBJECT[])[LOBJECT_identifier]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifMethodExpression(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_params = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_body = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_output = parameters.length > 2 ? parameters[2] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {\n")])]);
            self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
            self.IMETHOD_synthesizeMethodBodyContent(self, cast(OBJECT[])[LOBJECT_expression]);
            self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("} })")])]);
            OBJECT LOBJECT_outputType = IOBJECT_synthesizedExpressionType;
            IOBJECT_synthesizedExpressionType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_synthesizedExpressionType;
               return (cast(CLASSTYPE_DainaType)instance).IMETHOD_setAsMethodWithOutputType(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_expression;
               return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_outputType(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInstanceMethod(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_instanceExpression = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_identifier = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            OBJECT LOBJECT_instanceExpressionType = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[IOBJECT_synthesizedExpressionType]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[LOBJECT_usedAsInstantMethod, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(cast(")])]);
               IOBJECT_blockOutput = CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]);
               self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_instanceExpression]);
               IOBJECT_blockOutput = CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_instanceExpressionType;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[IOBJECT_synthesizedExpressionType]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_synthesizedExpressionType;
                  return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_instanceExpressionClassName = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_insta = parameters.length > 1 ? parameters[1] : null;
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_instanceExpressionClassName;
                     return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  return caller;
               } })]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(")")])]);
               self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_instanceExpression]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(").IMETHOD_")])]);
               self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_identifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(caller")])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {\n")])]);
               self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT instance = ")])]);
               self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_instanceExpression]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return (cast(")])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_instanceExpressionType;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[IOBJECT_synthesizedExpressionType]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_synthesizedExpressionType;
                  return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_instanceExpressionClassName = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_insta = parameters.length > 1 ? parameters[1] : null;
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_instanceExpressionClassName;
                     return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  return caller;
               } })]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(")instance).IMETHOD_")])]);
               self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_identifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(instance, parameters);\n")])]);
               self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("} })")])]);
               return caller;
            } })]);
            OBJECT LOBJECT_theinstanceExpressionType = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_instanceExpressionType;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_theinstanceExpressionType;
               return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_instanceExpressionClassName = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_insta = parameters.length > 1 ? parameters[1] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_mappedClassMethods;
                  return (cast(CLASSTYPE_Mapping)instance).IMETHOD_retriveMappedValueWithKey(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_instanceExpressionClassName;
                  return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_instanceExpressionClassMethods = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_mInvokedMethod = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_instanceExpressionClassMethods;
                     return (cast(CLASSTYPE_Mapping)instance).IMETHOD_maybeRetriveMappedValueWithKey(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_identifier;
                     return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_mInvokedMethod;
                     return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_invokedMethod = parameters.length > 0 ? parameters[0] : null;
                     CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_invokedMethod;
                        return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_isUnimplementedMethod(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        IOBJECT_synthesizedExpressionType = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_invokedMethod;
                           return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_unimplementedType(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_methodExpression = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_invokedMethod;
                           return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_methodExpression(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[]);
                        IOBJECT_synthesizedExpressionType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = IOBJECT_synthesizedExpressionType;
                           return (cast(CLASSTYPE_DainaType)instance).IMETHOD_setAsMethodWithOutputType(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_methodExpression;
                           return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_outputType(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])]);
                        return caller;
                     } })]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     return caller;
                  } })]);
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifTypeMethod(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_type = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_identifier = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[LOBJECT_usedAsInstantMethod, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_type;
                  return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_typeIdentifier = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSIMPL_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_typeIdentifier;
                     return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(".")])]);
                  return caller;
               } })]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("TMETHOD_")])]);
               self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_identifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(caller")])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {\n")])]);
               self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return ")])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_type;
                  return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_typeIdentifier = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSIMPL_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_typeIdentifier;
                     return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(".")])]);
                  return caller;
               } })]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("TMETHOD_")])]);
               self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_identifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(caller, parameters);\n")])]);
               self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("} })")])]);
               return caller;
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_type;
               return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_typeIdentifier = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_mappedClassMethods;
                  return (cast(CLASSTYPE_Mapping)instance).IMETHOD_retriveMappedValueWithKey(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_typeIdentifier;
                  return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_typeExpressionClassMethods = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_mInvokedMethod = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_typeExpressionClassMethods;
                     return (cast(CLASSTYPE_Mapping)instance).IMETHOD_maybeRetriveMappedValueWithKey(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_identifier;
                     return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_mInvokedMethod;
                     return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_invokedMethod = parameters.length > 0 ? parameters[0] : null;
                     OBJECT LOBJECT_methodExpression = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_invokedMethod;
                        return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_methodExpression(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]);
                     IOBJECT_synthesizedExpressionType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = IOBJECT_synthesizedExpressionType;
                        return (cast(CLASSTYPE_DainaType)instance).IMETHOD_setAsMethodWithOutputType(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_methodExpression;
                        return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_outputType(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     return caller;
                  } })]);
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInvocation(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_method = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_params = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            OBJECT LOBJECT_isInstantMethod = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_method;
               return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifTypeMethod(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_b = parameters.length > 1 ? parameters[1] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_isInstantMethod;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
               return caller;
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_method;
               return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInternalInstanceMethod(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_a = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_b = parameters.length > 1 ? parameters[1] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_isInstantMethod;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
               return caller;
            } })]);
            OBJECT LOBJECT_invokedExpressionType = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[IOBJECT_synthesizedExpressionType]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_isInstantMethod;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]), LOBJECT_method]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_invokedExpressionType;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[IOBJECT_synthesizedExpressionType]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(", cast(OBJECT[])[")])]);
               self.IMETHOD_synthesizeMethodInputs(self, cast(OBJECT[])[LOBJECT_params]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("])")])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(cast(LAMBDA)")])]);
               self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_method]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_invokedExpressionType;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[IOBJECT_synthesizedExpressionType]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(").method(caller, cast(OBJECT[])[")])]);
               self.IMETHOD_synthesizeMethodInputs(self, cast(OBJECT[])[LOBJECT_params]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("])")])]);
               return caller;
            } })]);
            OBJECT LOBJECT__invokedExpressionType = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_invokedExpressionType;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT__invokedExpressionType;
               return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifMethodInputsAndOutput(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT__ = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_MoutputType = parameters.length > 1 ? parameters[1] : null;
               IOBJECT_synthesizedExpressionType = CLASSIMPL_DainaType.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_MoutputType]);
               return caller;
            } })]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifProxyObject(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_object = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_synthesizeInPlaceExpression(self, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]), LOBJECT_object]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInternalInstanceMethod(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_parentNumber = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_identifier = parameters.length > 1 ? parameters[1] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[LOBJECT_usedAsInstantMethod, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentNumber;
                  return (cast(CLASSTYPE_Integer)instance).IMETHOD_isEqualTo(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("self.IMETHOD_")])]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("PARENT_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[LOBJECT_parentNumber])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(".IMETHOD_")])]);
                  return caller;
               } })]);
               self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_identifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(self")])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {\n")])]);
               self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentNumber;
                  return (cast(CLASSTYPE_Integer)instance).IMETHOD_isEqualTo(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT instance = self;\n")])]);
                  self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return self.IMETHOD_")])]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT instance = PARENT_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[LOBJECT_parentNumber])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
                  self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return PARENT_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_stringFormatOf(caller, cast(OBJECT[])[LOBJECT_parentNumber])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(".IMETHOD_")])]);
                  return caller;
               } })]);
               self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_identifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("(instance, parameters);\n")])]);
               self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
               self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("} })")])]);
               return caller;
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_mappedClassMethods;
               return (cast(CLASSTYPE_Mapping)instance).IMETHOD_retriveMappedValueWithKey(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_selfClassName;
               return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_typeExpressionClassMethods = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_mInvokedMethod = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_typeExpressionClassMethods;
                  return (cast(CLASSTYPE_Mapping)instance).IMETHOD_maybeRetriveMappedValueWithKey(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_identifier;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_mInvokedMethod;
                  return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_invokedMethod = parameters.length > 0 ? parameters[0] : null;
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_invokedMethod;
                     return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_isUnimplementedMethod(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     IOBJECT_synthesizedExpressionType = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_invokedMethod;
                        return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_unimplementedType(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_methodExpression = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_invokedMethod;
                        return (cast(CLASSTYPE_DainaClassMethod)instance).IMETHOD_methodExpression(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]);
                     IOBJECT_synthesizedExpressionType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = IOBJECT_synthesizedExpressionType;
                        return (cast(CLASSTYPE_DainaType)instance).IMETHOD_setAsMethodWithOutputType(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_methodExpression;
                        return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_outputType(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]);
                     return caller;
                  } })]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifInternalInstanceObject(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_instanceObjectIdentifier = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("IOBJECT_")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_instanceObjectIdentifier;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            OBJECT LOBJECT_instanceObjectIdentifierString = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_instanceObjectIdentifier;
               return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_selfInstanceObjects;
               return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_decl = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_thisId = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_decl;
                  return (cast(CLASSTYPE_DainaObjectDeclaration)instance).IMETHOD_identifier(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_instanceObjectIdentifierString;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_isEqualTo(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_thisId;
                  return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  IOBJECT_synthesizedExpressionType = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_decl;
                     return (cast(CLASSTYPE_DainaObjectDeclaration)instance).IMETHOD_type(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifSelfReference(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("caller")])]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifDataSegment(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_dataSegmentContent = parameters.length > 0 ? parameters[0] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("new WRAP!(string)(\"")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[LOBJECT_dataSegmentContent]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("\")")])]);
            return caller;
         } })]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_expression;
            return (cast(CLASSTYPE_DainaExpression)instance).IMETHOD_ifAnonymousClassObject(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_parents = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_constructor = parameters.length > 1 ? parameters[1] : null;
            OBJECT LOBJECT_classMethods = parameters.length > 2 ? parameters[2] : null;
            (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[]);
            OBJECT LOBJECT_originalClassName = IOBJECT_selfClassName;
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("((){\n")])]);
            self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
            OBJECT LOBJECT_parentNumber = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parents;
               return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_parentType = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_curr = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentNumber;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               self.IMETHOD_synthesizeParentObjectDeclaration(self, cast(OBJECT[])[LOBJECT_curr, LOBJECT_parentType]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentNumber;
                  return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_curr;
                  return (cast(CLASSTYPE_Integer)instance).IMETHOD_adding(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentType;
                  return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_parentTypeIdentifier = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_a = parameters.length > 1 ? parameters[1] : null;
                  IOBJECT_selfClassName = LOBJECT_parentTypeIdentifier;
                  return caller;
               } })]);
               return caller;
            } })]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT caller;\n")])]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("OBJECT anonymousClassObject = ")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("new class OBJECT, LAMBDA")])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parents;
               return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_parentType = parameters.length > 0 ? parameters[0] : null;
               self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(", ")])]);
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parentType;
                  return (cast(CLASSTYPE_DainaType)instance).IMETHOD_ifClassNameAndGenericInstantiation(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_parentTypeIdentifier = parameters.length > 0 ? parameters[0] : null;
                  OBJECT LOBJECT_genericInstantiation = parameters.length > 1 ? parameters[1] : null;
                  self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
                  self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parentTypeIdentifier;
                     return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  return caller;
               } })]);
               return caller;
            } })]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" {\n")])]);
            self.IMETHOD_incrementTab(self, cast(OBJECT[])[]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }\n")])]);
            self.IMETHOD_iterateUnoverridenInstanceMethodsAnon(self, cast(OBJECT[])[LOBJECT_classMethods, LOBJECT_parents, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = self;
               return self.IMETHOD_synthesizeParentUnoverridenMethod(instance, parameters);
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_classMethods;
               return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_classMethod = parameters.length > 0 ? parameters[0] : null;
               self.IMETHOD_synthesizeClassMethodImplementation(self, cast(OBJECT[])[LOBJECT_classMethod, CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
               return caller;
            } })]);
            self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("};\n")])]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("caller = anonymousClassObject;\n")])]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_selfClassName;
               return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(" self = ")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("cast(")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("CLASSTYPE_")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_selfClassName;
               return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(")caller")])]);
            self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(";\n")])]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_constructor;
               return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_constructorStatement = parameters.length > 0 ? parameters[0] : null;
               self.IMETHOD_synthesizeStatement(self, cast(OBJECT[])[LOBJECT_constructorStatement, CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
               return caller;
            } })]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("return anonymousClassObject;\n")])]);
            self.IMETHOD_decrementTab(self, cast(OBJECT[])[]);
            self.IMETHOD_outputTabbed(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("})()")])]);
            IOBJECT_selfClassName = LOBJECT_originalClassName;
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         self.IMETHOD_output(self, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("<INTERNAL EXPRESSION ERROR!!!>")])]);
         return caller;
      } })]);
      return caller;
   }
}

/* *** CLASS: Daina *** */
interface CLASSTYPE_Daina : OBJECT, LAMBDA, CLASSTYPE_CommandReader {
   OBJECT IMETHOD_exitReached(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_exit(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parseSourceFile(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_compileToFile(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_invalidCommand(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Daina : CLASSTYPE_Daina {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   CLASSTYPE_CommandReader PARENT_1 = new CLASSIMPL_CommandReader();
   void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_CommandReader)parent; }
   private OBJECT IOBJECT_configuration = null;
   private OBJECT IOBJECT_exitReached = null;
   private OBJECT IOBJECT_parsedClasses = null;
   static OBJECT TMETHOD_run(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Daina self = cast(CLASSTYPE_Daina)caller;
      OBJECT LOBJECT_configuration = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_daina = CLASSIMPL_Daina.TMETHOD_init(caller, cast(OBJECT[])[LOBJECT_configuration]);
      OBJECT LOBJECT_commands = CLASSIMPL_Commands.TMETHOD_from(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_configuration;
         return (cast(CLASSTYPE_Configuration)instance).IMETHOD_commandInput(instance, parameters);
      } })]);
      CLASSIMPL_Loops.TMETHOD_while(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Boolean.TMETHOD_not(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_daina;
            return (cast(CLASSTYPE_Daina)instance).IMETHOD_exitReached(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_commands;
            return (cast(CLASSTYPE_Commands)instance).IMETHOD_readNext(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_daina]);
         return caller;
      } })]);
      return caller;
   }
   static OBJECT TMETHOD_init(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Daina newInstance = new CLASSIMPL_Daina(); return newInstance.CMETHOD_init(newInstance, parameters); }
   OBJECT CMETHOD_init(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Daina self = cast(CLASSTYPE_Daina)caller;
      OBJECT LOBJECT_configuration = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_exitReached = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
      IOBJECT_configuration = LOBJECT_configuration;
      IOBJECT_parsedClasses = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_exitReached(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Daina self = cast(CLASSTYPE_Daina)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_exitReached;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_exit(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Daina self = cast(CLASSTYPE_Daina)caller;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_exitReached;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
      CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Exit\n")])]);
      return caller;
   }
   override OBJECT IMETHOD_parseSourceFile(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Daina self = cast(CLASSTYPE_Daina)caller;
      OBJECT LOBJECT_path = parameters.length > 0 ? parameters[0] : null;
      CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("parse from ")])]);
      CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[LOBJECT_path]);
      CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("...\n")])]);
      OBJECT LOBJECT_maybeSourceInput = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_configuration;
         return (cast(CLASSTYPE_Configuration)instance).IMETHOD_sourceFileInput(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_path]);
      OBJECT LOBJECT_sourceFileSuccess = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_maybeSourceInput;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_sourceInput = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_parser = CLASSIMPL_Parser.TMETHOD_withSourceNameAndInput(caller, cast(OBJECT[])[LOBJECT_path, LOBJECT_sourceInput]);
         OBJECT LOBJECT_parsedClasses = CLASSIMPL_DainaClass.TMETHOD_parseClasses(caller, cast(OBJECT[])[LOBJECT_parser]);
         OBJECT LOBJECT_errors = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_errors(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_parseSuccess = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]);
            return (cast(CLASSTYPE_Integer)instance).IMETHOD_isEqualTo(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_errors;
            return (cast(CLASSTYPE_List)instance).IMETHOD_length(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parseSuccess;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parsedClasses;
               return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_parsedClass = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_parsedClasses;
                  return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_parsedClass]);
               return caller;
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_errors;
               return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_error = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = IOBJECT_configuration;
                  return (cast(CLASSTYPE_Configuration)instance).IMETHOD_outputError(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_error]);
               return caller;
            } })]);
            return caller;
         } })]);
         return CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      } })]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_sourceFileSuccess;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_configuration;
            return (cast(CLASSTYPE_Configuration)instance).IMETHOD_outputError(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_sourceFileNotAccessible(caller, cast(OBJECT[])[LOBJECT_path])]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_compileToFile(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Daina self = cast(CLASSTYPE_Daina)caller;
      OBJECT LOBJECT_path = parameters.length > 0 ? parameters[0] : null;
      CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("compile to ")])]);
      CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[LOBJECT_path]);
      CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("...\n")])]);
      OBJECT LOBJECT_maybeOutputFile = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_configuration;
         return (cast(CLASSTYPE_Configuration)instance).IMETHOD_compilationFileOutput(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_path]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_maybeOutputFile;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Can't output to file.\n")])]);
         return caller;
      } })]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_maybeOutputFile;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_outputFile = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_dlang = CLASSIMPL_DLangSynthesizer.TMETHOD_to(caller, cast(OBJECT[])[LOBJECT_outputFile]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_dlang;
            return (cast(CLASSTYPE_DLangSynthesizer)instance).IMETHOD_synthesizeClasses(instance, parameters);
         } })).method(caller, cast(OBJECT[])[IOBJECT_parsedClasses]);
         CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Done!\n")])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_invalidCommand(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Daina self = cast(CLASSTYPE_Daina)caller;
      CLASSIMPL_Debug.TMETHOD_log(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("Invalid command\n")])]);
      return caller;
   }
}

/* *** CLASS: StandardIO *** */
interface CLASSTYPE_StandardIO : OBJECT, LAMBDA {
}
class CLASSIMPL_StandardIO : CLASSTYPE_StandardIO {
/* dlang injection start */
            import std.stdio;
            import std.bigint;
         /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_stdout(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_StandardIO self = cast(CLASSTYPE_StandardIO)caller;
      OBJECT LOBJECT_data = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
            write(cast(string)((cast(WRAP!(ubyte[]))((cast(CLASSTYPE_Data)LOBJECT_data).IMETHOD_internalData(null, []))).it));
         /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_stdin(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_StandardIO self = cast(CLASSTYPE_StandardIO)caller;
      OBJECT LOBJECT_readedData = CLASSIMPL_Data.TMETHOD_empty(caller, cast(OBJECT[])[]);
/* dlang injection start */
         string rawLine = readln();
         if (rawLine == null) {
            rawLine = "";
         }
         ubyte[] line = cast(ubyte[])(rawLine);
         (cast(CLASSIMPL_Data)LOBJECT_readedData).value = new WRAP!(ubyte[])(line);
      /* dlang injection end */
      return LOBJECT_readedData;
   }
}

/* *** CLASS: File *** */
interface CLASSTYPE_File : OBJECT, LAMBDA {
   OBJECT IMETHOD_exists(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_clearContents(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_appendContents(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_readContents(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_close(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_File : CLASSTYPE_File {
/* dlang injection start */
         import std.stdio;
         import std.file;
         import std.bigint;
         string fileName = null;
         File file;
      /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_atPath(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_File newInstance = new CLASSIMPL_File(); return newInstance.CMETHOD_atPath(newInstance, parameters); }
   OBJECT CMETHOD_atPath(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_File self = cast(CLASSTYPE_File)caller;
      OBJECT LOBJECT_filePath = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_asciiFilePath = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_filePath;
         return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
/* dlang injection start */
         this.fileName = cast(string)((cast(WRAP!(ubyte[]))((cast(CLASSTYPE_Data)LOBJECT_asciiFilePath).IMETHOD_internalData(null, []))).it);
      /* dlang injection end */
      return caller;
   }
   override OBJECT IMETHOD_exists(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_File self = cast(CLASSTYPE_File)caller;
/* dlang injection start */
         bool fileExists = this.fileName.exists && this.fileName.isFile;
         OBJECT LOBJECT_exists = fileExists ? CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]) : CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      /* dlang injection end */
      return LOBJECT_exists;
   }
   override OBJECT IMETHOD_clearContents(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_File self = cast(CLASSTYPE_File)caller;
/* dlang injection start */
         if (this.file.isOpen) {
            this.file.close();
         }
         this.file.open(this.fileName, "wb");
         if (this.file.isOpen) {
            this.file.write("");
         }
      /* dlang injection end */
      return caller;
   }
   override OBJECT IMETHOD_appendContents(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_File self = cast(CLASSTYPE_File)caller;
      OBJECT LOBJECT_toAppend = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         if (!this.file.isOpen) {
            this.file.open(this.fileName, "ab");
         }
         if (this.file.isOpen) {
            this.file.rawWrite((cast(WRAP!(ubyte[]))((cast(CLASSTYPE_Data)LOBJECT_toAppend).IMETHOD_internalData(null, []))).it);
         }
      /* dlang injection end */
      return caller;
   }
   override OBJECT IMETHOD_readContents(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_File self = cast(CLASSTYPE_File)caller;
      OBJECT LOBJECT_chunkSize = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_theChunk = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Data.TMETHOD_empty(caller, cast(OBJECT[])[])]);
/* dlang injection start */
         BigInt chunkSize = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_chunkSize).IMETHOD_internalInteger(null, []))).it;
         if (this.file.isOpen) {
            this.file.close();
         }
         this.file.open(this.fileName, "rb");
         if (this.file.isOpen) {
            foreach (ubyte[] buffer; this.file.byChunk(chunkSize.toLong())) {
      /* dlang injection end */
/* dlang injection start */
               CLASSIMPL_Data LOBJECT_chunk = new CLASSIMPL_Data();
               LOBJECT_chunk.value = new WRAP!(ubyte[])(buffer);
      /* dlang injection end */
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_theChunk;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_chunk]);
/* dlang injection start */
         
            }
            this.file.close();
         }
      /* dlang injection end */
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_theChunk;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_close(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_File self = cast(CLASSTYPE_File)caller;
/* dlang injection start */
         this.file.close();
      /* dlang injection end */
      return caller;
   }
}

/* *** CLASS: Data *** */
interface CLASSTYPE_Data : OBJECT, LAMBDA, CLASSTYPE_Sequence {
   OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_internalData(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Data : CLASSTYPE_Data {
/* dlang injection start */
         import std.bigint;
         import std.format;
         WRAP!(ubyte[]) value;
      /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   CLASSTYPE_Sequence PARENT_1 = new CLASSIMPL_Sequence();
   void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_Sequence)parent; }
   static OBJECT TMETHOD_empty(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Data newInstance = new CLASSIMPL_Data(); return newInstance.CMETHOD_empty(newInstance, parameters); }
   OBJECT CMETHOD_empty(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Data self = cast(CLASSTYPE_Data)caller;
/* dlang injection start */
         this.value = new WRAP!(ubyte[])([]);
      /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_copy(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Data newInstance = new CLASSIMPL_Data(); return newInstance.CMETHOD_copy(newInstance, parameters); }
   OBJECT CMETHOD_copy(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Data self = cast(CLASSTYPE_Data)caller;
      OBJECT LOBJECT_bytes = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         ubyte[] copiedData;
      /* dlang injection end */
      CLASSIMPL_Loops.TMETHOD_iterate(caller, cast(OBJECT[])[LOBJECT_bytes, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT__ = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_byte = parameters.length > 1 ? parameters[1] : null;
/* dlang injection start */
            ubyte thisByte = (cast(WRAP!(ubyte))((cast(CLASSTYPE_Byte)LOBJECT_byte).IMETHOD_internalByte(null, []))).it;
            copiedData ~= thisByte;
         /* dlang injection end */
         return caller;
      } })]);
/* dlang injection start */
         this.value = new WRAP!(ubyte[])(copiedData);
      /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_concatenate(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Data newInstance = new CLASSIMPL_Data(); return newInstance.CMETHOD_concatenate(newInstance, parameters); }
   OBJECT CMETHOD_concatenate(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Data self = cast(CLASSTYPE_Data)caller;
      OBJECT LOBJECT_datas = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         ubyte[] concatedData;
      /* dlang injection end */
      CLASSIMPL_Loops.TMETHOD_iterate(caller, cast(OBJECT[])[LOBJECT_datas, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT__ = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_data = parameters.length > 1 ? parameters[1] : null;
/* dlang injection start */
            ubyte[] thisData = (cast(WRAP!(ubyte[]))((cast(CLASSTYPE_Data)LOBJECT_data).IMETHOD_internalData(null, []))).it;
            concatedData ~= thisData;
         /* dlang injection end */
         return caller;
      } })]);
/* dlang injection start */
         this.value = new WRAP!(ubyte[])(concatedData);
      /* dlang injection end */
      return caller;
   }
   override OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Data self = cast(CLASSTYPE_Data)caller;
/* dlang injection start */
         OBJECT LOBJECT_length = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(format("%d", this.value.it.length))]);
      /* dlang injection end */
      return LOBJECT_length;
   }
   override OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Data self = cast(CLASSTYPE_Data)caller;
      OBJECT LOBJECT_index = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         OBJECT LOBJECT_byteAtIndex = null;
         BigInt index = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_index).IMETHOD_internalInteger(null, []))).it;
         if (this.value.it.length > index) {
            CLASSIMPL_Byte rawByte = new CLASSIMPL_Byte();
            rawByte.value = new WRAP!(ubyte)(this.value.it[index.toLong()]);
            LOBJECT_byteAtIndex = CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[rawByte]);
         } else {
            LOBJECT_byteAtIndex = CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
         }
      /* dlang injection end */
      return LOBJECT_byteAtIndex;
   }
   override OBJECT IMETHOD_internalData(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Data self = cast(CLASSTYPE_Data)caller;
/* dlang injection start */
            return this.value;
         /* dlang injection end */
      return caller;
   }
}

/* *** CLASS: Byte *** */
interface CLASSTYPE_Byte : OBJECT, LAMBDA {
   OBJECT IMETHOD_internalByte(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isEqualTo(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_inclusiveBetween(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Byte : CLASSTYPE_Byte {
/* dlang injection start */
         WRAP!(ubyte) value;
      /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_0x00(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x00(newInstance, parameters); }
   OBJECT CMETHOD_0x00(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x00); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x01(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x01(newInstance, parameters); }
   OBJECT CMETHOD_0x01(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x01); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x02(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x02(newInstance, parameters); }
   OBJECT CMETHOD_0x02(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x02); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x03(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x03(newInstance, parameters); }
   OBJECT CMETHOD_0x03(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x03); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x04(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x04(newInstance, parameters); }
   OBJECT CMETHOD_0x04(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x04); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x05(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x05(newInstance, parameters); }
   OBJECT CMETHOD_0x05(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x05); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x06(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x06(newInstance, parameters); }
   OBJECT CMETHOD_0x06(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x06); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x07(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x07(newInstance, parameters); }
   OBJECT CMETHOD_0x07(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x07); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x08(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x08(newInstance, parameters); }
   OBJECT CMETHOD_0x08(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x08); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x09(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x09(newInstance, parameters); }
   OBJECT CMETHOD_0x09(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x09); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x0A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x0A(newInstance, parameters); }
   OBJECT CMETHOD_0x0A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x0A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x0B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x0B(newInstance, parameters); }
   OBJECT CMETHOD_0x0B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x0B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x0C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x0C(newInstance, parameters); }
   OBJECT CMETHOD_0x0C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x0C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x0D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x0D(newInstance, parameters); }
   OBJECT CMETHOD_0x0D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x0D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x0E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x0E(newInstance, parameters); }
   OBJECT CMETHOD_0x0E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x0E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x0F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x0F(newInstance, parameters); }
   OBJECT CMETHOD_0x0F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x0F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x10(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x10(newInstance, parameters); }
   OBJECT CMETHOD_0x10(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x10); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x11(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x11(newInstance, parameters); }
   OBJECT CMETHOD_0x11(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x11); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x12(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x12(newInstance, parameters); }
   OBJECT CMETHOD_0x12(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x12); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x13(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x13(newInstance, parameters); }
   OBJECT CMETHOD_0x13(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x13); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x14(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x14(newInstance, parameters); }
   OBJECT CMETHOD_0x14(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x14); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x15(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x15(newInstance, parameters); }
   OBJECT CMETHOD_0x15(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x15); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x16(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x16(newInstance, parameters); }
   OBJECT CMETHOD_0x16(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x16); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x17(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x17(newInstance, parameters); }
   OBJECT CMETHOD_0x17(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x17); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x18(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x18(newInstance, parameters); }
   OBJECT CMETHOD_0x18(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x18); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x19(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x19(newInstance, parameters); }
   OBJECT CMETHOD_0x19(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x19); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x1A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x1A(newInstance, parameters); }
   OBJECT CMETHOD_0x1A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x1A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x1B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x1B(newInstance, parameters); }
   OBJECT CMETHOD_0x1B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x1B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x1C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x1C(newInstance, parameters); }
   OBJECT CMETHOD_0x1C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x1C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x1D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x1D(newInstance, parameters); }
   OBJECT CMETHOD_0x1D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x1D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x1E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x1E(newInstance, parameters); }
   OBJECT CMETHOD_0x1E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x1E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x1F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x1F(newInstance, parameters); }
   OBJECT CMETHOD_0x1F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x1F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x20(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x20(newInstance, parameters); }
   OBJECT CMETHOD_0x20(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x20); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x21(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x21(newInstance, parameters); }
   OBJECT CMETHOD_0x21(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x21); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x22(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x22(newInstance, parameters); }
   OBJECT CMETHOD_0x22(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x22); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x23(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x23(newInstance, parameters); }
   OBJECT CMETHOD_0x23(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x23); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x24(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x24(newInstance, parameters); }
   OBJECT CMETHOD_0x24(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x24); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x25(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x25(newInstance, parameters); }
   OBJECT CMETHOD_0x25(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x25); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x26(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x26(newInstance, parameters); }
   OBJECT CMETHOD_0x26(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x26); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x27(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x27(newInstance, parameters); }
   OBJECT CMETHOD_0x27(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x27); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x28(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x28(newInstance, parameters); }
   OBJECT CMETHOD_0x28(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x28); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x29(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x29(newInstance, parameters); }
   OBJECT CMETHOD_0x29(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x29); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x2A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x2A(newInstance, parameters); }
   OBJECT CMETHOD_0x2A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x2A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x2B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x2B(newInstance, parameters); }
   OBJECT CMETHOD_0x2B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x2B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x2C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x2C(newInstance, parameters); }
   OBJECT CMETHOD_0x2C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x2C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x2D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x2D(newInstance, parameters); }
   OBJECT CMETHOD_0x2D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x2D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x2E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x2E(newInstance, parameters); }
   OBJECT CMETHOD_0x2E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x2E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x2F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x2F(newInstance, parameters); }
   OBJECT CMETHOD_0x2F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x2F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x30(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x30(newInstance, parameters); }
   OBJECT CMETHOD_0x30(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x30); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x31(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x31(newInstance, parameters); }
   OBJECT CMETHOD_0x31(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x31); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x32(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x32(newInstance, parameters); }
   OBJECT CMETHOD_0x32(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x32); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x33(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x33(newInstance, parameters); }
   OBJECT CMETHOD_0x33(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x33); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x34(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x34(newInstance, parameters); }
   OBJECT CMETHOD_0x34(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x34); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x35(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x35(newInstance, parameters); }
   OBJECT CMETHOD_0x35(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x35); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x36(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x36(newInstance, parameters); }
   OBJECT CMETHOD_0x36(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x36); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x37(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x37(newInstance, parameters); }
   OBJECT CMETHOD_0x37(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x37); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x38(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x38(newInstance, parameters); }
   OBJECT CMETHOD_0x38(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x38); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x39(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x39(newInstance, parameters); }
   OBJECT CMETHOD_0x39(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x39); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x3A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x3A(newInstance, parameters); }
   OBJECT CMETHOD_0x3A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x3A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x3B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x3B(newInstance, parameters); }
   OBJECT CMETHOD_0x3B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x3B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x3C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x3C(newInstance, parameters); }
   OBJECT CMETHOD_0x3C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x3C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x3D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x3D(newInstance, parameters); }
   OBJECT CMETHOD_0x3D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x3D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x3E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x3E(newInstance, parameters); }
   OBJECT CMETHOD_0x3E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x3E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x3F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x3F(newInstance, parameters); }
   OBJECT CMETHOD_0x3F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x3F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x40(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x40(newInstance, parameters); }
   OBJECT CMETHOD_0x40(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x40); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x41(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x41(newInstance, parameters); }
   OBJECT CMETHOD_0x41(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x41); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x42(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x42(newInstance, parameters); }
   OBJECT CMETHOD_0x42(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x42); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x43(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x43(newInstance, parameters); }
   OBJECT CMETHOD_0x43(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x43); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x44(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x44(newInstance, parameters); }
   OBJECT CMETHOD_0x44(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x44); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x45(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x45(newInstance, parameters); }
   OBJECT CMETHOD_0x45(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x45); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x46(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x46(newInstance, parameters); }
   OBJECT CMETHOD_0x46(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x46); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x47(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x47(newInstance, parameters); }
   OBJECT CMETHOD_0x47(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x47); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x48(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x48(newInstance, parameters); }
   OBJECT CMETHOD_0x48(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x48); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x49(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x49(newInstance, parameters); }
   OBJECT CMETHOD_0x49(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x49); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x4A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x4A(newInstance, parameters); }
   OBJECT CMETHOD_0x4A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x4A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x4B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x4B(newInstance, parameters); }
   OBJECT CMETHOD_0x4B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x4B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x4C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x4C(newInstance, parameters); }
   OBJECT CMETHOD_0x4C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x4C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x4D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x4D(newInstance, parameters); }
   OBJECT CMETHOD_0x4D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x4D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x4E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x4E(newInstance, parameters); }
   OBJECT CMETHOD_0x4E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x4E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x4F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x4F(newInstance, parameters); }
   OBJECT CMETHOD_0x4F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x4F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x50(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x50(newInstance, parameters); }
   OBJECT CMETHOD_0x50(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x50); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x51(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x51(newInstance, parameters); }
   OBJECT CMETHOD_0x51(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x51); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x52(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x52(newInstance, parameters); }
   OBJECT CMETHOD_0x52(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x52); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x53(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x53(newInstance, parameters); }
   OBJECT CMETHOD_0x53(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x53); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x54(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x54(newInstance, parameters); }
   OBJECT CMETHOD_0x54(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x54); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x55(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x55(newInstance, parameters); }
   OBJECT CMETHOD_0x55(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x55); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x56(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x56(newInstance, parameters); }
   OBJECT CMETHOD_0x56(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x56); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x57(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x57(newInstance, parameters); }
   OBJECT CMETHOD_0x57(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x57); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x58(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x58(newInstance, parameters); }
   OBJECT CMETHOD_0x58(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x58); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x59(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x59(newInstance, parameters); }
   OBJECT CMETHOD_0x59(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x59); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x5A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x5A(newInstance, parameters); }
   OBJECT CMETHOD_0x5A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x5A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x5B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x5B(newInstance, parameters); }
   OBJECT CMETHOD_0x5B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x5B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x5C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x5C(newInstance, parameters); }
   OBJECT CMETHOD_0x5C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x5C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x5D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x5D(newInstance, parameters); }
   OBJECT CMETHOD_0x5D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x5D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x5E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x5E(newInstance, parameters); }
   OBJECT CMETHOD_0x5E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x5E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x5F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x5F(newInstance, parameters); }
   OBJECT CMETHOD_0x5F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x5F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x60(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x60(newInstance, parameters); }
   OBJECT CMETHOD_0x60(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x60); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x61(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x61(newInstance, parameters); }
   OBJECT CMETHOD_0x61(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x61); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x62(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x62(newInstance, parameters); }
   OBJECT CMETHOD_0x62(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x62); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x63(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x63(newInstance, parameters); }
   OBJECT CMETHOD_0x63(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x63); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x64(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x64(newInstance, parameters); }
   OBJECT CMETHOD_0x64(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x64); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x65(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x65(newInstance, parameters); }
   OBJECT CMETHOD_0x65(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x65); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x66(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x66(newInstance, parameters); }
   OBJECT CMETHOD_0x66(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x66); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x67(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x67(newInstance, parameters); }
   OBJECT CMETHOD_0x67(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x67); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x68(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x68(newInstance, parameters); }
   OBJECT CMETHOD_0x68(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x68); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x69(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x69(newInstance, parameters); }
   OBJECT CMETHOD_0x69(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x69); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x6A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x6A(newInstance, parameters); }
   OBJECT CMETHOD_0x6A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x6A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x6B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x6B(newInstance, parameters); }
   OBJECT CMETHOD_0x6B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x6B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x6C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x6C(newInstance, parameters); }
   OBJECT CMETHOD_0x6C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x6C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x6D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x6D(newInstance, parameters); }
   OBJECT CMETHOD_0x6D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x6D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x6E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x6E(newInstance, parameters); }
   OBJECT CMETHOD_0x6E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x6E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x6F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x6F(newInstance, parameters); }
   OBJECT CMETHOD_0x6F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x6F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x70(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x70(newInstance, parameters); }
   OBJECT CMETHOD_0x70(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x70); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x71(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x71(newInstance, parameters); }
   OBJECT CMETHOD_0x71(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x71); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x72(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x72(newInstance, parameters); }
   OBJECT CMETHOD_0x72(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x72); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x73(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x73(newInstance, parameters); }
   OBJECT CMETHOD_0x73(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x73); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x74(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x74(newInstance, parameters); }
   OBJECT CMETHOD_0x74(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x74); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x75(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x75(newInstance, parameters); }
   OBJECT CMETHOD_0x75(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x75); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x76(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x76(newInstance, parameters); }
   OBJECT CMETHOD_0x76(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x76); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x77(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x77(newInstance, parameters); }
   OBJECT CMETHOD_0x77(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x77); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x78(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x78(newInstance, parameters); }
   OBJECT CMETHOD_0x78(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x78); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x79(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x79(newInstance, parameters); }
   OBJECT CMETHOD_0x79(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x79); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x7A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x7A(newInstance, parameters); }
   OBJECT CMETHOD_0x7A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x7A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x7B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x7B(newInstance, parameters); }
   OBJECT CMETHOD_0x7B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x7B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x7C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x7C(newInstance, parameters); }
   OBJECT CMETHOD_0x7C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x7C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x7D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x7D(newInstance, parameters); }
   OBJECT CMETHOD_0x7D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x7D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x7E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x7E(newInstance, parameters); }
   OBJECT CMETHOD_0x7E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x7E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x7F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x7F(newInstance, parameters); }
   OBJECT CMETHOD_0x7F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x7F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x80(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x80(newInstance, parameters); }
   OBJECT CMETHOD_0x80(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x80); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x81(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x81(newInstance, parameters); }
   OBJECT CMETHOD_0x81(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x81); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x82(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x82(newInstance, parameters); }
   OBJECT CMETHOD_0x82(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x82); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x83(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x83(newInstance, parameters); }
   OBJECT CMETHOD_0x83(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x83); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x84(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x84(newInstance, parameters); }
   OBJECT CMETHOD_0x84(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x84); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x85(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x85(newInstance, parameters); }
   OBJECT CMETHOD_0x85(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x85); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x86(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x86(newInstance, parameters); }
   OBJECT CMETHOD_0x86(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x86); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x87(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x87(newInstance, parameters); }
   OBJECT CMETHOD_0x87(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x87); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x88(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x88(newInstance, parameters); }
   OBJECT CMETHOD_0x88(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x88); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x89(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x89(newInstance, parameters); }
   OBJECT CMETHOD_0x89(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x89); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x8A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x8A(newInstance, parameters); }
   OBJECT CMETHOD_0x8A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x8A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x8B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x8B(newInstance, parameters); }
   OBJECT CMETHOD_0x8B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x8B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x8C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x8C(newInstance, parameters); }
   OBJECT CMETHOD_0x8C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x8C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x8D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x8D(newInstance, parameters); }
   OBJECT CMETHOD_0x8D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x8D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x8E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x8E(newInstance, parameters); }
   OBJECT CMETHOD_0x8E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x8E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x8F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x8F(newInstance, parameters); }
   OBJECT CMETHOD_0x8F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x8F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x90(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x90(newInstance, parameters); }
   OBJECT CMETHOD_0x90(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x90); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x91(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x91(newInstance, parameters); }
   OBJECT CMETHOD_0x91(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x91); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x92(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x92(newInstance, parameters); }
   OBJECT CMETHOD_0x92(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x92); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x93(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x93(newInstance, parameters); }
   OBJECT CMETHOD_0x93(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x93); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x94(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x94(newInstance, parameters); }
   OBJECT CMETHOD_0x94(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x94); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x95(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x95(newInstance, parameters); }
   OBJECT CMETHOD_0x95(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x95); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x96(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x96(newInstance, parameters); }
   OBJECT CMETHOD_0x96(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x96); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x97(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x97(newInstance, parameters); }
   OBJECT CMETHOD_0x97(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x97); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x98(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x98(newInstance, parameters); }
   OBJECT CMETHOD_0x98(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x98); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x99(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x99(newInstance, parameters); }
   OBJECT CMETHOD_0x99(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x99); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x9A(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x9A(newInstance, parameters); }
   OBJECT CMETHOD_0x9A(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x9A); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x9B(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x9B(newInstance, parameters); }
   OBJECT CMETHOD_0x9B(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x9B); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x9C(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x9C(newInstance, parameters); }
   OBJECT CMETHOD_0x9C(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x9C); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x9D(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x9D(newInstance, parameters); }
   OBJECT CMETHOD_0x9D(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x9D); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x9E(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x9E(newInstance, parameters); }
   OBJECT CMETHOD_0x9E(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x9E); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0x9F(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0x9F(newInstance, parameters); }
   OBJECT CMETHOD_0x9F(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0x9F); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA0(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA0(newInstance, parameters); }
   OBJECT CMETHOD_0xA0(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA0); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA1(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA1(newInstance, parameters); }
   OBJECT CMETHOD_0xA1(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA1); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA2(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA2(newInstance, parameters); }
   OBJECT CMETHOD_0xA2(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA2); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA3(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA3(newInstance, parameters); }
   OBJECT CMETHOD_0xA3(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA3); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA4(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA4(newInstance, parameters); }
   OBJECT CMETHOD_0xA4(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA4); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA5(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA5(newInstance, parameters); }
   OBJECT CMETHOD_0xA5(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA5); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA6(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA6(newInstance, parameters); }
   OBJECT CMETHOD_0xA6(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA6); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA7(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA7(newInstance, parameters); }
   OBJECT CMETHOD_0xA7(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA7); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA8(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA8(newInstance, parameters); }
   OBJECT CMETHOD_0xA8(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA8); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xA9(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xA9(newInstance, parameters); }
   OBJECT CMETHOD_0xA9(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xA9); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xAA(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xAA(newInstance, parameters); }
   OBJECT CMETHOD_0xAA(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xAA); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xAB(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xAB(newInstance, parameters); }
   OBJECT CMETHOD_0xAB(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xAB); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xAC(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xAC(newInstance, parameters); }
   OBJECT CMETHOD_0xAC(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xAC); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xAD(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xAD(newInstance, parameters); }
   OBJECT CMETHOD_0xAD(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xAD); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xAE(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xAE(newInstance, parameters); }
   OBJECT CMETHOD_0xAE(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xAE); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xAF(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xAF(newInstance, parameters); }
   OBJECT CMETHOD_0xAF(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xAF); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB0(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB0(newInstance, parameters); }
   OBJECT CMETHOD_0xB0(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB0); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB1(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB1(newInstance, parameters); }
   OBJECT CMETHOD_0xB1(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB1); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB2(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB2(newInstance, parameters); }
   OBJECT CMETHOD_0xB2(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB2); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB3(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB3(newInstance, parameters); }
   OBJECT CMETHOD_0xB3(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB3); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB4(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB4(newInstance, parameters); }
   OBJECT CMETHOD_0xB4(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB4); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB5(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB5(newInstance, parameters); }
   OBJECT CMETHOD_0xB5(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB5); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB6(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB6(newInstance, parameters); }
   OBJECT CMETHOD_0xB6(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB6); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB7(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB7(newInstance, parameters); }
   OBJECT CMETHOD_0xB7(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB7); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB8(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB8(newInstance, parameters); }
   OBJECT CMETHOD_0xB8(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB8); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xB9(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xB9(newInstance, parameters); }
   OBJECT CMETHOD_0xB9(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xB9); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xBA(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xBA(newInstance, parameters); }
   OBJECT CMETHOD_0xBA(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xBA); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xBB(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xBB(newInstance, parameters); }
   OBJECT CMETHOD_0xBB(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xBB); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xBC(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xBC(newInstance, parameters); }
   OBJECT CMETHOD_0xBC(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xBC); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xBD(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xBD(newInstance, parameters); }
   OBJECT CMETHOD_0xBD(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xBD); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xBE(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xBE(newInstance, parameters); }
   OBJECT CMETHOD_0xBE(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xBE); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xBF(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xBF(newInstance, parameters); }
   OBJECT CMETHOD_0xBF(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xBF); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC0(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC0(newInstance, parameters); }
   OBJECT CMETHOD_0xC0(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC0); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC1(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC1(newInstance, parameters); }
   OBJECT CMETHOD_0xC1(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC1); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC2(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC2(newInstance, parameters); }
   OBJECT CMETHOD_0xC2(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC2); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC3(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC3(newInstance, parameters); }
   OBJECT CMETHOD_0xC3(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC3); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC4(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC4(newInstance, parameters); }
   OBJECT CMETHOD_0xC4(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC4); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC5(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC5(newInstance, parameters); }
   OBJECT CMETHOD_0xC5(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC5); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC6(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC6(newInstance, parameters); }
   OBJECT CMETHOD_0xC6(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC6); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC7(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC7(newInstance, parameters); }
   OBJECT CMETHOD_0xC7(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC7); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC8(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC8(newInstance, parameters); }
   OBJECT CMETHOD_0xC8(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC8); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xC9(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xC9(newInstance, parameters); }
   OBJECT CMETHOD_0xC9(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xC9); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xCA(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xCA(newInstance, parameters); }
   OBJECT CMETHOD_0xCA(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xCA); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xCB(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xCB(newInstance, parameters); }
   OBJECT CMETHOD_0xCB(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xCB); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xCC(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xCC(newInstance, parameters); }
   OBJECT CMETHOD_0xCC(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xCC); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xCD(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xCD(newInstance, parameters); }
   OBJECT CMETHOD_0xCD(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xCD); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xCE(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xCE(newInstance, parameters); }
   OBJECT CMETHOD_0xCE(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xCE); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xCF(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xCF(newInstance, parameters); }
   OBJECT CMETHOD_0xCF(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xCF); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD0(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD0(newInstance, parameters); }
   OBJECT CMETHOD_0xD0(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD0); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD1(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD1(newInstance, parameters); }
   OBJECT CMETHOD_0xD1(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD1); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD2(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD2(newInstance, parameters); }
   OBJECT CMETHOD_0xD2(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD2); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD3(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD3(newInstance, parameters); }
   OBJECT CMETHOD_0xD3(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD3); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD4(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD4(newInstance, parameters); }
   OBJECT CMETHOD_0xD4(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD4); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD5(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD5(newInstance, parameters); }
   OBJECT CMETHOD_0xD5(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD5); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD6(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD6(newInstance, parameters); }
   OBJECT CMETHOD_0xD6(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD6); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD7(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD7(newInstance, parameters); }
   OBJECT CMETHOD_0xD7(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD7); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD8(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD8(newInstance, parameters); }
   OBJECT CMETHOD_0xD8(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD8); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xD9(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xD9(newInstance, parameters); }
   OBJECT CMETHOD_0xD9(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xD9); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xDA(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xDA(newInstance, parameters); }
   OBJECT CMETHOD_0xDA(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xDA); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xDB(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xDB(newInstance, parameters); }
   OBJECT CMETHOD_0xDB(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xDB); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xDC(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xDC(newInstance, parameters); }
   OBJECT CMETHOD_0xDC(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xDC); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xDD(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xDD(newInstance, parameters); }
   OBJECT CMETHOD_0xDD(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xDD); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xDE(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xDE(newInstance, parameters); }
   OBJECT CMETHOD_0xDE(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xDE); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xDF(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xDF(newInstance, parameters); }
   OBJECT CMETHOD_0xDF(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xDF); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE0(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE0(newInstance, parameters); }
   OBJECT CMETHOD_0xE0(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE0); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE1(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE1(newInstance, parameters); }
   OBJECT CMETHOD_0xE1(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE1); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE2(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE2(newInstance, parameters); }
   OBJECT CMETHOD_0xE2(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE2); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE3(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE3(newInstance, parameters); }
   OBJECT CMETHOD_0xE3(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE3); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE4(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE4(newInstance, parameters); }
   OBJECT CMETHOD_0xE4(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE4); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE5(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE5(newInstance, parameters); }
   OBJECT CMETHOD_0xE5(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE5); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE6(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE6(newInstance, parameters); }
   OBJECT CMETHOD_0xE6(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE6); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE7(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE7(newInstance, parameters); }
   OBJECT CMETHOD_0xE7(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE7); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE8(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE8(newInstance, parameters); }
   OBJECT CMETHOD_0xE8(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE8); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xE9(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xE9(newInstance, parameters); }
   OBJECT CMETHOD_0xE9(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xE9); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xEA(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xEA(newInstance, parameters); }
   OBJECT CMETHOD_0xEA(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xEA); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xEB(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xEB(newInstance, parameters); }
   OBJECT CMETHOD_0xEB(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xEB); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xEC(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xEC(newInstance, parameters); }
   OBJECT CMETHOD_0xEC(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xEC); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xED(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xED(newInstance, parameters); }
   OBJECT CMETHOD_0xED(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xED); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xEE(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xEE(newInstance, parameters); }
   OBJECT CMETHOD_0xEE(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xEE); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xEF(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xEF(newInstance, parameters); }
   OBJECT CMETHOD_0xEF(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xEF); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF0(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF0(newInstance, parameters); }
   OBJECT CMETHOD_0xF0(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF0); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF1(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF1(newInstance, parameters); }
   OBJECT CMETHOD_0xF1(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF1); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF2(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF2(newInstance, parameters); }
   OBJECT CMETHOD_0xF2(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF2); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF3(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF3(newInstance, parameters); }
   OBJECT CMETHOD_0xF3(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF3); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF4(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF4(newInstance, parameters); }
   OBJECT CMETHOD_0xF4(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF4); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF5(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF5(newInstance, parameters); }
   OBJECT CMETHOD_0xF5(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF5); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF6(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF6(newInstance, parameters); }
   OBJECT CMETHOD_0xF6(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF6); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF7(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF7(newInstance, parameters); }
   OBJECT CMETHOD_0xF7(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF7); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF8(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF8(newInstance, parameters); }
   OBJECT CMETHOD_0xF8(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF8); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xF9(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xF9(newInstance, parameters); }
   OBJECT CMETHOD_0xF9(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xF9); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xFA(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xFA(newInstance, parameters); }
   OBJECT CMETHOD_0xFA(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xFA); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xFB(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xFB(newInstance, parameters); }
   OBJECT CMETHOD_0xFB(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xFB); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xFC(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xFC(newInstance, parameters); }
   OBJECT CMETHOD_0xFC(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xFC); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xFD(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xFD(newInstance, parameters); }
   OBJECT CMETHOD_0xFD(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xFD); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xFE(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xFE(newInstance, parameters); }
   OBJECT CMETHOD_0xFE(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xFE); /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_0xFF(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Byte newInstance = new CLASSIMPL_Byte(); return newInstance.CMETHOD_0xFF(newInstance, parameters); }
   OBJECT CMETHOD_0xFF(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */ this.value = new WRAP!(ubyte)(0xFF); /* dlang injection end */
      return caller;
   }
   override OBJECT IMETHOD_internalByte(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
/* dlang injection start */
            return this.value;
         /* dlang injection end */
      return caller;
   }
   override OBJECT IMETHOD_isEqualTo(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
      OBJECT LOBJECT_otherByte = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */ 
         bool isEqualTo = this.value.it == (cast(WRAP!(ubyte))((cast(CLASSTYPE_Byte)LOBJECT_otherByte).IMETHOD_internalByte(null, []))).it;
         OBJECT LOBJECT_isEqualTo = isEqualTo ? CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]) : CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      /* dlang injection end */
      return LOBJECT_isEqualTo;
   }
   override OBJECT IMETHOD_inclusiveBetween(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Byte self = cast(CLASSTYPE_Byte)caller;
      OBJECT LOBJECT_from = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_to = parameters.length > 1 ? parameters[1] : null;
/* dlang injection start */ 
         bool isInclusiveBetween = (cast(WRAP!(ubyte))((cast(CLASSTYPE_Byte)LOBJECT_from).IMETHOD_internalByte(null, []))).it <= this.value.it && this.value.it <= (cast(WRAP!(ubyte))((cast(CLASSTYPE_Byte)LOBJECT_to).IMETHOD_internalByte(null, []))).it;
         OBJECT LOBJECT_isInclusiveBetween = isInclusiveBetween ? CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]) : CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      /* dlang injection end */
      return LOBJECT_isInclusiveBetween;
   }
}

/* *** CLASS: String *** */
interface CLASSTYPE_String : OBJECT, LAMBDA {
   OBJECT IMETHOD_isEqualTo(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_appending(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ascii(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_String : CLASSTYPE_String {
/* dlang injection start */
         import std.bigint;
         import std.format;
      /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_ascii = null;
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_String newInstance = new CLASSIMPL_String(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
      OBJECT LOBJECT_literal = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_ascii = CLASSIMPL_Data.TMETHOD_empty(caller, cast(OBJECT[])[]);
/* dlang injection start */
         ubyte[] literalBytes = cast(ubyte[])((cast(WRAP!(string))LOBJECT_literal).it);
         (cast(CLASSIMPL_Data)IOBJECT_ascii).value = new WRAP!(ubyte[])(literalBytes);
      /* dlang injection end */
      return caller;
   }
   static OBJECT TMETHOD_asASCII(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_String newInstance = new CLASSIMPL_String(); return newInstance.CMETHOD_asASCII(newInstance, parameters); }
   OBJECT CMETHOD_asASCII(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
      OBJECT LOBJECT_ascii = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_ascii = LOBJECT_ascii;
      return caller;
   }
   static OBJECT TMETHOD_concatenate(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_String newInstance = new CLASSIMPL_String(); return newInstance.CMETHOD_concatenate(newInstance, parameters); }
   OBJECT CMETHOD_concatenate(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
      OBJECT LOBJECT_strings = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_asciis = ((){
         CLASSTYPE_Sequence PARENT_1 = new CLASSIMPL_Sequence();
         void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_Sequence)parent; }
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_Sequence {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_strings;
                  return (cast(CLASSTYPE_Sequence)instance).IMETHOD_length(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
            }
            override OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               OBJECT LOBJECT_i = parameters.length > 0 ? parameters[0] : null;
               return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_strings;
                     return (cast(CLASSTYPE_Sequence)instance).IMETHOD_atIndex(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_i]);
                  return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_s = parameters.length > 0 ? parameters[0] : null;
                  return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_s;
                     return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return CLASSIMPL_Maybe.TMETHOD_nothing(caller, parameters);
               } })]);
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
         return anonymousClassObject;
      })();
      (cast(CLASSIMPL_String)self).CMETHOD_asASCII(this, [CLASSIMPL_Data.TMETHOD_concatenate(caller, cast(OBJECT[])[LOBJECT_asciis])]);
      return caller;
   }
   static OBJECT TMETHOD_stringFormatOf(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_String newInstance = new CLASSIMPL_String(); return newInstance.CMETHOD_stringFormatOf(newInstance, parameters); }
   OBJECT CMETHOD_stringFormatOf(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
      OBJECT LOBJECT_integer = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_ascii = CLASSIMPL_Data.TMETHOD_empty(caller, cast(OBJECT[])[]);
/* dlang injection start */
         BigInt integer = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_integer).IMETHOD_internalInteger(null, []))).it;
         ubyte[] bytes = cast(ubyte[])(format("%d", integer));
         (cast(CLASSIMPL_Data)IOBJECT_ascii).value = new WRAP!(ubyte[])(bytes);
      /* dlang injection end */
      return caller;
   }
   override OBJECT IMETHOD_isEqualTo(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
      OBJECT LOBJECT_otherString = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_thisAscii = self.IMETHOD_ascii(self, cast(OBJECT[])[]);
      OBJECT LOBJECT_otherAscii = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_otherString;
         return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
/* dlang injection start */ 
         bool isEqualTo = cast(string)((cast(WRAP!(ubyte[]))((cast(CLASSTYPE_Data)LOBJECT_thisAscii).IMETHOD_internalData(null, []))).it) == cast(string)((cast(WRAP!(ubyte[]))((cast(CLASSTYPE_Data)LOBJECT_otherAscii).IMETHOD_internalData(null, []))).it);
         OBJECT LOBJECT_isEqualTo = isEqualTo ? CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]) : CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      /* dlang injection end */
      return LOBJECT_isEqualTo;
   }
   override OBJECT IMETHOD_appending(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
      OBJECT LOBJECT_other = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_this = caller;
      OBJECT LOBJECT_both = ((){
         CLASSTYPE_Sequence PARENT_1 = new CLASSIMPL_Sequence();
         void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_Sequence)parent; }
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_Sequence {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               return CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("2")]);
            }
            override OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
               OBJECT LOBJECT_index = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_indexIs0 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_index;
                  return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]);
               return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_indexIs0;
                  return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return LOBJECT_this;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return LOBJECT_other;
               } })])]);
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
         return anonymousClassObject;
      })();
      return CLASSIMPL_String.TMETHOD_concatenate(caller, cast(OBJECT[])[LOBJECT_both]);
   }
   override OBJECT IMETHOD_ascii(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_String self = cast(CLASSTYPE_String)caller;
      return IOBJECT_ascii;
   }
}

/* *** CLASS: Loops *** */
interface CLASSTYPE_Loops : OBJECT, LAMBDA {
}
class CLASSIMPL_Loops : CLASSTYPE_Loops {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_iterate(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Loops self = cast(CLASSTYPE_Loops)caller;
      OBJECT LOBJECT_sequence = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_getNext = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_currentIndex = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]);
      TMETHOD_while(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_index = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_currentIndex;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_index;
               return (cast(CLASSTYPE_Natural)instance).IMETHOD_isLessThan(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_sequence;
               return (cast(CLASSTYPE_Sequence)instance).IMETHOD_length(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]);
         } }).method(caller, []);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_index = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_currentIndex;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_element = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_sequence;
            return (cast(CLASSTYPE_Sequence)instance).IMETHOD_atIndex(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_index]);
         {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_element;
               return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
               (cast(LAMBDA)LOBJECT_getNext).method(caller, cast(OBJECT[])[LOBJECT_index, LOBJECT_e]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_currentIndex;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_index;
               return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
         }
         return caller;
      } })]);
      return caller;
   }
   static OBJECT TMETHOD_while(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Loops self = cast(CLASSTYPE_Loops)caller;
      OBJECT LOBJECT_condition = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_action = parameters.length > 1 ? parameters[1] : null;
      TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = (cast(LAMBDA)LOBJECT_condition).method(caller, cast(OBJECT[])[]);
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_action, LOBJECT_stop]);
         return caller;
      } })]);
      return caller;
   }
   static OBJECT TMETHOD_until(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Loops self = cast(CLASSTYPE_Loops)caller;
      OBJECT LOBJECT_actionWithStop = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         bool continueActions = true;
         OBJECT LOBJECT_result = null;
         while (continueActions) {
      /* dlang injection end */
      (cast(LAMBDA)LOBJECT_actionWithStop).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_resultFromAction = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
            continueActions = false;
            LOBJECT_result = LOBJECT_resultFromAction;
         /* dlang injection end */
         return caller;
      } })]);
/* dlang injection start */
         }
      /* dlang injection end */
      return LOBJECT_result;
   }
}

/* *** CLASS: Variable *** */
interface CLASSTYPE_Variable : OBJECT, LAMBDA {
   OBJECT IMETHOD_get(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_set(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Variable : CLASSTYPE_Variable {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_variableObject = null;
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Variable newInstance = new CLASSIMPL_Variable(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Variable self = cast(CLASSTYPE_Variable)caller;
      OBJECT LOBJECT_initialInstantiation = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_variableObject = LOBJECT_initialInstantiation;
      return caller;
   }
   override OBJECT IMETHOD_get(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Variable self = cast(CLASSTYPE_Variable)caller;
      return IOBJECT_variableObject;
   }
   override OBJECT IMETHOD_set(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Variable self = cast(CLASSTYPE_Variable)caller;
      OBJECT LOBJECT_newInstantiation = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         IOBJECT_variableObject = LOBJECT_newInstantiation;
      /* dlang injection end */
      return caller;
   }
}

/* *** CLASS: Sequence *** */
interface CLASSTYPE_Sequence : OBJECT, LAMBDA {
   OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Sequence : CLASSTYPE_Sequence {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private LAMBDA ASSIGNIMETHOD_length = null;
   override OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
      return ASSIGNIMETHOD_length.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_atIndex = null;
   override OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Sequence self = cast(CLASSTYPE_Sequence)caller;
      return ASSIGNIMETHOD_atIndex.method(caller, parameters);
   }
}

/* *** CLASS: Natural *** */
interface CLASSTYPE_Natural : OBJECT, LAMBDA, CLASSTYPE_Integer {
   OBJECT IMETHOD_adding(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Natural : CLASSTYPE_Natural {
/* dlang injection start */
         import std.format;
         import std.conv;
         import std.bigint;
      /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   CLASSTYPE_Integer PARENT_1 = new CLASSIMPL_Integer();
   void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_Integer)parent; }
   override OBJECT IMETHOD_isLessThan(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_isLessThan(caller, parameters); }
   override OBJECT IMETHOD_isEqualTo(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_isEqualTo(caller, parameters); }
   override OBJECT IMETHOD_subtracting(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_subtracting(caller, parameters); }
   override OBJECT IMETHOD_internalInteger(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_internalInteger(caller, parameters); }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Natural newInstance = new CLASSIMPL_Natural(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Natural self = cast(CLASSTYPE_Natural)caller;
      OBJECT LOBJECT_literal = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         CLASSIMPL_Integer LOBJECT_integerRepresentation = cast(CLASSIMPL_Integer)CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_literal]);
      /* dlang injection end */
      PARENT_1_SET(LOBJECT_integerRepresentation);
      return caller;
   }
   static OBJECT TMETHOD_clampTo0(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Natural newInstance = new CLASSIMPL_Natural(); return newInstance.CMETHOD_clampTo0(newInstance, parameters); }
   OBJECT CMETHOD_clampTo0(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Natural self = cast(CLASSTYPE_Natural)caller;
      OBJECT LOBJECT_integer = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         BigInt integer = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_integer).IMETHOD_internalInteger(null, []))).it;
         if (integer < BigInt("0")) {
            integer = BigInt("0");
         }
         CLASSIMPL_Integer LOBJECT_integerRepresentation = cast(CLASSIMPL_Integer)CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(format("%d", integer))]);
      /* dlang injection end */
      PARENT_1_SET(LOBJECT_integerRepresentation);
      return caller;
   }
   static OBJECT TMETHOD_magnitudeOf(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Natural newInstance = new CLASSIMPL_Natural(); return newInstance.CMETHOD_magnitudeOf(newInstance, parameters); }
   OBJECT CMETHOD_magnitudeOf(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Natural self = cast(CLASSTYPE_Natural)caller;
      OBJECT LOBJECT_integer = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         BigInt integer = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_integer).IMETHOD_internalInteger(null, []))).it;
         if (integer < BigInt("0")) {
            integer = integer*BigInt("-1");
         }
         CLASSIMPL_Integer LOBJECT_integerRepresentation = cast(CLASSIMPL_Integer)CLASSIMPL_Integer.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(format("%d", integer))]);
      /* dlang injection end */
      PARENT_1_SET(LOBJECT_integerRepresentation);
      return caller;
   }
   override OBJECT IMETHOD_adding(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Natural self = cast(CLASSTYPE_Natural)caller;
      OBJECT LOBJECT_toAdd = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         BigInt thisBigInt = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)self).IMETHOD_internalInteger(null, []))).it;
         BigInt toAddBigInt = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_toAdd).IMETHOD_internalInteger(null, []))).it;
         BigInt bigIntResult = thisBigInt + toAddBigInt;
         OBJECT LOBJECT_result = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(format("%d", bigIntResult))]);
      /* dlang injection end */
      return LOBJECT_result;
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
      ASSIGNIMETHOD_isOrElse = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_is = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
         return (cast(LAMBDA)LOBJECT_else).method(caller, cast(OBJECT[])[]);
      } });
      return caller;
   }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Maybe newInstance = new CLASSIMPL_Maybe(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Maybe self = cast(CLASSTYPE_Maybe)caller;
      OBJECT LOBJECT_it = parameters.length > 0 ? parameters[0] : null;
      ASSIGNIMETHOD_isOrElse = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_is = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
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

/* *** CLASS: Boolean *** */
interface CLASSTYPE_Boolean : OBJECT, LAMBDA {
   OBJECT IMETHOD_ifOrElse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Boolean : CLASSTYPE_Boolean {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_false(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Boolean newInstance = new CLASSIMPL_Boolean(); return newInstance.CMETHOD_false(newInstance, parameters); }
   OBJECT CMETHOD_false(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Boolean self = cast(CLASSTYPE_Boolean)caller;
      ASSIGNIMETHOD_ifOrElse = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_if = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
         return (cast(LAMBDA)LOBJECT_else).method(caller, cast(OBJECT[])[]);
      } });
      return caller;
   }
   static OBJECT TMETHOD_true(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Boolean newInstance = new CLASSIMPL_Boolean(); return newInstance.CMETHOD_true(newInstance, parameters); }
   OBJECT CMETHOD_true(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Boolean self = cast(CLASSTYPE_Boolean)caller;
      ASSIGNIMETHOD_ifOrElse = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_if = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
         return (cast(LAMBDA)LOBJECT_if).method(caller, cast(OBJECT[])[]);
      } });
      return caller;
   }
   private LAMBDA ASSIGNIMETHOD_ifOrElse = null;
   override OBJECT IMETHOD_ifOrElse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Boolean self = cast(CLASSTYPE_Boolean)caller;
      return ASSIGNIMETHOD_ifOrElse.method(caller, parameters);
   }
   static OBJECT TMETHOD_or(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Boolean newInstance = new CLASSIMPL_Boolean(); return newInstance.CMETHOD_or(newInstance, parameters); }
   OBJECT CMETHOD_or(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Boolean self = cast(CLASSTYPE_Boolean)caller;
      OBJECT LOBJECT_b1 = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_b2 = parameters.length > 1 ? parameters[1] : null;
      ASSIGNIMETHOD_ifOrElse = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_if = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_b1;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_if, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_b2;
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_if, LOBJECT_else]);
         } })]);
      } });
      return caller;
   }
   static OBJECT TMETHOD_and(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Boolean newInstance = new CLASSIMPL_Boolean(); return newInstance.CMETHOD_and(newInstance, parameters); }
   OBJECT CMETHOD_and(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Boolean self = cast(CLASSTYPE_Boolean)caller;
      OBJECT LOBJECT_b1 = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_b2 = parameters.length > 1 ? parameters[1] : null;
      ASSIGNIMETHOD_ifOrElse = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_if = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_b1;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_b2;
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_if, LOBJECT_else]);
         } }), LOBJECT_else]);
      } });
      return caller;
   }
   static OBJECT TMETHOD_not(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Boolean newInstance = new CLASSIMPL_Boolean(); return newInstance.CMETHOD_not(newInstance, parameters); }
   OBJECT CMETHOD_not(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Boolean self = cast(CLASSTYPE_Boolean)caller;
      OBJECT LOBJECT_b1 = parameters.length > 0 ? parameters[0] : null;
      ASSIGNIMETHOD_ifOrElse = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_if = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_else = parameters.length > 1 ? parameters[1] : null;
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_b1;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_else, LOBJECT_if]);
      } });
      return caller;
   }
}

/* *** CLASS: Integer *** */
interface CLASSTYPE_Integer : OBJECT, LAMBDA {
   OBJECT IMETHOD_isLessThan(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_isEqualTo(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_subtracting(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_adding(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_internalInteger(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Integer : CLASSTYPE_Integer {
/* dlang injection start */
            import std.conv;
            import std.bigint;
            import std.format;
            WRAP!(BigInt) value;
         /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Integer newInstance = new CLASSIMPL_Integer(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Integer self = cast(CLASSTYPE_Integer)caller;
      OBJECT LOBJECT_literal = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         this.value = new WRAP!(BigInt)(BigInt((cast(WRAP!(string))LOBJECT_literal).it));
      /* dlang injection end */
      return caller;
   }
   override OBJECT IMETHOD_isLessThan(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Integer self = cast(CLASSTYPE_Integer)caller;
      OBJECT LOBJECT_otherInteger = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */ 
         bool isLessThan = this.value.it < (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_otherInteger).IMETHOD_internalInteger(null, []))).it;
         OBJECT LOBJECT_isLessThan = isLessThan ? CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]) : CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      /* dlang injection end */
      return LOBJECT_isLessThan;
   }
   override OBJECT IMETHOD_isEqualTo(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Integer self = cast(CLASSTYPE_Integer)caller;
      OBJECT LOBJECT_otherInteger = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */ 
         bool isEqualTo = this.value.it == (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_otherInteger).IMETHOD_internalInteger(null, []))).it;
         OBJECT LOBJECT_isEqualTo = isEqualTo ? CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[]) : CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[]);
      /* dlang injection end */
      return LOBJECT_isEqualTo;
   }
   override OBJECT IMETHOD_subtracting(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Integer self = cast(CLASSTYPE_Integer)caller;
      OBJECT LOBJECT_toSubtract = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         BigInt thisBigInt = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)self).IMETHOD_internalInteger(null, []))).it;
         BigInt toSubtractBigInt = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_toSubtract).IMETHOD_internalInteger(null, []))).it;
         BigInt bigIntResult = thisBigInt - toSubtractBigInt;
         OBJECT LOBJECT_result = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(format("%d", bigIntResult))]);
      /* dlang injection end */
      return LOBJECT_result;
   }
   override OBJECT IMETHOD_adding(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Integer self = cast(CLASSTYPE_Integer)caller;
      OBJECT LOBJECT_toAdd = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
         BigInt thisBigInt = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)self).IMETHOD_internalInteger(null, []))).it;
         BigInt toAddBigInt = (cast(WRAP!(BigInt))((cast(CLASSTYPE_Integer)LOBJECT_toAdd).IMETHOD_internalInteger(null, []))).it;
         BigInt bigIntResult = thisBigInt + toAddBigInt;
         OBJECT LOBJECT_result = CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(format("%d", bigIntResult))]);
      /* dlang injection end */
      return LOBJECT_result;
   }
   override OBJECT IMETHOD_internalInteger(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Integer self = cast(CLASSTYPE_Integer)caller;
/* dlang injection start */
            return this.value;
         /* dlang injection end */
      return caller;
   }
}

/* *** CLASS: ListNode *** */
interface CLASSTYPE_ListNode : OBJECT, LAMBDA {
   OBJECT IMETHOD_value(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_next(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_previous(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_ListNode : CLASSTYPE_ListNode {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_withValue(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_ListNode newInstance = new CLASSIMPL_ListNode(); return newInstance.CMETHOD_withValue(newInstance, parameters); }
   OBJECT CMETHOD_withValue(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_ListNode self = cast(CLASSTYPE_ListNode)caller;
      OBJECT LOBJECT_value = parameters.length > 0 ? parameters[0] : null;
      ASSIGNIMETHOD_value = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return LOBJECT_value;
      } });
      ASSIGNIMETHOD_next = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_next = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
         return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return LOBJECT_next;
         } });
      } }).method(caller, []);
      ASSIGNIMETHOD_previous = cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_previous = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
         return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return LOBJECT_previous;
         } });
      } }).method(caller, []);
      return caller;
   }
   private LAMBDA ASSIGNIMETHOD_value = null;
   override OBJECT IMETHOD_value(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_ListNode self = cast(CLASSTYPE_ListNode)caller;
      return ASSIGNIMETHOD_value.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_next = null;
   override OBJECT IMETHOD_next(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_ListNode self = cast(CLASSTYPE_ListNode)caller;
      return ASSIGNIMETHOD_next.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_previous = null;
   override OBJECT IMETHOD_previous(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_ListNode self = cast(CLASSTYPE_ListNode)caller;
      return ASSIGNIMETHOD_previous.method(caller, parameters);
   }
}

/* *** CLASS: List *** */
interface CLASSTYPE_List : OBJECT, LAMBDA, CLASSTYPE_Sequence {
   OBJECT IMETHOD_iterate(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_removeFirst(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_prepend(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_removeLast(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_append(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_List : CLASSTYPE_List {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   CLASSTYPE_Sequence PARENT_1 = new CLASSIMPL_Sequence();
   void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_Sequence)parent; }
   private OBJECT IOBJECT_first = null;
   private OBJECT IOBJECT_last = null;
   private OBJECT IOBJECT_length = null;
   static OBJECT TMETHOD_empty(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_List newInstance = new CLASSIMPL_List(); return newInstance.CMETHOD_empty(newInstance, parameters); }
   OBJECT CMETHOD_empty(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_List self = cast(CLASSTYPE_List)caller;
      IOBJECT_first = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
      IOBJECT_last = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
      IOBJECT_length = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]);
      return caller;
   }
   override OBJECT IMETHOD_iterate(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_List self = cast(CLASSTYPE_List)caller;
      OBJECT LOBJECT_getE = parameters.length > 0 ? parameters[0] : null;
      CLASSIMPL_Loops.TMETHOD_iterate(caller, cast(OBJECT[])[caller, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT__ = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_e = parameters.length > 1 ? parameters[1] : null;
         (cast(LAMBDA)LOBJECT_getE).method(caller, cast(OBJECT[])[LOBJECT_e]);
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_length(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_List self = cast(CLASSTYPE_List)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_length;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
   }
   override OBJECT IMETHOD_atIndex(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_List self = cast(CLASSTYPE_List)caller;
      OBJECT LOBJECT_index = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_varCurrentIndex = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")])]);
      OBJECT LOBJECT_varCurrentNode = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_first;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])]);
      OBJECT LOBJECT_atIndex = CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_choose = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_currentIndex = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_varCurrentIndex;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_currentNode = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_varCurrentNode;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_varCurrentNode;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_currentNode;
            return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_n = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_sameIndex = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_currentIndex;
               return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_index]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_sameIndex;
               return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)LOBJECT_choose).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_n;
                  return (cast(CLASSTYPE_ListNode)instance).IMETHOD_value(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])])]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_n;
                  return (cast(CLASSTYPE_ListNode)instance).IMETHOD_next(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)LOBJECT_choose).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
            return CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
         } })])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_varCurrentIndex;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_currentIndex;
            return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
         return caller;
      } })]);
      return LOBJECT_atIndex;
   }
   override OBJECT IMETHOD_removeFirst(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_List self = cast(CLASSTYPE_List)caller;
      OBJECT LOBJECT_first = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_first;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_first;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_node = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_nextNode = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_node;
            return (cast(CLASSTYPE_ListNode)instance).IMETHOD_next(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_first;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_nextNode;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         OBJECT LOBJECT_length = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_length;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_length;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_clampTo0(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_length;
            return (cast(CLASSTYPE_Natural)instance).IMETHOD_subtracting(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])])]);
         OBJECT LOBJECT_lastNode = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_length;
            return (cast(CLASSTYPE_Natural)instance).IMETHOD_isEqualTo(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_lastNode;
            return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_last;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[])]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return caller;
         } })]);
         return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_node;
            return (cast(CLASSTYPE_ListNode)instance).IMETHOD_value(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
      } })]);
   }
   override OBJECT IMETHOD_prepend(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_List self = cast(CLASSTYPE_List)caller;
      OBJECT LOBJECT_value = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_length = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_length;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_length;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_length;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
      OBJECT LOBJECT_newNode = CLASSIMPL_ListNode.TMETHOD_withValue(caller, cast(OBJECT[])[LOBJECT_value]);
      OBJECT LOBJECT_first = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_first;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_first;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_firstNode = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_firstNodePrevious = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_firstNode;
            return (cast(CLASSTYPE_ListNode)instance).IMETHOD_previous(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_newNodeNext = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_newNode;
            return (cast(CLASSTYPE_ListNode)instance).IMETHOD_next(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_newNodeNext;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_first]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_firstNodePrevious;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_newNode])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_last;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_newNode])]);
         return caller;
      } })]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_first;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_newNode])]);
      return caller;
   }
   override OBJECT IMETHOD_removeLast(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_List self = cast(CLASSTYPE_List)caller;
      OBJECT LOBJECT_last = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_last;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_last;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_node = parameters.length > 0 ? parameters[0] : null;
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_last;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_node;
            return (cast(CLASSTYPE_ListNode)instance).IMETHOD_previous(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
         OBJECT LOBJECT_length = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_length;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_length;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_clampTo0(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_length;
            return (cast(CLASSTYPE_Natural)instance).IMETHOD_subtracting(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])])]);
         return CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_node;
            return (cast(CLASSTYPE_ListNode)instance).IMETHOD_value(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
      } })]);
   }
   override OBJECT IMETHOD_append(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_List self = cast(CLASSTYPE_List)caller;
      OBJECT LOBJECT_value = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_length = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_length;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_length;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_length;
         return (cast(CLASSTYPE_Natural)instance).IMETHOD_adding(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("1")])])]);
      OBJECT LOBJECT_newNode = CLASSIMPL_ListNode.TMETHOD_withValue(caller, cast(OBJECT[])[LOBJECT_value]);
      OBJECT LOBJECT_last = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_last;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_last;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_lastNode = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_newNodePrevious = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_newNode;
            return (cast(CLASSTYPE_ListNode)instance).IMETHOD_previous(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         OBJECT LOBJECT_lastNodeNext = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_lastNode;
            return (cast(CLASSTYPE_ListNode)instance).IMETHOD_next(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_newNodePrevious;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_last]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_lastNodeNext;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_newNode])]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = IOBJECT_first;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_newNode])]);
         return caller;
      } })]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_last;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
      } })).method(caller, cast(OBJECT[])[CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_newNode])]);
      return caller;
   }
}

/* *** CLASS: Index *** */
interface CLASSTYPE_Index : OBJECT, LAMBDA {
   OBJECT IMETHOD_get(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_set(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Index : CLASSTYPE_Index {
/* dlang injection start */
         import std.string : assumeUTF;
         OBJECT[string] index;
      /* dlang injection end */
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_empty(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Index newInstance = new CLASSIMPL_Index(); return newInstance.CMETHOD_empty(newInstance, parameters); }
   OBJECT CMETHOD_empty(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Index self = cast(CLASSTYPE_Index)caller;
      return caller;
   }
   override OBJECT IMETHOD_get(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Index self = cast(CLASSTYPE_Index)caller;
      OBJECT LOBJECT_key = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_ascii = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_key;
         return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
/* dlang injection start */
         OBJECT LOBJECT_foundInIndex = null;
         string key = (cast(CLASSIMPL_Data)LOBJECT_ascii).value.it.assumeUTF;
         if (auto valuePtr = key in index) {
            LOBJECT_foundInIndex = CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[*valuePtr]);
         } else {
            LOBJECT_foundInIndex = CLASSIMPL_Maybe.TMETHOD_nothing(caller, cast(OBJECT[])[]);
         }
      /* dlang injection end */
      return LOBJECT_foundInIndex;
   }
   override OBJECT IMETHOD_set(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Index self = cast(CLASSTYPE_Index)caller;
      OBJECT LOBJECT_key = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_maybeValue = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_ascii = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_key;
         return (cast(CLASSTYPE_String)instance).IMETHOD_ascii(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
/* dlang injection start */
         string key = (cast(CLASSIMPL_Data)LOBJECT_ascii).value.it.assumeUTF;
      /* dlang injection end */
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_maybeValue;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_value = parameters.length > 0 ? parameters[0] : null;
/* dlang injection start */
            index[key] = LOBJECT_value;
         /* dlang injection end */
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
/* dlang injection start */
            index.remove(key);
         /* dlang injection end */
         return caller;
      } })]);
      return caller;
   }
}

/* *** CLASS: O *** */
interface CLASSTYPE_O : OBJECT, LAMBDA {
}
class CLASSIMPL_O : CLASSTYPE_O {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_ifElse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_O self = cast(CLASSTYPE_O)caller;
      OBJECT LOBJECT_b = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_if = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_else = parameters.length > 2 ? parameters[2] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_b;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_if, LOBJECT_else]);
      return caller;
   }
   static OBJECT TMETHOD_selectOrDefault(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_O self = cast(CLASSTYPE_O)caller;
      OBJECT LOBJECT_select = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_default = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_wasSelected = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_false(caller, cast(OBJECT[])[])]);
      (cast(LAMBDA)LOBJECT_select).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_wasSelected;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_true(caller, cast(OBJECT[])[])]);
         return caller;
      } })]);
      OBJECT LOBJECT_b = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_wasSelected;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_b;
         return (cast(CLASSTYPE_Boolean)instance).IMETHOD_ifOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } }), LOBJECT_default]);
      return caller;
   }
}

/* *** CLASS: Mapping *** */
interface CLASSTYPE_Mapping : OBJECT, LAMBDA {
   OBJECT IMETHOD_mapKeyToValue(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_retriveMappedValueWithKey(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_maybeRetriveMappedValueWithKey(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Mapping : CLASSTYPE_Mapping {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_index = null;
   static OBJECT TMETHOD_empty(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_Mapping newInstance = new CLASSIMPL_Mapping(); return newInstance.CMETHOD_empty(newInstance, parameters); }
   OBJECT CMETHOD_empty(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Mapping self = cast(CLASSTYPE_Mapping)caller;
      IOBJECT_index = CLASSIMPL_Index.TMETHOD_empty(caller, cast(OBJECT[])[]);
      return caller;
   }
   override OBJECT IMETHOD_mapKeyToValue(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Mapping self = cast(CLASSTYPE_Mapping)caller;
      OBJECT LOBJECT_key = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_value = parameters.length > 1 ? parameters[1] : null;
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_index;
         return (cast(CLASSTYPE_Index)instance).IMETHOD_set(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_key, CLASSIMPL_Maybe.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_value])]);
      return caller;
   }
   override OBJECT IMETHOD_retriveMappedValueWithKey(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Mapping self = cast(CLASSTYPE_Mapping)caller;
      OBJECT LOBJECT_key = parameters.length > 0 ? parameters[0] : null;
      OBJECT LOBJECT_valueRetriver = parameters.length > 1 ? parameters[1] : null;
      OBJECT LOBJECT_maybeValue = self.IMETHOD_maybeRetriveMappedValueWithKey(self, cast(OBJECT[])[LOBJECT_key]);
      (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_maybeValue;
         return (cast(CLASSTYPE_Maybe)instance).IMETHOD_isOrElse(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_valueRetriver, (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return caller;
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_maybeRetriveMappedValueWithKey(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_Mapping self = cast(CLASSTYPE_Mapping)caller;
      OBJECT LOBJECT_key = parameters.length > 0 ? parameters[0] : null;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_index;
         return (cast(CLASSTYPE_Index)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[LOBJECT_key]);
   }
}

/* *** CLASS: DainaTypeEnum *** */
interface CLASSTYPE_DainaTypeEnum : OBJECT, LAMBDA {
   OBJECT IMETHOD_root(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_classAndGenerics(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_method(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_disjoint(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_classGeneric(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_methodGeneric(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_dataSegment(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_inferred(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_inferredMethodContext(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_inferredSelfContext(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_inferredParentContext(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaTypeEnum : CLASSTYPE_DainaTypeEnum {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_default(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      OBJECT LOBJECT_default = parameters.length > 0 ? parameters[0] : null;
      return ((){
         CLASSTYPE_DainaTypeEnum PARENT_1 = new CLASSIMPL_DainaTypeEnum();
         void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_DainaTypeEnum)parent; }
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_DainaTypeEnum {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_root(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_classAndGenerics(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_method(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_disjoint(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_classGeneric(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_methodGeneric(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_dataSegment(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_inferred(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_inferredMethodContext(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_inferredSelfContext(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
            override OBJECT IMETHOD_inferredParentContext(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return LOBJECT_default;
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
         return anonymousClassObject;
      })();
   }
   private LAMBDA ASSIGNIMETHOD_root = null;
   override OBJECT IMETHOD_root(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_root.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_classAndGenerics = null;
   override OBJECT IMETHOD_classAndGenerics(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_classAndGenerics.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_method = null;
   override OBJECT IMETHOD_method(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_method.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_disjoint = null;
   override OBJECT IMETHOD_disjoint(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_disjoint.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_classGeneric = null;
   override OBJECT IMETHOD_classGeneric(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_classGeneric.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_methodGeneric = null;
   override OBJECT IMETHOD_methodGeneric(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_methodGeneric.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_dataSegment = null;
   override OBJECT IMETHOD_dataSegment(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_dataSegment.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_inferred = null;
   override OBJECT IMETHOD_inferred(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_inferred.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_inferredMethodContext = null;
   override OBJECT IMETHOD_inferredMethodContext(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_inferredMethodContext.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_inferredSelfContext = null;
   override OBJECT IMETHOD_inferredSelfContext(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_inferredSelfContext.method(caller, parameters);
   }
   private LAMBDA ASSIGNIMETHOD_inferredParentContext = null;
   override OBJECT IMETHOD_inferredParentContext(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
      return ASSIGNIMETHOD_inferredParentContext.method(caller, parameters);
   }
}

/* *** CLASS: DainaType *** */
interface CLASSTYPE_DainaType : OBJECT, LAMBDA {
   OBJECT IMETHOD_description(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_set(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_get(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifClassNameAndGenericInstantiation(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_ifMethodInputsAndOutput(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_setAsMethodWithOutputType(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_setAsClassName(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaType : CLASSTYPE_DainaType {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private OBJECT IOBJECT_representedType = null;
   static OBJECT TMETHOD_isFirstToken(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      OBJECT LOBJECT_token = parameters.length > 0 ? parameters[0] : null;
      return CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[LOBJECT_token, CLASSIMPL_Token.TMETHOD_squareBracketOpen(caller, cast(OBJECT[])[])]);
   }
   static OBJECT TMETHOD_root(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaType newInstance = new CLASSIMPL_DainaType(); return newInstance.CMETHOD_root(newInstance, parameters); }
   OBJECT CMETHOD_root(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      (cast(CLASSIMPL_DainaType)self).CMETHOD_as(this, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_e;
            return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_root(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
      } })]);
      return caller;
   }
   static OBJECT TMETHOD_as(OBJECT caller, OBJECT[] parameters) { CLASSIMPL_DainaType newInstance = new CLASSIMPL_DainaType(); return newInstance.CMETHOD_as(newInstance, parameters); }
   OBJECT CMETHOD_as(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      OBJECT LOBJECT_enum = parameters.length > 0 ? parameters[0] : null;
      IOBJECT_representedType = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_enum]);
      return caller;
   }
   override OBJECT IMETHOD_description(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      OBJECT LOBJECT_descriptionOfTypeList = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_typeList = parameters.length > 0 ? parameters[0] : null;
         OBJECT LOBJECT_description = CLASSIMPL_Variable.TMETHOD_as(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("")])]);
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_typeList;
            return (cast(CLASSTYPE_List)instance).IMETHOD_iterate(instance, parameters);
         } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_typeEnum = parameters.length > 0 ? parameters[0] : null;
            OBJECT LOBJECT_current = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_description;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            OBJECT LOBJECT_type = CLASSIMPL_DainaType.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_typeEnum]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_description;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_current;
               return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_type;
               return (cast(CLASSTYPE_DainaType)instance).IMETHOD_description(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_description;
            return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
      } });
      OBJECT LOBJECT_description = (cast(LAMBDA)(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_representedType;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, cast(OBJECT[])[])).method(caller, cast(OBJECT[])[((){
         CLASSTYPE_DainaTypeEnum PARENT_1 = new CLASSIMPL_DainaTypeEnum();
         void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_DainaTypeEnum)parent; }
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_DainaTypeEnum {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_root(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[]")]);
            }
            override OBJECT IMETHOD_classAndGenerics(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               OBJECT LOBJECT_id = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_generics = parameters.length > 1 ? parameters[1] : null;
               OBJECT LOBJECT_className = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_id;
                  return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_content(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               OBJECT LOBJECT_desc1 = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[")]);
               OBJECT LOBJECT_desc2 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_desc1;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_className]);
               OBJECT LOBJECT_desc3 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_desc2;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("<")])]);
               OBJECT LOBJECT_desc4 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_desc3;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)LOBJECT_descriptionOfTypeList).method(caller, cast(OBJECT[])[LOBJECT_generics])]);
               OBJECT LOBJECT_desc5 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_desc4;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)(">]")])]);
               return LOBJECT_desc5;
            }
            override OBJECT IMETHOD_method(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               OBJECT LOBJECT_inputs = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_outputEnum = parameters.length > 1 ? parameters[1] : null;
               OBJECT LOBJECT_desc1 = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[")]);
               OBJECT LOBJECT_desc2 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_desc1;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)LOBJECT_descriptionOfTypeList).method(caller, cast(OBJECT[])[LOBJECT_inputs])]);
               OBJECT LOBJECT_desc3 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_desc2;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("->")])]);
               OBJECT LOBJECT_output = CLASSIMPL_DainaType.TMETHOD_as(caller, cast(OBJECT[])[LOBJECT_outputEnum]);
               OBJECT LOBJECT_desc4 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_desc3;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_output;
                  return (cast(CLASSTYPE_DainaType)instance).IMETHOD_description(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]);
               return LOBJECT_desc4;
            }
            override OBJECT IMETHOD_disjoint(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               OBJECT LOBJECT_subtypes = parameters.length > 0 ? parameters[0] : null;
               OBJECT LOBJECT_desc1 = CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[//")]);
               OBJECT LOBJECT_desc2 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_desc1;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
               } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)LOBJECT_descriptionOfTypeList).method(caller, cast(OBJECT[])[LOBJECT_subtypes])]);
               OBJECT LOBJECT_desc3 = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_desc2;
                  return (cast(CLASSTYPE_String)instance).IMETHOD_appending(instance, parameters);
               } })).method(caller, cast(OBJECT[])[CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("]")])]);
               return LOBJECT_desc3;
            }
            override OBJECT IMETHOD_classGeneric(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[&GEN*]")]);
            }
            override OBJECT IMETHOD_methodGeneric(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("['*GEN*]")]);
            }
            override OBJECT IMETHOD_dataSegment(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[%SEG*]")]);
            }
            override OBJECT IMETHOD_inferred(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[?]")]);
            }
            override OBJECT IMETHOD_inferredMethodContext(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[?*]")]);
            }
            override OBJECT IMETHOD_inferredSelfContext(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[?:]")]);
            }
            override OBJECT IMETHOD_inferredParentContext(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return CLASSIMPL_String.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("[?$n]")]);
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
         return anonymousClassObject;
      })()]);
      return LOBJECT_description;
   }
   override OBJECT IMETHOD_set(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_representedType;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
      } })).method(caller, parameters);
   }
   override OBJECT IMETHOD_get(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = IOBJECT_representedType;
         return (cast(CLASSTYPE_Variable)instance).IMETHOD_get(instance, parameters);
      } })).method(caller, parameters);
   }
   override OBJECT IMETHOD_ifClassNameAndGenericInstantiation(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)self.IMETHOD_get(self, cast(OBJECT[])[])).method(caller, cast(OBJECT[])[((){
         CLASSTYPE_DainaTypeEnum PARENT_1 = new CLASSIMPL_DainaTypeEnum();
         void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_DainaTypeEnum)parent; }
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_DainaTypeEnum {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_root(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_root(caller, parameters); }
            override OBJECT IMETHOD_method(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_method(caller, parameters); }
            override OBJECT IMETHOD_disjoint(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_disjoint(caller, parameters); }
            override OBJECT IMETHOD_classGeneric(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_classGeneric(caller, parameters); }
            override OBJECT IMETHOD_methodGeneric(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_methodGeneric(caller, parameters); }
            override OBJECT IMETHOD_dataSegment(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_dataSegment(caller, parameters); }
            override OBJECT IMETHOD_inferred(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_inferred(caller, parameters); }
            override OBJECT IMETHOD_inferredMethodContext(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_inferredMethodContext(caller, parameters); }
            override OBJECT IMETHOD_inferredSelfContext(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_inferredSelfContext(caller, parameters); }
            override OBJECT IMETHOD_inferredParentContext(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_inferredParentContext(caller, parameters); }
            override OBJECT IMETHOD_classAndGenerics(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return (cast(LAMBDA)LOBJECT_get).method(caller, parameters);
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
         PARENT_1_SET(CLASSIMPL_DainaTypeEnum.TMETHOD_default(caller, cast(OBJECT[])[new class OBJECT {}]));
         return anonymousClassObject;
      })()]);
      return caller;
   }
   override OBJECT IMETHOD_ifMethodInputsAndOutput(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      OBJECT LOBJECT_get = parameters.length > 0 ? parameters[0] : null;
      (cast(LAMBDA)self.IMETHOD_get(self, cast(OBJECT[])[])).method(caller, cast(OBJECT[])[((){
         CLASSTYPE_DainaTypeEnum PARENT_1 = new CLASSIMPL_DainaTypeEnum();
         void PARENT_1_SET(OBJECT parent) { PARENT_1 = cast(CLASSTYPE_DainaTypeEnum)parent; }
         OBJECT caller;
         OBJECT anonymousClassObject = new class OBJECT, LAMBDA, CLASSTYPE_DainaTypeEnum {
            override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
            override OBJECT IMETHOD_root(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_root(caller, parameters); }
            override OBJECT IMETHOD_classAndGenerics(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_classAndGenerics(caller, parameters); }
            override OBJECT IMETHOD_disjoint(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_disjoint(caller, parameters); }
            override OBJECT IMETHOD_classGeneric(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_classGeneric(caller, parameters); }
            override OBJECT IMETHOD_methodGeneric(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_methodGeneric(caller, parameters); }
            override OBJECT IMETHOD_dataSegment(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_dataSegment(caller, parameters); }
            override OBJECT IMETHOD_inferred(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_inferred(caller, parameters); }
            override OBJECT IMETHOD_inferredMethodContext(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_inferredMethodContext(caller, parameters); }
            override OBJECT IMETHOD_inferredSelfContext(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_inferredSelfContext(caller, parameters); }
            override OBJECT IMETHOD_inferredParentContext(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_inferredParentContext(caller, parameters); }
            override OBJECT IMETHOD_method(OBJECT caller, OBJECT[] parameters) {
               CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
               return (cast(LAMBDA)LOBJECT_get).method(caller, parameters);
            }
         };
         caller = anonymousClassObject;
         CLASSTYPE_DainaTypeEnum self = cast(CLASSTYPE_DainaTypeEnum)caller;
         PARENT_1_SET(CLASSIMPL_DainaTypeEnum.TMETHOD_default(caller, cast(OBJECT[])[new class OBJECT {}]));
         return anonymousClassObject;
      })()]);
      return caller;
   }
   override OBJECT IMETHOD_setAsMethodWithOutputType(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      OBJECT LOBJECT_outputType = parameters.length > 0 ? parameters[0] : null;
      self.IMETHOD_set(self, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_e;
            return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_method(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]), (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_outputType;
            return (cast(CLASSTYPE_DainaType)instance).IMETHOD_get(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]);
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_setAsClassName(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      OBJECT LOBJECT_className = parameters.length > 0 ? parameters[0] : null;
      self.IMETHOD_set(self, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
         return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_e;
            return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_classAndGenerics(instance, parameters);
         } })).method(caller, cast(OBJECT[])[LOBJECT_className, CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[])]);
      } })]);
      return caller;
   }
   override OBJECT IMETHOD_parse(OBJECT caller, OBJECT[] parameters) {
      CLASSTYPE_DainaType self = cast(CLASSTYPE_DainaType)caller;
      OBJECT LOBJECT_parser = parameters.length > 0 ? parameters[0] : null;
      CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_parser;
         return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
      } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_squareBracketOpen(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaClassIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT LOBJECT_className = CLASSIMPL_DainaClassIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_className;
               return (cast(CLASSTYPE_DainaClassIdentifier)instance).IMETHOD_parse(instance, parameters);
            } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
            OBJECT LOBJECT_genericInstantiations = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrowBracketOpen(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]);
               CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_genericInstantiation = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_genericInstantiation;
                        return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_genericInstantiations;
                        return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_genericInstantiation;
                        return (cast(CLASSTYPE_DainaType)instance).IMETHOD_get(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]);
                     CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        return caller;
                     } }), LOBJECT_stop]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingOneOrMoreTypesForClassGenericInstantiation(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])])]);
                     (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
                     return caller;
                  } })]);
                  return caller;
               } })]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrowBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForClassGenericInstantiations(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])])]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               return caller;
            } })]);
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = IOBJECT_representedType;
               return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
            } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
               return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_e;
                  return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_classAndGenerics(instance, parameters);
               } })).method(caller, cast(OBJECT[])[LOBJECT_className, LOBJECT_genericInstantiations]);
            } })]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Boolean.TMETHOD_or(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])]), CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrow(caller, cast(OBJECT[])[])])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT LOBJECT_subtypeList = CLASSIMPL_List.TMETHOD_empty(caller, cast(OBJECT[])[]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT LOBJECT_firstSubtype = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_firstSubtype;
                     return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_subtypeList;
                     return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_firstSubtype;
                     return (cast(CLASSTYPE_DainaType)instance).IMETHOD_get(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  return caller;
               } })]);
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_forwardSlash(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
                     CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_forwardSlash(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[]);
                        OBJECT LOBJECT_subtype = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_subtype;
                           return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_subtypeList;
                           return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_subtype;
                           return (cast(CLASSTYPE_DainaType)instance).IMETHOD_get(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])]);
                        return caller;
                     } }), LOBJECT_stop]);
                     return caller;
                  } })]);
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = IOBJECT_representedType;
                     return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                     return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_e;
                        return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_disjoint(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_subtypeList]);
                  } })]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  CLASSIMPL_Loops.TMETHOD_until(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_stop = parameters.length > 0 ? parameters[0] : null;
                     CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_subtype = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_subtype;
                           return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_subtypeList;
                           return (cast(CLASSTYPE_List)instance).IMETHOD_append(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_subtype;
                           return (cast(CLASSTYPE_DainaType)instance).IMETHOD_get(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_arrow(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[]);
                           OBJECT LOBJECT_returnType = CLASSIMPL_DainaType.TMETHOD_root(caller, cast(OBJECT[])[]);
                           CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaType.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_returnType;
                                 return (cast(CLASSTYPE_DainaType)instance).IMETHOD_parse(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              return caller;
                           } })]);
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = IOBJECT_representedType;
                              return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                              return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_e;
                                 return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_method(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[LOBJECT_subtypeList, (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_returnType;
                                 return (cast(CLASSTYPE_DainaType)instance).IMETHOD_get(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[])]);
                           } })]);
                           return caller;
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingTypeOrArrowForMethodType(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[])])]);
                           return caller;
                        } })]);
                        (cast(LAMBDA)LOBJECT_stop).method(caller, cast(OBJECT[])[]);
                        return caller;
                     } })]);
                     return caller;
                  } })]);
                  return caller;
               } })]);
               return caller;
            } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  OBJECT instance = LOBJECT_parser;
                  return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
               } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_ampersand(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]);
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_identifier;
                        return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = IOBJECT_representedType;
                        return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                        return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_e;
                           return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_classGeneric(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[LOBJECT_identifier]);
                     } })]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingIdentifierForClassGenericType(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])])]);
                     return caller;
                  } })]);
                  return caller;
               } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                  CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     OBJECT instance = LOBJECT_parser;
                     return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                  } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_percentSign(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]);
                     CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_identifier;
                           return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = IOBJECT_representedType;
                           return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                           return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_e;
                              return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_dataSegment(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[LOBJECT_identifier]);
                        } })]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingIdentifierForDataSegmentType(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])])]);
                        return caller;
                     } })]);
                     return caller;
                  } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                     CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        OBJECT instance = LOBJECT_parser;
                        return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                     } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_doubleApostrophe(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[]);
                        CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_identifier;
                              return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = IOBJECT_representedType;
                              return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                              return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_e;
                                 return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_methodGeneric(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[CLASSIMPL_Natural.TMETHOD_as(caller, cast(OBJECT[])[new WRAP!(string)("0")]), LOBJECT_identifier]);
                           } })]);
                           return caller;
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingIdentifierForMethodGenericType(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[])])]);
                           return caller;
                        } })]);
                        return caller;
                     } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                        CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT instance = LOBJECT_parser;
                           return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                        } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_singleApostrophe(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           OBJECT LOBJECT_count = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextSameTokens(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_singleApostrophe(caller, cast(OBJECT[])[])]);
                           CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_DainaGeneralIdentifier.TMETHOD_isFirstToken(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT LOBJECT_identifier = CLASSIMPL_DainaGeneralIdentifier.TMETHOD_base(caller, cast(OBJECT[])[]);
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_identifier;
                                 return (cast(CLASSTYPE_DainaGeneralIdentifier)instance).IMETHOD_parse(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[LOBJECT_parser]);
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = IOBJECT_representedType;
                                 return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                                 return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_e;
                                    return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_methodGeneric(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[LOBJECT_count, LOBJECT_identifier]);
                              } })]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_parser;
                                 return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingIdentifierForMethodGenericType(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_parser;
                                 return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[])])]);
                              return caller;
                           } })]);
                           return caller;
                        } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                           CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              OBJECT instance = LOBJECT_parser;
                              return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                           } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_questionMark(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_parser;
                                 return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[]);
                              CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 OBJECT instance = LOBJECT_parser;
                                 return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                              } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_asterisk(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_parser;
                                    return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[]);
                                 (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = IOBJECT_representedType;
                                    return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                                    return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                       OBJECT instance = LOBJECT_e;
                                       return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_inferredMethodContext(instance, parameters);
                                    } })).method(caller, cast(OBJECT[])[]);
                                 } })]);
                                 return caller;
                              } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                 CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    OBJECT instance = LOBJECT_parser;
                                    return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                                 } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_colon(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                       OBJECT instance = LOBJECT_parser;
                                       return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                                    } })).method(caller, cast(OBJECT[])[]);
                                    (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                       OBJECT instance = IOBJECT_representedType;
                                       return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                                    } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                       OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                                       return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                          OBJECT instance = LOBJECT_e;
                                          return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_inferredSelfContext(instance, parameters);
                                       } })).method(caller, cast(OBJECT[])[]);
                                    } })]);
                                    return caller;
                                 } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                    CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_isParentIdentifier(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                       OBJECT instance = LOBJECT_parser;
                                       return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                                    } })).method(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                       OBJECT LOBJECT_parentIdentifierToken = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                          OBJECT instance = LOBJECT_parser;
                                          return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
                                       } })).method(caller, cast(OBJECT[])[]);
                                       OBJECT LOBJECT_parentIdentifierNumber = (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                          OBJECT instance = LOBJECT_parentIdentifierToken;
                                          return (cast(CLASSTYPE_Token)instance).IMETHOD_secondId(instance, parameters);
                                       } })).method(caller, cast(OBJECT[])[]);
                                       (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                          OBJECT instance = LOBJECT_parser;
                                          return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
                                       } })).method(caller, cast(OBJECT[])[]);
                                       (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                          OBJECT instance = IOBJECT_representedType;
                                          return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                                       } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                          OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                                          return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                             OBJECT instance = LOBJECT_e;
                                             return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_inferredParentContext(instance, parameters);
                                          } })).method(caller, cast(OBJECT[])[LOBJECT_parentIdentifierNumber]);
                                       } })]);
                                       return caller;
                                    } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                       (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                          OBJECT instance = IOBJECT_representedType;
                                          return (cast(CLASSTYPE_Variable)instance).IMETHOD_set(instance, parameters);
                                       } })).method(caller, cast(OBJECT[])[(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                          OBJECT LOBJECT_e = parameters.length > 0 ? parameters[0] : null;
                                          return (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                                             OBJECT instance = LOBJECT_e;
                                             return (cast(CLASSTYPE_DainaTypeEnum)instance).IMETHOD_inferred(instance, parameters);
                                          } })).method(caller, cast(OBJECT[])[]);
                                       } })]);
                                       return caller;
                                    } })]);
                                    return caller;
                                 } })]);
                                 return caller;
                              } })]);
                              return caller;
                           } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
                              return caller;
                           } })]);
                           return caller;
                        } })]);
                        return caller;
                     } })]);
                     return caller;
                  } })]);
                  return caller;
               } })]);
               return caller;
            } })]);
            return caller;
         } })]);
         CLASSIMPL_O.TMETHOD_ifElse(caller, cast(OBJECT[])[CLASSIMPL_Token.TMETHOD_equals(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_token(instance, parameters);
         } })).method(caller, cast(OBJECT[])[]), CLASSIMPL_Token.TMETHOD_squareBracketClose(caller, cast(OBJECT[])[])]), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_gotoNextToken(instance, parameters);
            } })).method(caller, cast(OBJECT[])[]);
            return caller;
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
            } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingClosingBracketForType(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
               OBJECT instance = LOBJECT_parser;
               return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
            } })).method(caller, cast(OBJECT[])[])])]);
            return caller;
         } })]);
         return caller;
      } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_addError(instance, parameters);
         } })).method(caller, cast(OBJECT[])[CLASSIMPL_Error.TMETHOD_expectingType(caller, cast(OBJECT[])[(cast(LAMBDA)(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            OBJECT instance = LOBJECT_parser;
            return (cast(CLASSTYPE_Parser)instance).IMETHOD_position(instance, parameters);
         } })).method(caller, cast(OBJECT[])[])])]);
         return caller;
      } })]);
      return caller;
   }
}

