import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late File myFile;
  String fileText = '';
  String documentsPath='';
  String tempPath = '';

  Future getPaths() async{
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  @override
  void initState(){
    super.initState();
    getPaths().then((_){
      myFile = File('$documentsPath/pizzas.txt');
      writeFile();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Doc path: $documentsPath'),
          Text('Temp path $tempPath'),
          ElevatedButton(
            onPressed: () => readFile(), 
            child: const Text('Read File')
          ),
          Text(fileText),
        ],
      ),
    );
  }

  Future<bool> writeFile() async{
    try{
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    }catch(e){
      return false;
    }
  }

  Future<bool> readFile() async{
    try{
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText =fileContent;
      });
      return true;
    }catch(e){
      return false;
    }
  }
}