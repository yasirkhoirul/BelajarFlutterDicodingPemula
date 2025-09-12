import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData theme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    );

    return MaterialApp(
      theme: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
      ),
      home: const ViewListSeparated(),
    );
  }
}

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key});
  // final List<int> listdummy = const [1,2,3,4,5,6,7,8,9,10];
  final List<int> numberList = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("ini adalah bagian dari list view")),
      body: SafeArea(
        child: ListView(
          children: numberList.map((number) {
            return Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  '$number', // Ditampilkan sesuai item
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});
  final List listdata = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: listdata.length,
          //context disiini untuk memberitahu alamat dari tree widget
          itemBuilder: (context, index) {
            return Container(
              height: 250,
              child: Center(
                child: Text("ini adalah isi dari list data ${listdata[index]}"),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ViewListSeparated extends StatelessWidget {
  const ViewListSeparated({super.key});
  final List listData = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            height: 250,
            child: Text(
              "ini adalah isi dari list data menggunakan separated list view ${listData[index]}",
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: listData.length,
      ),
    );
  }
}
