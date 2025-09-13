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
      fontFamily: 'Poppins',
    );
    return MaterialApp(
      theme: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
      ),
      home: const ExampleWithGrid(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                "ini adalah ukuran dari layar $screensize",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                "ini adalh orientasi dari layar $orientation",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Cara lain yang bisa kita gunakan adalah dengan widget LayoutBuilder.
//Perbedaan umum antara MediaQuery dan Layout Builder adalah MediaQuery akan mengembalikan ukuran layar
//yang digunakan,
//sedangkan LayoutBuilder mengembalikan ukuran maksimum dari widget tertentu.

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: LayoutBuilder(
                builder: (context, BoxConstraints constraint) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "ini adalah ukuran panjang dari layar 1 ${screensize.width}",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "ini adalh orientasi dari layar $orientation",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        "ini adalah ukuran untuk layout builder ini ${constraint.biggest} dan ukuran max width nya ${constraint.maxWidth}",
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: LayoutBuilder(
                builder: (context, BoxConstraints constraint) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "ini adalah ukuran panjang dari layar 2 ${screensize.width}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "ini adalh orientasi dari layar $orientation",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          "ini adalah ukuran untuk layout builder ini ${constraint.biggest} dan ukuran max width nya ${constraint.maxWidth}",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class ini  adlaah contoh dalam penggunaanya

class ExampleWithGrid extends StatelessWidget {
  const ExampleWithGrid({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("example responsive layout")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 550) {
            return ListView(children: generate());
          } else if (constraints.maxWidth > 550 &&
              constraints.maxWidth <= 900) {
            return GridView.count(crossAxisCount: 2, children: generate());
          } else {
            return GridView.count(crossAxisCount: 6, children: generate());
          }
        },
      ),
    );
  }

  List<Widget> generate() {
    return List.generate(15, (index) {
      return Container(
        color: Colors.blueGrey,
        margin: EdgeInsets.all(8),
        height: 200,
        child: Center(child: Text(index.toString())),
      );
    });
  }
}
