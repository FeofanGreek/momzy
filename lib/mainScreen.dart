import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:momzy/lasttasks/pampers.dart';
import 'package:momzy/profile/profileSettings.dart';
import 'package:momzy/statistics/statisticScreen.dart';
import 'addBaby.dart';
import 'addTask.dart';
import 'babyCharasteristics.dart';
import 'bottomMenu/fab_bottom_app_bar.dart';
import 'bottomMenu/fab_with_icons.dart';
import 'bottomMenu/layout.dart';
import 'foto/mainPhotoScreen.dart';
import 'lasttasks/bath.dart';
import 'lasttasks/bottle.dart';
import 'lasttasks/feedMilk.dart';
import 'lasttasks/play.dart';
import 'lasttasks/shpritz.dart';
import 'lasttasks/sleep.dart';
import 'lasttasks/temperature.dart';
import 'lasttasks/walk.dart';
import 'main.dart';
import 'package:intl/intl.dart';


bool nightMode = false;
var dateTime1 = DateFormat('d.M.yyyy').parse(UbabyBornDate);
final date2 = DateTime.now();
final difference = date2.difference(dateTime1).inDays;


class mainScreenPage extends StatefulWidget {
  @override
  _mainScreenPageState createState() => _mainScreenPageState();
}

class _mainScreenPageState extends State<mainScreenPage>{


