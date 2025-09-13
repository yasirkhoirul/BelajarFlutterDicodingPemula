import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      fontFamily: "Poppins",
    );
    // TODO: implement build
    return MaterialApp(
      theme: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
      ),
      home: const FirstScreen(),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String pesan;
  const SecondScreen({super.key,required this.pesan});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("halaman ke dua")),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ini $pesan"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Kembali"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  final String pesandata = "ini adalah pesan dari halaman pertama";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text(" layar pertama")),

      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SecondScreen(pesan: pesandata);
                  },
                ),
              );
            },
            child: const Text("Masuk ke halaman ke dua"),
          ),
        ),
      ),
    );
  }
}
