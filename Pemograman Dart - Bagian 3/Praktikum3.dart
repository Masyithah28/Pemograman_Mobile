void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {}; 
  names1.add("Masyithah Sophia Damayanti");  
  names1.add("2241720011");  

  names2.addAll({"Masyithah Sophia Damayanti", "2241720011"}); 
  print(names1);
  print(names2);

  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  gifts['nama'] = 'Masyithah Sophia Damayanti'; 
  gifts['NIM'] = '2241720011'; 

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon'
  };

  nobleGases[1] = 'Masyithah Sophia Damayanti'; 
  nobleGases[3] = '2241720011';  

  var mhs1 = Map<String, String>();
  mhs1['nama'] = 'Masyithah Sophia Damayanti';  
  mhs1['NIM'] = '2241720011';   

  var mhs2 = Map<int, String>();
  mhs2[1] = 'Masyithah Sophia Damayanti';  
  mhs2[2] = '2241720011';  

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
