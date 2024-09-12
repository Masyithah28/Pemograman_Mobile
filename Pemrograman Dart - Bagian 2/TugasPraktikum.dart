 void main() {
  // Nama lengkap dan NIM
  const namaLengkap = 'Masyithah Sophia Damayanti';
  const nim = '2241720011';
  
  // Fungsi untuk memeriksa apakah sebuah angka adalah bilangan prima
  bool isPrime(int number) {
    if (number <= 1) return false;
    if (number <= 3) return true;
    if (number % 2 == 0 || number % 3 == 0) return false;
    
    for (int i = 5; i * i <= number; i += 6) {
      if (number % i == 0 || number % (i + 2) == 0) return false;
    }
    
    return true;
  }

  // Menampilkan bilangan prima dari 0 sampai 201
  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print('Bilangan Prima: $i');
      print('Nama Lengkap: $namaLengkap');
      print('NIM: $nim');
      print('---');
    }
  }
}