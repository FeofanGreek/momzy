import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momzy/foto/mainPhotoScreen.dart';
import 'package:momzy/mainScreen.dart';
import 'package:momzy/profile/profileSettings.dart';
import 'package:momzy/profilePhone.dart';
import 'package:momzy/statistics/statisticScreen.dart';

import 'foto/slidePhotos.dart';

int selected; //переменная для переключателя меню


//переменные цветовой палитры
int backGround = 0xFFffffff;
int buttonTextWhite = 0xFFFFFFFF;
int buttonBackGround = 0xFF7C52E4;
int buttonBackgroundLight = 0xFFF2EDFD;
int bodyTextMajor = 0xFF221A51;
int bodyTextInstruction = 0xFFAFAFC9;
int textFieldBorder = 0xFFAFAFC9;
int textFieldText = 0xFF000000;
int textFieldHint = 0xFFAFAFC9;
int textFieldBackGround = 0xFFFBF9FF;
//конец переменных цветовой палитры

String UbabyName = 'Дмитрий';
String UbabySex = 'Мальчик', UbabyBornDate='23.11.2020', dateDelivery;
String UbabyMassa = '23', UbabyToll='110';

void main() {
  runApp(momzyApp());
}

class momzyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: momzyHomePage(),
      //home: statisticsScreenPage(),
      home: mainScreenPage(),
    );
  }
}

class momzyHomePage extends StatefulWidget {
  @override
  _momzyHomePageState createState() => _momzyHomePageState();
}

class _momzyHomePageState extends State<momzyHomePage> {

  @override
  void initState() {
    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(backGround),
      body:Container(
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,),
        child: Stack(
            children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: 53, width: 270,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/momzyLogo.png"),
                      fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                  ),
                ),),
            ]),

          ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child:Container(
          height: 55,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.fromLTRB(20,0,20,10),
          child: FlatButton(
              onPressed:(){
                Navigator.pushReplacement(context,
                    CupertinoPageRoute(builder: (context) => profilePhonePage()));
              } ,
              minWidth: MediaQuery.of(context).size.width - 40,
              height: 55,
              child: Text('Начать', style: TextStyle(fontSize: 14.0, color: Color(buttonTextWhite), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              color: Color(buttonBackGround),
              textColor: Color(buttonTextWhite),
              splashColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
        elevation: 0,
      ),

    );
  }
}
