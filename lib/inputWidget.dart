import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    );
    return MaterialApp(
      title: "input in flutter",
      theme: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
      ),
      home: const InputControllers(),
    );
  }
}

//metode onchanged
class Inputwidget extends StatefulWidget {
  const Inputwidget({super.key});

  @override
  State createState() => _Inputwiget();
}

class _Inputwiget extends State {
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Silahkan masukkan nama anda",
                labelText: "Nama Anda",
              ),
              onChanged: (String value) => {
                setState(() {
                  data = value;
                }),
              },
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(content: Text("halo $data")),
                ),
              },
              child: Text('sudah'),
            ),
          ],
        ),
      ),
    );
  }
}

//metode controller

class InputControllers extends StatefulWidget {
  const InputControllers({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InputControllers();
  }
}

class _InputControllers extends State {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "siahkan masukkan nama anda...",
              labelText: "Nama",
            ),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(content: Text("nama anda ${_controller.text}")),
              ),
            },
            child: Text("enter"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
