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
      ASSIGNIMETHOD_asdf = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return null;
      } });
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
         OBJECT LOBJECT_validDainaCommandsToParse = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_ValidDainaCommandsToParse.TMETHOD_emptyListOfValidDainaCommandsToParse(caller, parameters);
         } }).method(caller, []);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_validDainaCommandsToParse;
            return instance.IMETHOD_addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(instance, parameters);
         } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandStrings.TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_NAMESPACE(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandParsingAction.TMETHOD_parseCommandToParseDainaSourceFileInExposedNamespace(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandDescriptionStrings.TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_NAMESPACE(caller, parameters);
         } }).method(caller, [])]);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_validDainaCommandsToParse;
            return instance.IMETHOD_addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(instance, parameters);
         } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandStrings.TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_AND_PRIVATE_NAMESPACE(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandParsingAction.TMETHOD_parseCommandToParseDainaSourceFileInExposedAndPrivateNamespace(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandDescriptionStrings.TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_AND_PRIVATE_NAMESPACE(caller, parameters);
         } }).method(caller, [])]);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_validDainaCommandsToParse;
            return instance.IMETHOD_addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(instance, parameters);
         } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandStrings.TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_PRIVATE_NAMESPACE(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandParsingAction.TMETHOD_parseCommandToParseDainaSourceFileInPrivateNamespace(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandDescriptionStrings.TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_PRIVATE_NAMESPACE(caller, parameters);
         } }).method(caller, [])]);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_validDainaCommandsToParse;
            return instance.IMETHOD_addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(instance, parameters);
         } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandStrings.TMETHOD_ANALYSE_AND_SYNTHESISE_SYNTAX_TREE(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandParsingAction.TMETHOD_parseCommandToAnalyseAndSynthesiseSyntaxTree(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandDescriptionStrings.TMETHOD_ANALYSE_AND_SYNTHESISE_SYNTAX_TREE(caller, parameters);
         } }).method(caller, [])]);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_validDainaCommandsToParse;
            return instance.IMETHOD_addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(instance, parameters);
         } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandStrings.TMETHOD_COMPILE_INTO_JAVA_WITHIN_DIRECTORY(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandParsingAction.TMETHOD_parseCommandToCompileIntoJavaWithinDirectory(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandDescriptionStrings.TMETHOD_COMPILE_INTO_JAVA_WITHIN_DIRECTORY(caller, parameters);
         } }).method(caller, [])]);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_validDainaCommandsToParse;
            return instance.IMETHOD_addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(instance, parameters);
         } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandStrings.TMETHOD_COMPILE_INTO_C_WITHIN_DIRECTORY(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandParsingAction.TMETHOD_parseCommandToCompileIntoCWithinDirectory(caller, parameters);
         } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandDescriptionStrings.TMETHOD_COMPILE_INTO_C_WITHIN_DIRECTORY(caller, parameters);
         } }).method(caller, [])]);
         INTERNAL STATEMENT ERROR!!!
         return caller;
      } }).method(caller, []);
   }
   override OBJECT IMETHOD_parseNextCommandAndSendToReceiverWithCommandStringSegmentProvider(OBJECT caller, OBJECT[] parameters) {
      OBJECT LOBJECT_nextCommandString = LOBJECT_commandStringSegmentProvider.method(caller, []);
      OBJECT LOBJECT_nextCommandStringIsEmpty = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         LAMBDA instance = LOBJECT_nextCommandString;
         return instance.IMETHOD_isEqualTo(instance, parameters);
      } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newStringFromLiteral(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>])]);
      (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         LAMBDA instance = LOBJECT_nextCommandStringIsEmpty;
         return instance.IMETHOD_ifFalse(instance, parameters);
      } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_maybeParsingActionForCommandString = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = <INTERNAL EXPRESSION ERROR!!!>;
            return instance.IMETHOD_maybeParsingActionForCommandStringIfValidDainaCommand(instance, parameters);
         } }).method(caller, [LOBJECT_nextCommandString]);
         OBJECT LOBJECT_parsingActionForCommandString = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_ControlFlow.TMETHOD_selectWithSelectorOrDefault(caller, parameters);
         } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_maybeParsingActionForCommandString;
            return instance.IMETHOD_ifJust(instance, parameters);
         } }), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaCommandParsingAction.TMETHOD_parseInvalidCommand(caller, parameters);
         } })]);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_parsingActionForCommandString;
            return instance.IMETHOD_performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(instance, parameters);
         } }).method(caller, [LOBJECT_commandStringSegmentProvider, LOBJECT_dainaCommandReceiver]);
         return null;
      } })]);
      return null;
   }
   override OBJECT IMETHOD_getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         LAMBDA instance = <INTERNAL EXPRESSION ERROR!!!>;
         return instance.IMETHOD_getUsageDescriptionOfValidDainaCommands(instance, parameters);
      } }).method(caller, []);
   }
}

