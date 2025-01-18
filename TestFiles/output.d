class OBJECT{}

void main() {
}

interface CLASSTYPE_DainaCommandParser {
   OBJECT parseNextCommandAndSendToReceiverWithCommandStringSegmentProvider(OBJECT[] parameters);
   OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT[] parameters);
}

class CLASSIMP_DainaCommandParser : OBJECT, CLASSTYPE_DainaCommandParser, CLASSTYPE_Object {
   override OBJECT parseNextCommandAndSendToReceiverWithCommandStringSegmentProvider(OBJECT[] parameters){return parameters[0];}
   override OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT[] parameters){return parameters[0];}
}

interface CLASSTYPE_DainaCommandStrings {
}

class CLASSIMP_DainaCommandStrings : OBJECT, CLASSTYPE_DainaCommandStrings {
}

interface CLASSTYPE_DainaCommandDescriptionStrings {
}

class CLASSIMP_DainaCommandDescriptionStrings : OBJECT, CLASSTYPE_DainaCommandDescriptionStrings {
}

interface CLASSTYPE_ValidDainaCommandsToParse {
   OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT[] parameters);
   OBJECT maybeParsingActionForCommandStringIfValidDainaCommand(OBJECT[] parameters);
   OBJECT addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(OBJECT[] parameters);
}

class CLASSIMP_ValidDainaCommandsToParse : OBJECT, CLASSTYPE_ValidDainaCommandsToParse, CLASSTYPE_Object {
   override OBJECT getUsageDescriptionOfValidDainaCommands(OBJECT[] parameters){return parameters[0];}
   override OBJECT maybeParsingActionForCommandStringIfValidDainaCommand(OBJECT[] parameters){return parameters[0];}
   override OBJECT addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(OBJECT[] parameters){return parameters[0];}
}

interface CLASSTYPE_DainaCommandParsingAction {
   OBJECT performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT[] parameters);
}

class CLASSIMP_DainaCommandParsingAction : OBJECT, CLASSTYPE_DainaCommandParsingAction, CLASSTYPE_Object {
   override OBJECT performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT[] parameters){return parameters[0];}
}

