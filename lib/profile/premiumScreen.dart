import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:momzy/foto/mainPhotoScreen.dart';
import 'package:momzy/profile/profileSettings.dart';
import '../addBaby.dart';
import '../addTask.dart';
import '../bottomMenu/fab_bottom_app_bar.dart';
import '../bottomMenu/fab_with_icons.dart';
import '../bottomMenu/layout.dart';
import '../foto/mainPhotoScreen.dart';
import '../main.dart';
import 'package:intl/intl.dart';

import '../mainScreen.dart';




class premiumScreenPage extends StatefulWidget {
  @override
  _premiumScreenPageState createState() => _premiumScreenPageState();
}

class _premiumScreenPageState extends State<premiumScreenPage>{


  @override
  void initState() {
    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(390.0),
          child: AppBar(
            backgroundColor: Color(buttonBackGround),
            elevation: 0.0,
            brightness: Brightness.dark,
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                       Container(
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                      //height: 100,
                          decoration: BoxDecoration(
                        //color: Color(0xFF262626).withOpacity(0.75),
                          ),
                          child:Stack(
                          children: <Widget> [
                            Container(
                              height: 100,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.fromLTRB(10,0,0,0),
                              child: InkWell(
                                splashColor: Color(buttonBackGround), // splash color
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      CupertinoPageRoute(builder: (context) => profileSettingsScreenPage()));
                                }, // button pressed
                                child: Icon(CupertinoIcons.chevron_back, size: 30.0, color: Color(0xFFFFFFFF)),
                              ),
                            ),
                           Container(
                              height: 100,
                              alignment: Alignment.center,
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget> [
                                 Container(
                                   height: 24,
                                   width: 24,
                                   margin: EdgeInsets.fromLTRB(0,0,10,0),
                                   padding: EdgeInsets.fromLTRB(0,0,0,0),
                                   child: Image.asset("images/corona.png"),
                                 ),
                                 Text('Купить премиум', style: TextStyle(fontSize: 18.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),

                               ]),
                            ),
                          ]
                      ),
                    ),
                  //SizedBox(height: 20,),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(20,5,20,0),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFFFFF).withOpacity(0.05),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.fromLTRB(20,0,20,0),
                              //width: (MediaQuery.of(context).size.width - 40)/3,
                              child: Text('1 месяц', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(0,0,20,0),
                                //width: (MediaQuery.of(context).size.width - 40)/3,
                                child:
                                      Text('199 ₽', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),

                            ),
                          ]
                      )
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(20,15,20,0),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFFFFF).withOpacity(0.05),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Container(
                                alignment: Alignment.centerRight,
                              margin: EdgeInsets.fromLTRB(20,0,20,0),
                                //width: (MediaQuery.of(context).size.width - 40)/3,
                                child: Text('6 месяцев', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(0,10,20,0),
                                //width: (MediaQuery.of(context).size.width - 40)/3,
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text('899', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto',decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFFFFFFF), decorationThickness: 1.5,),textAlign: TextAlign.left,),
                                      Text('699 ₽', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                                    ]
                                )
                            ),
                          ]
                      )
                  ),

                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(20,15,20,0),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFFFFF).withOpacity(0.05),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.fromLTRB(20,0,20,0),
                              //width: (MediaQuery.of(context).size.width - 40)/3,
                              child: Text('12 месяцев', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(0,10,20,0),
                                //width: (MediaQuery.of(context).size.width - 40)/3,
                                child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text('1700', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto',decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFFFFFFF), decorationThickness: 1.5,),textAlign: TextAlign.left,),
                                      Text('1200 ₽', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                                    ]
                                )
                            ),
                          ]
                      )
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20,45,20,0),
                    //width: (MediaQuery.of(context).size.width - 40)/3,
                    child: Text('Ваш премиум годен до 23.12.2021', style: TextStyle(fontSize: 14.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', ),textAlign: TextAlign.left,),

                  ),
                ]
            ),

          )
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
                        child: Text('Преимущества', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto',fontWeight: FontWeight.w600, height: 1.5),textAlign: TextAlign.left,)
                    ),
                    //блок дела на дату
                    Container(
                      margin: EdgeInsets.fromLTRB(20,20,0,0),
                      alignment: Alignment.centerLeft,
                      child:Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("images/photocamera.png"),
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
                                  text: TextSpan( text: 'Загрузить больше 10 фотографий\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                      children: <TextSpan>[
                                        TextSpan(text: 'В разделе альбом ребенка', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                      ]),
                                ),
                              ),

                            ]),
                      ),

                    //конец блока дела на дату
                    //блок дела на дату
                    Container(
                      margin: EdgeInsets.fromLTRB(20,10,0,0),
                      alignment: Alignment.centerLeft,
                      child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/radio.png"),
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
                                text: TextSpan( text: 'Возможность подключать няню\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Отслеживайте и делитесь данными', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                    ]),
                              ),
                            ),

                          ]),
                    ),

                    //конец блока дела на дату
                    //блок дела на дату
                    Container(
                      margin: EdgeInsets.fromLTRB(20,10,0,0),
                      alignment: Alignment.centerLeft,
                      child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/lego.png"),
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
                                text: TextSpan( text: 'Расширенная аналитика данных\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                    children: <TextSpan>[
                                      TextSpan(text: 'С рекомендациями', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                    ]),
                              ),
                            ),

                          ]),
                    ),

                    //конец блока дела на дату
                    //блок дела на дату
                    Container(
                      margin: EdgeInsets.fromLTRB(20,10,0,0),
                      alignment: Alignment.centerLeft,
                      child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/horn.png"),
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
                                text: TextSpan( text: 'Мелодия сна для малыша\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Включите музыку во время таймера сна', style: TextStyle(fontSize: 14.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5)),
                                    ]),
                              ),
                            ),

                          ]),
                    ),

                    //конец блока дела на дату
                    //блок дела на дату
                    Container(
                      margin: EdgeInsets.fromLTRB(20,10,0,0),
                      alignment: Alignment.centerLeft,
                      child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/inyan.png"),
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
                                text: TextSpan( text: 'Возможность добавить\n', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),
                                    children: <TextSpan>[
                                      TextSpan(text: 'нескольких малышей', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5)),
                                    ]),
                              ),
                            ),

                          ]),
                    ),

                    //конец блока дела на дату

                    SizedBox(height: 40,)


                  ]),
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
