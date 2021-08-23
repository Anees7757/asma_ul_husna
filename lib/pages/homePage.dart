import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'listen.dart';
import 'read.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius:
          BorderRadius.all(Radius.circular(15))),
          title: const Text('Note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This section of App is under construction.We\'re working on it.'),
                Text('Thanks for downloading. JazakAllah'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Stack(
                      children: [
                        Center(child: Image.asset("assets/images/button.png",
                          height: MediaQuery.of(context).size.height*0.18,
                          width: MediaQuery.of(context).size.width*0.4,
                        )),
                        Center(child: Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height/17),
                          child: Text("Read",
                            style: GoogleFonts.rockSalt(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        ),
                      ]
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Read()),
                    );
                  },
                ),
                GestureDetector(
                  child: Stack(
                      children: [
                        Center(child: Image.asset("assets/images/button.png",
                          height: MediaQuery.of(context).size.height*0.18,
                          width: MediaQuery.of(context).size.width*0.4,
                        )),
                        Center(child: Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height/17),
                          child: Text("Listen",
                            style: GoogleFonts.rockSalt(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ),
                      ]
                  ),
                  onTap: (){
                   _showMyDialog();
                   //   Navigator.push(
                   //     context,
                   //     MaterialPageRoute(builder: (context) => Listen()),
                   //   );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
