import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: Center(
            child: Statefullcontoh(parameterwidget: "Halo saya adalah yasir"),
          ),
        ),
    );
  }
}

//state-nya tidak dapat berubah (immutable)
class Heading extends StatelessWidget{
  final String text;

  const Heading({Key? key, required this.text}) :super(key: key);
  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      )
    );
  }
}

class Statefullcontoh extends StatefulWidget{

  final String parameterwidget;

  const Statefullcontoh({super.key,required this.parameterwidget});

  @override
  State<Statefullcontoh> createState()=>_Statefullcontoh();
}

class _Statefullcontoh extends State<Statefullcontoh>{
    double _dataState = 16.0; // ini state dari Widget ContohStateful
 
    @override
    Widget build(BuildContext context){
        // isi sebuah widget
        return Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.parameterwidget,style: TextStyle(fontSize: _dataState),),
          ElevatedButton(onPressed: (){
            setState(() {
              _dataState = 32.0;
            });
          }, child: const Text("Perbesar"))
        ]
        );
    }
}