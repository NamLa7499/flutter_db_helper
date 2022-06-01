import 'dart:math';

import 'package:flutter/material.dart';
import 'DBHelper.dart';
import 'modelsDictionary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Test function',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(onPressed: () async {
              final db = DBHelper();
              await db.init();
               print(await db.checkConnection());
               try{
                 final result = await db.addHistoryWord(2);
                 print('added');}
              catch(e){
                print(e);
              }
             
            }, child: Text('Test add'),),


              ElevatedButton(onPressed: () async {
              final db = DBHelper();
              await db.init();
               print(await db.checkConnection());
               try{
                 final result = await db.getAllHistoryWord();
                 
                 print(result.length);
                 }
              catch(e){
                print(e);
              }
             
            }, child: Text('Test get all'),),

              ElevatedButton(onPressed: () async {
              final db = DBHelper();
              await db.init();
               print(await db.checkConnection());
               try{
                 final result = await db.deleteHistoryWord(2);
                 
                 print('deleted');
                 }
              catch(e){
                print(e);
              }
             
            }, child: Text('Test delete'),),

             ElevatedButton(onPressed: () async {
              final db = DBHelper();
              await db.init();
               print(await db.checkConnection());
               try{
                 print('get word');
                 final result = await db.getWordById(Random().nextInt(1000));
                 
        ;
                 print('first: ${result.word}');
                 
                 
                 }
              catch(e){
                print(e);
              }
             
            }, child: Text('Test get word'),),
            
          ],
        ),
      ),
    );
  }
}
