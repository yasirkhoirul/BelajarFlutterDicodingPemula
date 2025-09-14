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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Bandung, size layar adalah ${size.width}"),
      ),
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraint) {
          if (constraint.maxWidth < 600) {
            return Namatempatlist();
          } else if(constraint.maxWidth >=600 && constraint.maxWidth <= 1200) {
            return Namatempatgrid(col: 4,);
          }else{
            return Namatempatgrid(col: 6);
          }
        },
      ),
    );
  }
}

class Namatempatlist extends StatelessWidget {
  const Namatempatlist({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
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
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      child: Image.asset(fit: BoxFit.fill, datalist.imageAsset),
                    ),
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
    );
  }
}

class Namatempatgrid extends StatelessWidget {
  final int col;
  const Namatempatgrid({super.key, required this.col});
  @override
  Widget build(BuildContext context) {
    final datalist = namatempatList;
    // TODO: implement build
    return SafeArea(
      child: GridView.count(
        crossAxisCount: col,
        children: datalist.map((e) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailScreen(data: e);
                },
              ),
            ),
            child: Card(
              elevation: 12,
              child: Container(
                padding: EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Image.asset(e.imageAsset, fit: BoxFit.cover),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(e.location),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}


//example model