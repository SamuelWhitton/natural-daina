/* *** HEADER *** */
interface OBJECT {}
class WRAP(E) : OBJECT { E it; this(E v) {this.it = v;} }
interface LAMBDA {
   OBJECT method(OBJECT caller, OBJECT[] parameters);
}

