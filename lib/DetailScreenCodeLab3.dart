import 'package:flutter/material.dart';
import 'package:flutter_application_1/modelcodelab3.dart';

class DetailScreen extends StatelessWidget {
  final Namatempat data;
  const DetailScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constrain) {
        if (constrain.maxWidth < 1200) {
          return DetailMobilePage(data: data);
        } else {
          return DetailWebPage(data: data);
        }
      },
    );
  }
}

// class untuk tampilan web
class DetailWebPage extends StatefulWidget {
  final Namatempat data;
  
  const DetailWebPage({super.key, required this.data});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final scrollcontroller =ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 64),
          child: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Wisata Bandung",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                widget.data.imageAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Scrollbar(
                              controller: scrollcontroller,
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView.builder(
                                  controller: scrollcontroller,
                                  itemCount: widget.data.imageUrls.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsetsGeometry.all(3),
                                      child: ClipRRect(
                                        borderRadius: BorderRadiusGeometry.circular(
                                          5,
                                        ),
                                        child: Image.network(widget.data.imageUrls[index]),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12,),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                            
                              children: [
                                Text(
                                  widget.data.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.access_time),
                                            Text(widget.data.openTime),
                                          ],
                                        ),
                                        const SizedBox(height: 12,),
                                        Row(
                                          children: [
                                            Icon(Icons.calendar_month),
                                            Text(widget.data.openDays),
                                          ],
                                        ),
                                        const SizedBox(height: 12,),
                                        Row(
                                          children: [
                                            Icon(Icons.monetization_on),
                                            Text(widget.data.ticketPrice),
                                          ],
                                        ),
                                        const SizedBox(height: 12,),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 12),
                                      child: Icon(Icons.favorite),
                                    )
                                  ],
                                ),
                                Text(widget.data.description, textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    scrollcontroller.dispose();
    super.dispose();
  }
}

// class untuk tampilan mobile
class DetailMobilePage extends StatelessWidget {
  final Namatempat data;
  const DetailMobilePage({super.key, required this.data});
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
                  Image.asset(data.imageAsset, fit: BoxFit.cover),
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
                  Positioned(top: 20, right: 20, child: Favorit()),
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
      icon: Icon(isfavorit ? Icons.favorite : Icons.favorite_border),
    );
  }
}