  @override
  void initState() {
    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar:PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: AppBar(
            backgroundColor: Color(buttonBackGround),
            elevation: 0.0,
            brightness: Brightness.dark,
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: Column(
              children: <Widget>[
                SizedBox(height: 50,),
                Row(children: <Widget>[
                  SizedBox(width: 20,),
                  Text('Ночной режим', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto')),
                  SizedBox(width: MediaQuery.of(context).size.width - 20 - 100 - 51 - 20-20 ),
                  FlutterSwitch(
                    width: 51.0,
                    height: 31.0,
                    toggleColor: Color(0xFFFFFFFF),
                    activeColor: Color(0xFF7C52E4),
                    inactiveColor: Color(0xFFD1BEFF),
                    padding: 3.0,
                    toggleSize: 27.0,
                    borderRadius: 15.0,
                    value: nightMode,
                    onToggle: (value) {
                      setState(() {
                        nightMode = value;
                      });
                    },
                  ),
                ]),
                SizedBox(height: 20,),
                Row(children: <Widget>[
                  Row(
                  children: <Widget> [
                    Container(
                    height: 24,
                    width: 24,
                    margin: EdgeInsets.fromLTRB(20,0,10,0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(UbabySex == 'Мальчик' ? "images/boy.png" :  "images/girl.png"),
                          fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                      ),
                    ),),
                    Text('$UbabyName', style: TextStyle(fontSize: 18.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    SizedBox(width: MediaQuery.of(context).size.width - 20 - 24 - 10 - (UbabyName.length * 16) - 28 - 20 ),
                    Container(
                      height: 6,
                      width: 28,
                      margin: EdgeInsets.fromLTRB(20,0,10,0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/screenSlider.png"),
                            fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                        ),
                      ),),
              ]
            ),
                ]),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(20,0,20,0),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 58,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFFFFF).withOpacity(0.2),
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width - 40)/3,
                         child: Row(
                            children: <Widget>[
                              Container(
                                height: 18,
                                width: 18,
                                margin: EdgeInsets.fromLTRB(20,0,10,0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/massaIcon.png"),
                                      fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                                  ),
                                ),),
                              Text('$UbabyMassa Кг', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                            ]
                         )
                      ),
                    Container(
                        alignment: Alignment.centerRight,
                        width: (MediaQuery.of(context).size.width - 40)/3,
                        child:
                            Row(
                                children: <Widget>[
                                  Container(
                                    height: 18,
                                    width: 18,
                                    margin: EdgeInsets.fromLTRB(20,0,10,0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("images/tollIcon.png"),
                                          fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                                      ),
                                    ),),
                                  Text('$UbabyToll См', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                                ]
                            )
                        ),
                    Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width - 40)/3,
                        child:Row(
                          children: <Widget>[
                            Container(
                              height: 18,
                              width: 18,
                              margin: EdgeInsets.fromLTRB(20,0,10,0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/ageIcon.png"),
                                    fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                                ),
                              ),),
                            Text('${(difference/29.4).round() < 12 ? '${(difference/29.4).round()} Mc' : '${(difference/365).round()} г.' }', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                          ]
                      )
                    )
                    ]
                  )
                ),

              ]
            ),
          )
      ),

      body:Container(
          decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7C52E4),
              Colors.white
            ],
          )),
        child: SingleChildScrollView(

          physics: ScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },

              child:Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFFFFFFF),
                      ),
                    child:Column(
                        children: <Widget>[
                      //блок дня
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: Text('Сегодня', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto',fontWeight: FontWeight.w600, height: 1.5),textAlign: TextAlign.left,)
                          ),
                          //блок дела на дату
                          Container(
                              margin: EdgeInsets.fromLTRB(20,20,0,0),
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      CupertinoPageRoute(builder: (context) => sleepPage()));
                                },
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("images/sleepIcon.png"),
                                          scale: 7,
                                          fit:BoxFit.none,
                                          alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                      margin: EdgeInsets.fromLTRB(15,0,0,0),
                                        child: RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan( text: 'Сон\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                            children: <TextSpan>[
                                              TextSpan(text: '4 часа 15 минут', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                              ]),
                                        ),
                                  ),
                                  Text('23:03', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                              ),
                           ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => bottlePage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                              Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/botleIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                            spreadRadius: 0.2,
                                            offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Бутылка\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: '320 мл', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('19:34', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ])),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => pampersPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/pampersIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Подгузник\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: 'Мокрый', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('19:03', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => walkPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/strollerIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Прогулка\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: '2 часа 21 минута', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('23:03', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child:GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => playPage()));
                              },
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/playIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Игра\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto'),
                                          children: <TextSpan>[
                                            TextSpan(text: '2 часа 10 минут', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto')),
                                          ]),
                                    ),
                                  ),
                                  Text('23:03', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto'),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          SizedBox(height: 40,),
                          //конец блока дела на дату
                    //конец блока дня
                          //блок дня
                          Container(
                              margin: EdgeInsets.fromLTRB(20,20,0,0),
                              alignment: Alignment.centerLeft,
                              child: Text('Вчера', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                          ),
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => shpritzPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/shpritzIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Вакцинация\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: 'Корь', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('13:00', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => bathPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/bathIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Купание\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: '40 минут', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('20:00', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => pampersPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/pampersIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Подгузник\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: 'Мокрый', style: TextStyle(fontSize: 14, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('19:03', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => walkPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/strollerIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Прогулка\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: '2 часа 21 минута', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('23:03', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => playPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/playIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Игра\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto'),
                                          children: <TextSpan>[
                                            TextSpan(text: '2 часа 10 минут', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto')),
                                          ]),
                                    ),
                                  ),
                                  Text('23:03', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto'),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          SizedBox(height: 40,),
                          //конец блока дела на дату
                          //конец блока дня

                          //блок дня
                          Container(
                              margin: EdgeInsets.fromLTRB(20,20,0,0),
                              alignment: Alignment.centerLeft,
                              child: Text('23 февраля 2021', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                          ),
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child:  GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => shpritzPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/shpritzIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Вакцинация\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: 'Корь', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('13:00', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                                margin: EdgeInsets.fromLTRB(20,20,0,0),
                                alignment: Alignment.centerLeft,
                                child:  GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(context,
                                        CupertinoPageRoute(builder: (context) => feedPage()));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/bustIcon.png"),
                                          scale: 7,
                                          fit:BoxFit.none,
                                          alignment: Alignment(0.0, 0.0),
                                        ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                            spreadRadius: 0.2,
                                            offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                    Container(
                                      width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                      margin: EdgeInsets.fromLTRB(15,0,0,0),
                                        child: RichText(
                                        textAlign: TextAlign.left,
                                        text: TextSpan( text: 'Кормление\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: '40 минут', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                      Text('15:00', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                              ),
                            ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => pampersPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/pampersIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Подгузник\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: 'Мокрый', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('19:03', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => walkPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/strollerIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Прогулка\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                          children: <TextSpan>[
                                            TextSpan(text: '2 часа 21 минута', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                          ]),
                                    ),
                                  ),
                                  Text('23:03', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          //конец блока дела на дату
                          //блок дела на дату
                          Container(
                            margin: EdgeInsets.fromLTRB(20,20,0,0),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    CupertinoPageRoute(builder: (context) => temperaturePage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/thermometrIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 20 - 48 - 50 - 20 - 15,
                                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan( text: 'Измерение температуры\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto'),
                                          children: <TextSpan>[
                                            TextSpan(text: '36,6', style: TextStyle(fontSize: 16.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto')),
                                          ]),
                                    ),
                                  ),
                                  Text('16:15', style: TextStyle(fontSize: 16.0, color: Color(0xFF9B9B9B), fontFamily: 'Roboto'),textAlign: TextAlign.left,)
                                ]),
                            ),
                          ),
                          SizedBox(height: 40,),
                          //конец блока дела на дату
                          //конец блока дня



                        ]),
              ),
            ),
            ),
          ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: Colors.grey,
        backgroundColor: Color(0xFFF2EDFD),
        selectedColor: Color(0xFF7C52E4),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: test,
        items: [
          FABBottomAppBarItem(iconData: AssetImage("images/homeIcon.png"), text: ''),
          FABBottomAppBarItem(iconData: AssetImage("images/statisticIcon.png"), text: ''),
          FABBottomAppBarItem(iconData: AssetImage("images/galleryIcon.png"), text: ''),
          FABBottomAppBarItem(iconData: AssetImage("images/settingIcon.png"), text: ''),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: false,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: test,
          ),
        );
      },
      child:Container(
      height: 68.0,
      width: 68.0,
          child: FittedBox(
          child:  FloatingActionButton(
              onPressed: () {Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => addTaskPage()));},
              tooltip: 'Increment',
              child: Icon(Icons.add),
              backgroundColor: Color(0xFF7C52E4),
              elevation: 2.0,
          ),
        )),
    );
  }

  void test(int index){
    if(index == 0){
      selected = 0;
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => mainScreenPage()));
    }
    if(index == 1){
      selected = 1;
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => statisticsScreenPage()));
    }
    if(index == 2){
      selected = 2;
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => mainPhotoScreenPage()));
    }
    if(index == 3){
      selected = 3;
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => profileSettingsScreenPage()));
    }
  }
}
