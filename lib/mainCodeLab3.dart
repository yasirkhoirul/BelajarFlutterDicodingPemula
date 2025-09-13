import 'package:flutter/material.dart';
import 'package:flutter_application_1/datacodelab3.dart';
import 'package:flutter_application_1/DetailScreenCodeLab3.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      fontFamily: 'Poppins',
    );
    return MaterialApp(
      theme: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Wisata Bandung")),
      body: SafeArea(
        child: ListView.builder(
          itemCount: namatempatList.length,
          itemBuilder: (context, index) {
            final datalist = namatempatList[index];
            return InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailScreen(data: datalist);
                    },
                  ),
                ),
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
                elevation: 8,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(borderRadius: BorderRadiusGeometry.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16)
                      ),child: Image.asset(fit: BoxFit.fill,datalist.imageAsset))
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(datalist.name),
                            Text(datalist.location),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


//example model