import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    );
    return MaterialApp(
      title: "buttom",
      theme: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
      ),
      home: Tombol(),
    );
  }
}

class Tombol extends StatelessWidget {
  String? pilihan;
  Tombol({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
            child: ElevatedButton(onPressed: (){}, child: const Text("Tombol elevated")),
          ), Container(
            child: TextButton(onPressed: (){}, child: const Text("Tombol text button")),
          ), Container(
            child: OutlinedButton(onPressed: (){}, child: const Text("outlined Text")),
          ),Container(
            child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo),tooltip: "tambah gambar",) ,
          ),DropDownButton()
          ]),
      ),
    );
  }
}

class DropDownButton extends StatefulWidget{
  const DropDownButton({super.key});

  @override
  State createState() => _DropDownButton();
}

class _DropDownButton extends State{
  String? pilihan;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        items: [
          DropdownMenuItem<String>(
            value: 'Dart',
            child: Text('Dart'),
          ),
          DropdownMenuItem<String>(
            value: 'Kotlin',
            child: Text('Kotlin'),
          ),
          DropdownMenuItem<String>(
            value: 'Swift',
            child: Text('Swift'),
          ),
        ],
        value: pilihan,
        hint: const Text("pilih bahasa"),
        onChanged: (value) => setState(() {
          pilihan = value;
        })
      ),
    );
  }
}