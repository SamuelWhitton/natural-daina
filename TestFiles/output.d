/* *** HEADER *** */
interface OBJECT {}
interface LAMBDA {
   OBJECT method(OBJECT caller, OBJECT[] parameters);
}

/* *** ENTRY POINT CLASS *** */
void main() { ENTRY_POINT_CLASS.entryPointMethod(null, []); }
class ENTRY_POINT_CLASS {
   static OBJECT entryPointMethod(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
}

/* *** CLASS: Object *** */
interface CLASSTYPE_Object : OBJECT, LAMBDA {
}
class CLASSIMP_Object : CLASSTYPE_Object {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
}

/* *** CLASS: DainaCommandParser *** */
interface CLASSTYPE_DainaCommandParser : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT parseNextCommandAndSendToReceiverWithCommandStringSegmentProvider(OBJECT caller, OBJECT[] parameters);
   OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMP_DainaCommandParser : CLASSTYPE_DainaCommandParser {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT newDainaCommandParser(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   override OBJECT parseNextCommandAndSendToReceiverWithCommandStringSegmentProvider(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   override OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
}

/* *** CLASS: DainaCommandStrings *** */
interface CLASSTYPE_DainaCommandStrings : OBJECT, LAMBDA {
}
class CLASSIMP_DainaCommandStrings : CLASSTYPE_DainaCommandStrings {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_AND_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT PARSE_DAINA_SOURCE_FILE_IN_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT ANALYSE_AND_SYNTHESISE_SYNTAX_TREE(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT COMPILE_INTO_JAVA_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT COMPILE_INTO_C_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
}

/* *** CLASS: DainaCommandDescriptionStrings *** */
interface CLASSTYPE_DainaCommandDescriptionStrings : OBJECT, LAMBDA {
}
class CLASSIMP_DainaCommandDescriptionStrings : CLASSTYPE_DainaCommandDescriptionStrings {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_AND_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT PARSE_DAINA_SOURCE_FILE_IN_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT ANALYSE_AND_SYNTHESISE_SYNTAX_TREE(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT COMPILE_INTO_JAVA_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT COMPILE_INTO_C_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
}

/* *** CLASS: ValidDainaCommandsToParse *** */
interface CLASSTYPE_ValidDainaCommandsToParse : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters);
   OBJECT maybeParsingActionForCommandStringIfValidDainaCommand(OBJECT caller, OBJECT[] parameters);
   OBJECT addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMP_ValidDainaCommandsToParse : CLASSTYPE_ValidDainaCommandsToParse {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT emptyListOfValidDainaCommandsToParse(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   override OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   override OBJECT maybeParsingActionForCommandStringIfValidDainaCommand(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   override OBJECT addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
}

/* *** CLASS: DainaCommandParsingAction *** */
interface CLASSTYPE_DainaCommandParsingAction : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMP_DainaCommandParsingAction : CLASSTYPE_DainaCommandParsingAction {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   override OBJECT performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT parseCommandToParseDainaSourceFileInExposedNamespace(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT parseCommandToParseDainaSourceFileInExposedAndPrivateNamespace(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT parseCommandToParseDainaSourceFileInPrivateNamespace(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT parseCommandToAnalyseAndSynthesiseSyntaxTree(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT parseCommandToCompileIntoJavaWithinDirectory(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT parseCommandToCompileIntoCWithinDirectory(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
   static OBJECT parseInvalidCommand(OBJECT caller, OBJECT[] parameters) {
      return caller;
   }
}

