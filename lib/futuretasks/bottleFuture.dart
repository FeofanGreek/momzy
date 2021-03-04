import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jiffy/jiffy.dart';
import '../main.dart';
import '../mainScreen.dart';

int switchScreen = 2;
bool switchBlude = false;
String nameBlude = 'Молочная смесь';
String bludeValue = '300 мл';
String Udate = '23.02.2020';
String Utime = '19:03';
String UbludeMassa = '300';
int roundMarker = 1;

class bottleFuturePage extends StatefulWidget {
  @override
  _bottleFuturePageState createState() => _bottleFuturePageState();
}

class _bottleFuturePageState extends State<bottleFuturePage> with SingleTickerProviderStateMixin {

  TextEditingController _controllerDate, _controllerTime, _controllerBludeMassa,_controllerBludeType;

  @override
  void initState() {
    super.initState();
    _controllerDate = TextEditingController(text: Udate);
    _controllerTime = TextEditingController(text: Utime);
    _controllerBludeMassa = TextEditingController(text: UbludeMassa);
    _controllerBludeType = TextEditingController(text: nameBlude);
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:switchScreen == 1 ? SingleChildScrollView( // далог редактирования записи о бутылке
          physics: ScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white),
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0,0,0,0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                    children: <Widget> [
                      Column(
                          children: <Widget>[
                            Column(
                                children: <Widget>[
                                  SizedBox(height: MediaQuery.of(context).size.width / 3,),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0,0,0,8),
                                    alignment: Alignment.centerLeft,
                                    width: 63,
                                    height: 63,
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
                                  Text('Бутылка', style: TextStyle(fontSize: 22.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),),
                                  Text('Выберите объем', style: TextStyle(fontSize: 16.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto')),
                                ]),
                            SizedBox(height: 30,),
                            Row(
                                children: <Widget> [
                                  Container(
                                    //alignment: Alignment.topCenter,
                                      margin: EdgeInsets.fromLTRB(20,20,20,0),
                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                      width: MediaQuery.of(context).size.width - 20 -20 -61 -20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(textFieldBorder),
                                            spreadRadius: 0.2,
                                            offset: Offset(0, 0.5), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child:TextFormField(
                                        textAlign: TextAlign.left,
                                        enabled: true,
                                        keyboardType: TextInputType.numberWithOptions(
                                            decimal: true,
                                            signed: false),
                                        style: TextStyle(fontSize: 16.0, color: Color(textFieldText), fontWeight: FontWeight.w600),
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint), fontWeight: FontWeight.w600),
                                          hintText: UbludeMassa,
                                          fillColor: Color(textFieldBackGround),
                                          filled: true,
                                          suffixIcon: IconButton(
                                            onPressed: () => _controllerBludeMassa.clear(),
                                            icon: Icon(Icons.clear, color: Color(textFieldHint)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                        onChanged: (value){ UbludeMassa = value;},
                                        // ignore: deprecated_member_use
                                        autovalidate: false,
                                        controller: _controllerBludeMassa,
                                      )),
                                  Container(
                                    //alignment: Alignment.topCenter,
                                      margin: EdgeInsets.fromLTRB(0,20,20,0),
                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                      width: 61,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(textFieldBorder),
                                            spreadRadius: 0.2,
                                            offset: Offset(0, 0.5), // changes position of shadow
                                          ),
                                        ],

                                      ),
                                      child:TextFormField(
                                        textAlign: TextAlign.center,
                                        //enableInteractiveSelection: false,
                                        //focusNode: false,
                                        enabled: false,
                                        style: TextStyle(fontSize: 16.0, color: Color(textFieldText), fontWeight: FontWeight.w600),
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint), fontWeight: FontWeight.w600),
                                          hintText: "мл",
                                          contentPadding: new EdgeInsets.symmetric(vertical: 21, horizontal: 10.0),
                                          fillColor: Color(textFieldBackGround),
                                          filled: true,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                        // ignore: deprecated_member_use
                                        autovalidate: false,
                                      )),
                                ]),
                          ]
                      ),

                    ])
            ),
          )
      ): switchScreen == 0 ? Container( // дилог выбора действия с бутылкой
          height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(backGround),),
          child: Stack(
              children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.7),
                        child:Stack(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width - 40,
                                height: 200,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(20,MediaQuery.of(context).size.width/2,0,20),
                                padding: EdgeInsets.fromLTRB(20,52,20,20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white),
                                child: Column(
                                    children: <Widget>[
                                      Text('Кормление бутылкой', style: TextStyle(fontSize: 18.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),),
                                      Text('$Udate $Utime', style: TextStyle(fontSize: 16.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5),),
                                      SizedBox(height: 40,),
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text('$nameBlude', style: TextStyle(fontSize: 18.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: Text('$bludeValue', style: TextStyle(fontSize: 18.0, color: Color(bodyTextMajor), fontFamily: 'Roboto'),textAlign: TextAlign.right,),

                                          )
                                        ],
                                      ),
                                    ]),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.width+40,
                                  left: MediaQuery.of(context).size.width/2 - 80,
                                  child: Row(
                                      children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                switchScreen = 2;
                                              });
                                              Navigator.pushReplacement(context,
                                                  CupertinoPageRoute(builder: (context) => mainScreenPage()));
                                            },
                                            child:Column(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0,0,0,8),
                                                    alignment: Alignment.centerLeft,
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage("images/trash.png"),
                                                        scale: 7,
                                                        fit:BoxFit.none,
                                                        alignment: Alignment(0.0, 0.0),
                                                      ),

                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  Text('Удалить', style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', height: 1.5),)
                                                ])),
                                        SizedBox(width: 30,),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                switchScreen = 2;
                                              });
                                            },
                                            child:Column(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0,2,0,8),
                                                    alignment: Alignment.centerLeft,
                                                    width: 28,
                                                    height: 28,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage("images/gear.png"),
                                                        scale: 7,
                                                        fit:BoxFit.fitHeight,
                                                        alignment: Alignment(0.0, 0.0),
                                                      ),

                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  Text('Изменить', style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', height: 1.5),)
                                                ])),

                                      ])),
                              Positioned(
                                  top: MediaQuery.of(context).size.width/2 - 22,
                                  left: MediaQuery.of(context).size.width/2 - 33,
                                  child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0,0,0,8),
                                          alignment: Alignment.centerLeft,
                                          width: 63,
                                          height: 63,
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
                                      ])),
                              Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: FlatButton(
                                    onPressed:(){
                                      Navigator.push(context,
                                          CupertinoPageRoute(builder: (context) => mainScreenPage()));
                                    } ,
                                    minWidth: MediaQuery.of(context).size.width - 40,
                                    height: 55,
                                    child: Text('Закрыть', style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                    color: Color(0xFF7C52E4),
                                    textColor: Colors.white,
                                    splashColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  )
                              )
                            ]
                        )
                    )
                )
              ])) : SingleChildScrollView( // далог редактирования записи о бутылке
          physics: ScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white),
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0,0,0,0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                    children: <Widget> [
                      Column(
                          children: <Widget>[
                            Column(
                                children: <Widget>[
                                  SizedBox(height: MediaQuery.of(context).size.width / 3,),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0,0,0,8),
                                    alignment: Alignment.centerLeft,
                                    width: 63,
                                    height: 63,
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
                                  Text('Бутылка', style: TextStyle(fontSize: 22.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),),
                                  Text('Чем будете кормить', style: TextStyle(fontSize: 16.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto')),
                                ]),
                            SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              setState(() {
                //switchBlude = false;
                //bustType = 'Левая';
                roundMarker = 1;
                //_controllerBustType = TextEditingController(text: bustType);
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              padding: EdgeInsets.fromLTRB(0,0,0,0),
              width: MediaQuery.of(context).size.width - 40,
              height: 55,
              decoration: BoxDecoration(
                color: Color(textFieldBackGround),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(textFieldBorder).withOpacity(0.5),
                    spreadRadius: 0.2,
                    offset: Offset(0, 0.5), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20,0,20,0),
                    alignment: Alignment.center,
                    child: Text('Грудное молоко', style: TextStyle(fontSize: 17.0, color: Color(roundMarker == 1 ? textFieldText : textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: roundMarker == 1 ?Container(
                      height: 24,
                      width: 24,
                      margin: EdgeInsets.fromLTRB(20,0,20,0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/roundMarker.png"),
                            fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                        ),
                      ),) : Container(),
                  )
                ],
              ),),),

          GestureDetector(
            onTap: () {
              setState(() {
                //switchBlude = false;
                //bustType = 'Правая';
                roundMarker = 2;
                //_controllerBustType = TextEditingController(text: bustType);
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(20,20,20,0),
              padding: EdgeInsets.fromLTRB(0,0,0,0),
              width: MediaQuery.of(context).size.width - 40,
              height: 55,
              decoration: BoxDecoration(
                color: Color(textFieldBackGround),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(textFieldBorder).withOpacity(0.5),
                    spreadRadius: 0.2,
                    offset: Offset(0, 0.5), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20,0,20,0),
                    alignment: Alignment.center,
                    child: Text('Молочная смесь', style: TextStyle(fontSize: 17.0, color: Color(roundMarker == 2 ? textFieldText : textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: roundMarker == 2 ?Container(
                      height: 24,
                      width: 24,
                      margin: EdgeInsets.fromLTRB(20,0,20,0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/roundMarker.png"),
                            fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                        ),
                      ),) : Container(),
                  )
                ],
              ),),),

          GestureDetector(
              onTap: () {
                setState(() {
                  //switchBlude = false;
                  //bustType = 'Обе';
                  roundMarker = 3;
                  //_controllerBustType = TextEditingController(text: bustType);
                });
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(20,20,20,0),
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(textFieldBackGround),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(textFieldBorder).withOpacity(0.5),
                        spreadRadius: 0.2,
                        offset: Offset(0, 0.5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20,0,20,0),
                        alignment: Alignment.center,
                        child: Text('Вода', style: TextStyle(fontSize: 17.0, color: Color(roundMarker == 3 ? textFieldText : textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: roundMarker == 3 ?Container(
                          height: 24,
                          width: 24,
                          margin: EdgeInsets.fromLTRB(20,0,20,0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/roundMarker.png"),
                                fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                            ),
                          ),) : Container(),
                      )
                    ],
                  ),)),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    //switchBlude = false;
                                    //bustType = 'Обе';
                                    roundMarker = 4;
                                    //_controllerBustType = TextEditingController(text: bustType);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20,20,20,0),
                                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                                  width: MediaQuery.of(context).size.width - 40,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Color(textFieldBackGround),
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(textFieldBorder).withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0.5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(20,0,20,0),
                                        alignment: Alignment.center,
                                        child: Text('Мягкая еда', style: TextStyle(fontSize: 17.0, color: Color(roundMarker == 4 ? textFieldText : textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: roundMarker == 4 ?Container(
                                          height: 24,
                                          width: 24,
                                          margin: EdgeInsets.fromLTRB(20,0,20,0),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("images/roundMarker.png"),
                                                fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                                            ),
                                          ),) : Container(),
                                      )
                                    ],
                                  ),)),
                          ]
                      ),

                    ])
            ),
          )
      ),
      bottomNavigationBar: switchScreen == 0 || switchBlude == true ? BottomAppBar(): switchScreen == 1 ? BottomAppBar(color: Colors.transparent,
        child: Container(
          height: 75,
          child:ListView(
              children: <Widget>[
                Container(
                  height: 55,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(20,0,20,0),
                  child: FlatButton(
                    onPressed:(){
                      setState(() {
                        switchScreen = 0;
                      });
                      /* Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => mainScreenPage()));*/
                    } ,
                    minWidth: MediaQuery.of(context).size.width - 40,
                    height: 55,
                    child: Text('Добавить', style: TextStyle(fontSize: 14.0, color: Color(buttonTextWhite), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    color: Color(buttonBackGround),
                    textColor: Color(buttonTextWhite),
                    splashColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ]),
        ),
        elevation: 0,): BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: 75,
          child:ListView(
              children: <Widget>[
                Container(
                  height: 55,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(20,0,20,0),
                  child: FlatButton(
                    onPressed:(){
                      setState(() {
                        switchScreen = 1;
                      });
                     /* Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => mainScreenPage()));*/
                    } ,
                    minWidth: MediaQuery.of(context).size.width - 40,
                    height: 55,
                    child: Text('Добавить', style: TextStyle(fontSize: 14.0, color: Color(buttonTextWhite), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    color: Color(buttonBackGround),
                    textColor: Color(buttonTextWhite),
                    splashColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ]),
        ),
        elevation: 0,
      ),
    );
  }
}

//для тайм пикера без секунд
class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "";
  }

  @override
  String rightDivider() {
    return ":";
  }

  @override
  List<int> layoutProportions() {
    return [1, 1, 0];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        this.currentLeftIndex(),
        this.currentMiddleIndex(),
        this.currentRightIndex())
        : DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        this.currentLeftIndex(),
        this.currentMiddleIndex(),
        this.currentRightIndex());
  }
}// для таймпикера без секунд
