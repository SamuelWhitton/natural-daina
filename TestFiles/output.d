/* *** HEADER *** */
interface OBJECT {}
interface LAMBDA {
   OBJECT method(OBJECT caller, OBJECT[] parameters);
}

/* *** ENTRY POINT CLASS *** */
void main() { ENTRY_POINT_CLASS.entryPointMethod(null, []); }
class ENTRY_POINT_CLASS {
   static OBJECT entryPointMethod(OBJECT caller, OBJECT[] parameters) {
      return null;
   }
}

/* *** CLASS: Object *** */
interface CLASSTYPE_Object : OBJECT, LAMBDA {
   OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Object : CLASSTYPE_Object {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private LAMBDA ASSIGNIMETHOD_asdf = null;
   override OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters) {
      return ASSIGNIMETHOD_asdf.method(caller, parameters);
   }
   static OBJECT CMETHOD_testconstr(OBJECT caller, OBJECT[] parameters) {
      ASSIGNIMETHOD_asdf = <INTERNAL EXPRESSION ERROR!!!>;
      return null;
   }
}

/* *** CLASS: DainaCommandParser *** */
interface CLASSTYPE_DainaCommandParser : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT IMETHOD_parseNextCommandAndSendToReceiverWithCommandStringSegmentProvider(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaCommandParser : CLASSTYPE_DainaCommandParser {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private CLASSTYPE_Object PARENT_1 = new CLASSIMPL_Object();
   private OBJECT IOBJECT_validDainaCommandsToParse = null;
   override OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_asdf(caller, parameters); }
   static OBJECT CMETHOD_newDainaCommandParser(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_validDainaCommandsToParse = <INTERNAL EXPRESSION ERROR!!!>;
         <INTERNAL EXPRESSION ERROR!!!>;
         <INTERNAL EXPRESSION ERROR!!!>;
         <INTERNAL EXPRESSION ERROR!!!>;
         <INTERNAL EXPRESSION ERROR!!!>;
         <INTERNAL EXPRESSION ERROR!!!>;
         <INTERNAL EXPRESSION ERROR!!!>;
         INTERNAL STATEMENT ERROR!!!
         return caller;
      } }).method(caller, parameters);
   }
   override OBJECT IMETHOD_parseNextCommandAndSendToReceiverWithCommandStringSegmentProvider(OBJECT caller, OBJECT[] parameters) {
      OBJECT LOBJECT_nextCommandString = <INTERNAL EXPRESSION ERROR!!!>;
      OBJECT LOBJECT_nextCommandStringIsEmpty = <INTERNAL EXPRESSION ERROR!!!>;
      <INTERNAL EXPRESSION ERROR!!!>;
      return null;
   }
   override OBJECT IMETHOD_getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
}

/* *** CLASS: DainaCommandStrings *** */
interface CLASSTYPE_DainaCommandStrings : OBJECT, LAMBDA {
}
class CLASSIMPL_DainaCommandStrings : CLASSTYPE_DainaCommandStrings {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_AND_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_ANALYSE_AND_SYNTHESISE_SYNTAX_TREE(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_COMPILE_INTO_JAVA_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_COMPILE_INTO_C_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
}

/* *** CLASS: DainaCommandDescriptionStrings *** */
interface CLASSTYPE_DainaCommandDescriptionStrings : OBJECT, LAMBDA {
}
class CLASSIMPL_DainaCommandDescriptionStrings : CLASSTYPE_DainaCommandDescriptionStrings {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_AND_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_ANALYSE_AND_SYNTHESISE_SYNTAX_TREE(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_COMPILE_INTO_JAVA_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   static OBJECT TMETHOD_COMPILE_INTO_C_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
}

/* *** CLASS: ValidDainaCommandsToParse *** */
interface CLASSTYPE_ValidDainaCommandsToParse : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT IMETHOD_getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_maybeParsingActionForCommandStringIfValidDainaCommand(OBJECT caller, OBJECT[] parameters);
   OBJECT IMETHOD_addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_ValidDainaCommandsToParse : CLASSTYPE_ValidDainaCommandsToParse {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private CLASSTYPE_Object PARENT_1 = new CLASSIMPL_Object();
   private OBJECT IOBJECT_mappingOfValidCommandStringToParsingAction = null;
   private OBJECT IOBJECT_usageDescriptionOfAllValidCommands = null;
   override OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_asdf(caller, parameters); }
   static OBJECT CMETHOD_emptyListOfValidDainaCommandsToParse(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newObject(PARENT_1, [<inputs>]);
      IOBJECT_usageDescriptionOfAllValidCommands = <INTERNAL EXPRESSION ERROR!!!>;
      IOBJECT_mappingOfValidCommandStringToParsingAction = <INTERNAL EXPRESSION ERROR!!!>;
      return null;
   }
   override OBJECT IMETHOD_getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   override OBJECT IMETHOD_maybeParsingActionForCommandStringIfValidDainaCommand(OBJECT caller, OBJECT[] parameters) {
      return <INTERNAL EXPRESSION ERROR!!!>;
   }
   override OBJECT IMETHOD_addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_currentDescriptionOfAllValidCommands = <INTERNAL EXPRESSION ERROR!!!>;
         OBJECT LOBJECT_newLineAndTab = <INTERNAL EXPRESSION ERROR!!!>;
         OBJECT LOBJECT_colonAndSpace = <INTERNAL EXPRESSION ERROR!!!>;
         OBJECT LOBJECT_usageDescriptionOfCommand = <INTERNAL EXPRESSION ERROR!!!>;
         INTERNAL STATEMENT ERROR!!!
         return caller;
      } }).method(caller, parameters);
   }
}

/* *** CLASS: DainaCommandParsingAction *** */
interface CLASSTYPE_DainaCommandParsingAction : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT IMETHOD_performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_DainaCommandParsingAction : CLASSTYPE_DainaCommandParsingAction {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private CLASSTYPE_Object PARENT_1 = new CLASSIMPL_Object();
   private OBJECT IOBJECT_parsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver = null;
   override OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_asdf(caller, parameters); }
   static OBJECT CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newObject(PARENT_1, [<inputs>]);
      IOBJECT_parsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver = LOBJECT_parsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver;
      return null;
   }
   override OBJECT IMETHOD_performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT caller, OBJECT[] parameters) {
      <INTERNAL EXPRESSION ERROR!!!>;
      return null;
   }
   static OBJECT CMETHOD_parseCommandToParseDainaSourceFileInExposedNamespace(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [<inputs><INTERNAL EXPRESSION ERROR!!!>]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToParseDainaSourceFileInExposedAndPrivateNamespace(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [<inputs><INTERNAL EXPRESSION ERROR!!!>]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToParseDainaSourceFileInPrivateNamespace(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [<inputs><INTERNAL EXPRESSION ERROR!!!>]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToAnalyseAndSynthesiseSyntaxTree(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [<inputs><INTERNAL EXPRESSION ERROR!!!>]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToCompileIntoJavaWithinDirectory(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [<inputs><INTERNAL EXPRESSION ERROR!!!>]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToCompileIntoCWithinDirectory(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [<inputs><INTERNAL EXPRESSION ERROR!!!>]);
      return null;
   }
   static OBJECT CMETHOD_parseInvalidCommand(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [<inputs><INTERNAL EXPRESSION ERROR!!!>]);
      return null;
   }
}

