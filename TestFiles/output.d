/* *** HEADER *** */
interface OBJECT {}
interface LAMBDA {
   OBJECT method(OBJECT caller, OBJECT[] parameters);
}

/* *** ENTRY POINT CLASS *** */
void main() {
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
   override OBJECT parseNextCommandAndSendToReceiverWithCommandStringSegmentProvider(OBJECT caller, OBJECT[] parameters){return parameters[0];}
   override OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters){return parameters[0];}
}

/* *** CLASS: DainaCommandStrings *** */
interface CLASSTYPE_DainaCommandStrings : OBJECT, LAMBDA {
}
class CLASSIMP_DainaCommandStrings : CLASSTYPE_DainaCommandStrings {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
}

/* *** CLASS: DainaCommandDescriptionStrings *** */
interface CLASSTYPE_DainaCommandDescriptionStrings : OBJECT, LAMBDA {
}
class CLASSIMP_DainaCommandDescriptionStrings : CLASSTYPE_DainaCommandDescriptionStrings {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
}

/* *** CLASS: ValidDainaCommandsToParse *** */
interface CLASSTYPE_ValidDainaCommandsToParse : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters);
   OBJECT maybeParsingActionForCommandStringIfValidDainaCommand(OBJECT caller, OBJECT[] parameters);
   OBJECT addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMP_ValidDainaCommandsToParse : CLASSTYPE_ValidDainaCommandsToParse {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   override OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters){return parameters[0];}
   override OBJECT maybeParsingActionForCommandStringIfValidDainaCommand(OBJECT caller, OBJECT[] parameters){return parameters[0];}
   override OBJECT addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(OBJECT caller, OBJECT[] parameters){return parameters[0];}
}

/* *** CLASS: DainaCommandParsingAction *** */
interface CLASSTYPE_DainaCommandParsingAction : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMP_DainaCommandParsingAction : CLASSTYPE_DainaCommandParsingAction {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   override OBJECT performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT caller, OBJECT[] parameters){return parameters[0];}
}

