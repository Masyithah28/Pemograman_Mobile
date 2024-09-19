void main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);

  //Langkah ke 3
  var list1 = [1, 2, null];
  print(list1);
  var list3 = [
    0,
    ...list1.where((item) => item != null)
  ]; // Menghilangkan elemen null
  print(list3.length);

  //Langkah ke 3 - Menambahkan NIM menggunakan Spread Operators
  var nimList = ['2241720011'];
  var finalList = [...list3, ...nimList];
  print(finalList);
  print(finalList.length);

  //Langkah ke 4
  bool promoActive = true; 
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);
  promoActive = false; 
  nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  //Langkah ke 5
  var login = 'CEO';
  var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print(nav2);
 //Langkah ke 6 
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}