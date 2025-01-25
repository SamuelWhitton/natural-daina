/* *** HEADER *** */
interface OBJECT {}
interface LAMBDA {
   OBJECT method(OBJECT caller, OBJECT[] parameters);
}

/* *** ENTRY POINT CLASS *** */
void main() { ENTRY_POINT_CLASS.entryPointMethod(null, []); }
class ENTRY_POINT_CLASS {
   static OBJECT entryPointMethod(OBJECT caller, OBJECT[] parameters) {
      OBJECT LOBJECT_two = (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Integer.TMETHOD_add(caller, parameters);
      } }).method(caller, [(new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Integer.TMETHOD_one(caller, parameters);
      } }).method(caller, []), (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Integer.TMETHOD_one(caller, parameters);
      } }).method(caller, [])]);
      (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         OBJECT instance = LOBJECT_two;
         return instance.IMETHOD_debugPrint(instance, parameters);
      } }).method(caller, []);
      return null;
   }
}

/* *** CLASS: Integer *** */
interface CLASSTYPE_Integer : OBJECT, LAMBDA, CLASSTYPE_Object {
   OBJECT IMETHOD_debugPrint(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Integer : CLASSTYPE_Integer {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   private CLASSTYPE_Object PARENT_1 = new CLASSIMPL_Object();
   override OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters) { return PARENT_1.IMETHOD_asdf(caller, parameters); }
   static OBJECT TMETHOD_zero(OBJECT caller, OBJECT[] parameters) { OBJECT newInstance = new CLASSIMPL_Integer(); CMETHOD_zero(newInstance, parameters); return newInstance; }
   static OBJECT CMETHOD_zero(OBJECT caller, OBJECT[] parameters) {
      return null;
   }
   static OBJECT TMETHOD_one(OBJECT caller, OBJECT[] parameters) { OBJECT newInstance = new CLASSIMPL_Integer(); CMETHOD_one(newInstance, parameters); return newInstance; }
   static OBJECT CMETHOD_one(OBJECT caller, OBJECT[] parameters) {
      (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         CLASSIMPL_Integer self = cast(CLASSIMPL_Integer)caller;
         OBJECT instance = self;
         return self.IMETHOD_debugPrint(instance, parameters);
      } }).method(caller, []);
      (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         CLASSIMPL_Integer self = cast(CLASSIMPL_Integer)caller;
         OBJECT instance = self.PARENT_1;
         return self.PARENT_1.IMETHOD_asdf(instance, parameters);
      } }).method(caller, []);
      return null;
   }
   static OBJECT TMETHOD_add(OBJECT caller, OBJECT[] parameters) {
      return (new class OBJECT, LAMBDA { override OBJECT method(OBJECT caller, OBJECT[] parameters) {
         return CLASSIMPL_Integer.TMETHOD_one(caller, parameters);
      } }).method(caller, []);
   }
   override OBJECT IMETHOD_debugPrint(OBJECT caller, OBJECT[] parameters) {
      return null;
   }
}

/* *** CLASS: Object *** */
interface CLASSTYPE_Object : OBJECT, LAMBDA {
   OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters);
}
class CLASSIMPL_Object : CLASSTYPE_Object {
   override OBJECT method(OBJECT caller, OBJECT[] parameters) { return caller; }
   override OBJECT IMETHOD_asdf(OBJECT caller, OBJECT[] parameters) {
      return null;
   }
}

