void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record); 

  var test = (5,6);
  var ditukar = tukar(test);
  print(ditukar);
  //Langkah 5
  var mahasiswa = ('Masyithah Sophia Damayanti', 2241720011);
  print(mahasiswa); 
  // langkah 6
 var mahasiswa2 = ('Masyithah Sophia Damayanti', a: 2241720011, b: true, 'last');
  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}