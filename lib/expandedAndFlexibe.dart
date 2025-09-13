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
      fontFamily: "Poppins",
    );
    return MaterialApp(
      theme: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
      ),
      home: const Flexibe(),
    );
  }
}

//Flutter memiliki widget Expanded yang dapat
//mengembangkan child dari Row atau Column sesuai dengan ruang yang tersedia.
//Cara menggunakannya Anda cukup membungkus masing-masing child ke dalam Expanded.

class ExpandFlexib extends StatelessWidget {
  const ExpandFlexib({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Expanded and Flexibe")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 2, child: Container(color: Colors.red)),
            Expanded(flex: 8, child: Container(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

//Sama seperti Expanded, widget Flexible digunakan untuk mengatur ukuran widget di
//dalam Row atau Column secara fleksibel.
//Perbedaan Flexible dan Expanded adalah widget Flexible memungkinkan child
//widget-nya berukuran lebih kecil dibandingkan ukuran ruang yang tersisa.
//Sementara, child widget dari Expanded harus menempati
//ruang yang tersisa dari Column atau Row.
class Flexibe extends StatelessWidget {
  const Flexibe({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Flexibe")),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(child: Container(color: Colors.teal, height: 50,)),
            Flexible(child: Container(color: Colors.amber,)),
          ],
        ),
      ),
    );
  }
}
