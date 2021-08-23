import 'dart:async';
import 'package:flutter/material.dart';
import '../data/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_fonts/google_fonts.dart';


class Read extends StatefulWidget {
  const Read({Key? key}) : super(key: key);

  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  bool autoPlay = false;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius:
          BorderRadius.all(Radius.circular(15))),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("Narrated Abu Huraira:",
                style: TextStyle(
                    fontWeight: FontWeight.w500
                )),
                Text('    Prophet Muhammad SAW said, “Allah has ninety-nine names, i.e. one-hundred minus one, and whoever knows them will go to Paradise.”'),
                SizedBox(height: 10),
                Text('Sahih Al-Bukhari – Book 50 Hadith 894',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                )),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.run(() => _showMyDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white)
        ),
      ),
      body: Stack(
        children: [
          Container(
            transform: Matrix4.translationValues(0.0, -56.0, 0.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgdesign.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height*0.47,
                        // height: 400.0,
                        autoPlay: autoPlay,
                        enlargeCenterPage: true,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: DataModel().asmaArab.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/design.jpg"),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.yellow, BlendMode.softLight)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: Offset(0,0),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text("${itemIndex + 1} of 99 names of Allah",
                                      style: GoogleFonts.gloriaHallelujah(
                                        textStyle: TextStyle(
                                          fontSize: 13.0,
                                        ),
                                      )
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).size.height*0.09),
                                      Text(DataModel().asmaEn[itemIndex],
                                        style: GoogleFonts.alata(
                                          textStyle: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height*0.02),
                                      Text(DataModel().asmaArab[itemIndex],
                                          style: TextStyle(
                                            fontFamily: ArabicFonts.El_Messiri,
                                            package: 'google_fonts_arabic',
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600
                                          )),
                                      SizedBox(height: MediaQuery.of(context).size.height*0.079),
                                      Text(DataModel().meaning[itemIndex],
                                        style: GoogleFonts.architectsDaughter(
                                          textStyle: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 10),
                                      // Text(
                                      //   " He who wills goodness and mercy for all His creatures",
                                      //   style: GoogleFonts.nothingYouCouldDo(
                                      //       textStyle: TextStyle(
                                      //         fontSize: 16.0,
                                      //         fontWeight: FontWeight.w400,
                                      //       )
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
            child: Icon(autoPlay ? Icons.stop : Icons.play_arrow, size: 32),
            foregroundColor: Colors.white,
            backgroundColor: autoPlay ? Colors.red : Colors.green,
            tooltip: autoPlay ? 'Stop' : 'Play',
            onPressed: (){
              setState(() {
                if(autoPlay == true)
                {
                  autoPlay = false;
                  final snackBar = SnackBar(content: Text('AutoPlay OFF'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if(autoPlay == false) {
                  autoPlay = true;
                  final snackBar = SnackBar(content: Text('AutoPlay ON'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

              });
            },
          ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
