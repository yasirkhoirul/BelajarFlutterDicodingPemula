import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      fontFamily: 'Poppins'
    );

    return MaterialApp(
      title: "Halaman dengan scaffold",
      theme: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary
        )
      ),
      home: const HomeScaffold(),
    );
  }
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 3),
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
            //parameter shape digunakan untuk mengubah bentuk container
            // shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(3, 6),
                blurRadius: 10,
              )
            ]
          ),
          width: 300,
          height: 300,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("ini adalah baris pertama",style: TextStyle(fontWeight: FontWeight.bold),),
                  Icon(Icons.thumb_up)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("ini adalah baris ke dua"),
                  const Icon(Icons.thumb_down)
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
