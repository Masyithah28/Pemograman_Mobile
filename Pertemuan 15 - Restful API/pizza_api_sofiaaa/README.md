# Praktikum 14 - Restful API            
Nama    : Masyithah Sophia Damayanti        
Kelas   : TI-3C         
No      : 15            
NIM     : 2241720011        

## Praktikum 1, Designing an HTTP client and getting data       

### Mendaftarlah ke layanan Lab Mock di https://app.wiremock.cloud/. Bisa anda gunakan akun google untuk mendaftar. Jika berhasil bendaftar dan login, akan muncul seperti gambar berikut.                  

### Di halaman dahsboard, klik menu Stubs, kemudian klik entri pertama yaitu “GET a JSON resource”. Anda akan melihat layar yang mirip dengan berikut.      

### Klik “Create new stub”. Di kolom sebelah kanan, lengkapi data berikut. Namanya adalah “Pizza List”, kemudian pilih GET dan isi dengan “/pizzalist”. Kemudian, pada bagian Response, untuk status 200, kemudian pada Body pilih JSON sebagai formatnya dan isi konten JSON dari https://bit.ly/pizzalist. Perhatikan gambar berikut.             
Hasil:                  
![alt text](image.png)              

### Tekan tombol SAVE di bagian bawah halaman untuk menyimpan Mock ini. Jika berhasil tersimpan, maka Mock API sudah siap digunakan.        

### Buatlah project flutter baru dengan nama pizza_api_nama_anda, tambahkan depedensi “http” melalui terminal.      
Hasil: 
![alt text](images/P1L5.png)        

### DI folder “lib” project anda, tambahkan file dengan nama “httphelper.dart”.         
Hasil:                 
![alt text](images/P1L6.png)            

### Isi httphelper.dart dengan kode berikut. Ubah “02z2g.mocklab.io” dengan URL Mock API anda.      
``` dart        
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';    
import 'pizza.dart';   

class HttpHelper {
  final String authority = '5orj4.wiremockapi.cloud'; 
  final String path = 'pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path); 
    final http.Response result = await http.get(url);
    
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body) as List;
      
      List<Pizza> pizzas = jsonResponse.map<Pizza>((i) =>
        Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }
}

```     
### Di file “main.dart”, di class _ MyHomePageState, tambahkan metode bernama “callPizzas”. Metode ini mengembalikan sebuah Future dari daftar objek Pizza dengan memanggil metode getPizzaList dari kelas HttpHelper, dengan kode sebagai berikut:     
``` dart        
Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    return await helper.getPizzaList();
  }     
```     

### Pada metode build di class _MyHomePageState, di dalam body Scaffold, tambahkan FutureBuilder yang membuat ListView dari widget ListTile yang berisi objek Pizza:        
``` dart        
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: FutureBuilder<List<Pizza>>(
        future: callPizzas(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text(snapshot.data![position].pizzaName),
                subtitle: Text(
                  '${snapshot.data![position].description} - \$${snapshot.data![position].price.toString()}',
                ),
              );
            },
          );
        },
      ),
    );
  }
```     
### Jalankan aplikasi. Anda akan melihat layar yang mirip dengan berikut ini:       
![alt text](images/Prak1.png)           