/* *** CLASS: DainaCommandStrings *** */
interface CLASSTYPE_DainaCommandStrings : OBJECT, LAMBDA {
}
class CLASSIMPL_DainaCommandStrings : CLASSTYPE_DainaCommandStrings {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_AND_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_ANALYSE_AND_SYNTHESISE_SYNTAX_TREE(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_COMPILE_INTO_JAVA_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_COMPILE_INTO_C_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
}

/* *** CLASS: DainaCommandDescriptionStrings *** */
interface CLASSTYPE_DainaCommandDescriptionStrings : OBJECT, LAMBDA {
}
class CLASSIMPL_DainaCommandDescriptionStrings : CLASSTYPE_DainaCommandDescriptionStrings {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_EXPOSED_AND_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_PARSE_DAINA_SOURCE_FILE_IN_PRIVATE_NAMESPACE(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_ANALYSE_AND_SYNTHESISE_SYNTAX_TREE(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_COMPILE_INTO_JAVA_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
   }
   static OBJECT TMETHOD_COMPILE_INTO_C_WITHIN_DIRECTORY(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newString(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
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
      PARENT_1.CMETHOD_newObject(PARENT_1, []);
      IOBJECT_usageDescriptionOfAllValidCommands = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Variable.TMETHOD_as(caller, parameters);
      } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_String.TMETHOD_newStringFromLiteral(caller, parameters);
      } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>])]);
      IOBJECT_mappingOfValidCommandStringToParsingAction = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Mapping.TMETHOD_newEmptyMapping(caller, parameters);
      } }).method(caller, []);
      return null;
   }
   override OBJECT IMETHOD_getUsageDescriptionOfValidDainaCommands(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         LAMBDA instance = <INTERNAL EXPRESSION ERROR!!!>;
         return instance.IMETHOD_get(instance, parameters);
      } }).method(caller, []);
   }
   override OBJECT IMETHOD_maybeParsingActionForCommandStringIfValidDainaCommand(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         LAMBDA instance = <INTERNAL EXPRESSION ERROR!!!>;
         return instance.IMETHOD_maybeRetriveMappedValueWithKey(instance, parameters);
      } }).method(caller, [LOBJECT_commandStringInQuestion]);
   }
   override OBJECT IMETHOD_addValidDainaCommandForCommandStringAndParsingActionAndDescriptionOfCommand(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_currentDescriptionOfAllValidCommands = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = <INTERNAL EXPRESSION ERROR!!!>;
            return instance.IMETHOD_get(instance, parameters);
         } }).method(caller, []);
         OBJECT LOBJECT_newLineAndTab = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_String.TMETHOD_newStringFromLiteral(caller, parameters);
         } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
         OBJECT LOBJECT_colonAndSpace = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_String.TMETHOD_newStringFromLiteral(caller, parameters);
         } }).method(caller, [<INTERNAL EXPRESSION ERROR!!!>]);
         OBJECT LOBJECT_usageDescriptionOfCommand = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_commandString;
            return instance.IMETHOD_stringByAppendingString(instance, parameters);
         } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_colonAndSpace;
            return instance.IMETHOD_stringByAppendingString(instance, parameters);
         } }).method(caller, [LOBJECT_descriptionOfCommand])]);
         INTERNAL STATEMENT ERROR!!!
         return caller;
      } }).method(caller, []);
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
      PARENT_1.CMETHOD_newObject(PARENT_1, []);
      IOBJECT_parsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver = LOBJECT_parsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver;
      return null;
   }
   override OBJECT IMETHOD_performActionWithCommandStringSegmentProviderAndThenSendCommandToReceiver(OBJECT caller, OBJECT[] parameters) {
      <INTERNAL EXPRESSION ERROR!!!>.method(caller, [LOBJECT_commandStringSegmentProvider, LOBJECT_dainaCommandReceiver]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToParseDainaSourceFileInExposedNamespace(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_exposedNamespace = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaNamespaceReference.TMETHOD_referToExposedNamespace(caller, parameters);
         } }).method(caller, []);
         OBJECT LOBJECT_dainaSourceFilePath = LOBJECT_getNextCommandStringSegment.method(caller, []);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_dainaCommandReceiver;
            return instance.IMETHOD_receiveCommandToParseDainaSourceFileWithPathAndNamespaceSelection(instance, parameters);
         } }).method(caller, [LOBJECT_dainaSourceFilePath, LOBJECT_exposedNamespace]);
         return null;
      } })]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToParseDainaSourceFileInExposedAndPrivateNamespace(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_privateAndExposedNamespace = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaNamespaceReference.TMETHOD_referToExposedNamespaceAndPrivateNamespaceWithName(caller, parameters);
         } }).method(caller, [LOBJECT_getNextCommandStringSegment.method(caller, [])]);
         OBJECT LOBJECT_dainaSourceFilePath = LOBJECT_getNextCommandStringSegment.method(caller, []);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_dainaCommandReceiver;
            return instance.IMETHOD_receiveCommandToParseDainaSourceFileWithPathAndNamespaceSelection(instance, parameters);
         } }).method(caller, [LOBJECT_dainaSourceFilePath, LOBJECT_privateAndExposedNamespace]);
         return null;
      } })]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToParseDainaSourceFileInPrivateNamespace(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT LOBJECT_privateNamespace = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            return CLASSIMPL_DainaNamespaceReference.TMETHOD_referToPrivateNamespaceWithName(caller, parameters);
         } }).method(caller, [LOBJECT_getNextCommandStringSegment.method(caller, [])]);
         OBJECT LOBJECT_dainaSourceFilePath = LOBJECT_getNextCommandStringSegment.method(caller, []);
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_dainaCommandReceiver;
            return instance.IMETHOD_receiveCommandToParseDainaSourceFileWithPathAndNamespaceSelection(instance, parameters);
         } }).method(caller, [LOBJECT_dainaSourceFilePath, LOBJECT_privateNamespace]);
         return null;
      } })]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToAnalyseAndSynthesiseSyntaxTree(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_dainaCommandReceiver;
            return instance.IMETHOD_receiveCommandToAnalyseAndSynthesiseSyntaxTree(instance, parameters);
         } }).method(caller, []);
         return null;
      } })]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToCompileIntoJavaWithinDirectory(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_dainaCommandReceiver;
            return instance.IMETHOD_receiveCommandToCompileIntoJavaWithinDirectory(instance, parameters);
         } }).method(caller, [LOBJECT_getNextCommandStringSegment.method(caller, [])]);
         return null;
      } })]);
      return null;
   }
   static OBJECT CMETHOD_parseCommandToCompileIntoCWithinDirectory(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_dainaCommandReceiver;
            return instance.IMETHOD_receiveCommandToCompileIntoCWithinDirectory(instance, parameters);
         } }).method(caller, [LOBJECT_getNextCommandStringSegment.method(caller, [])]);
         return null;
      } })]);
      return null;
   }
   static OBJECT CMETHOD_parseInvalidCommand(OBJECT caller, OBJECT[] parameters) {
      PARENT_1.CMETHOD_newParsingActionUsingParsingActionToParseCommandWithCommandStringSegmentProviderAndThenSendCommandToReceiver(PARENT_1, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
            LAMBDA instance = LOBJECT_dainaCommandReceiver;
            return instance.IMETHOD_receiveInvalidCommand(instance, parameters);
         } }).method(caller, []);
         return null;
      } })]);
      return null;
   }
}

