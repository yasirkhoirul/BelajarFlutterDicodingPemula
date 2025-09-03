import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    );
    return MaterialApp(
      theme: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
      ),

      title: "image widget",
      home: const ImagesAsset(),
    );
  }
}

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Bagian Image')),
      body: Center(
        //menambahkan gambat melalui link
        child: Image.network(
          'https://picsum.photos/200/300',
          width: 200,
          height: 300,
        ),
      ),
    );
  }
}

class ImagesAsset extends StatelessWidget {
  const ImagesAsset({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Halaman image asset")),
      body: Center(
        child: Image.asset(
          'images/hasilnyaadlaah.png',
          width: 200,
          height: 300,
        ),
      ),
    );
  }
}
