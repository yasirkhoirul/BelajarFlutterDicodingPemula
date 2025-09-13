import 'package:flutter/material.dart';
import 'package:flutter_application_1/modelcodelab3.dart';

class DetailScreen extends StatelessWidget {
  final Namatempat data;
  const DetailScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Image.asset(data.imageAsset,fit: BoxFit.cover,),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Favorit(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(height: 2),
                        Text(data.openDays),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(height: 2),
                        Text(data.openTime),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(height: 2),
                        Text(data.ticketPrice),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Text(data.description, textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: data.imageUrls.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(e),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Favorit extends StatefulWidget {
  const Favorit({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Favorit();
  }
}

class _Favorit extends State<Favorit> {
  bool isfavorit = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: () {
        setState(() {
          isfavorit = !isfavorit;
        });
      },
      icon: Icon(isfavorit? Icons.favorite: Icons.favorite_border),
    );
  }
}
