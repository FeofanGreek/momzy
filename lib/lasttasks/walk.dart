import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jiffy/jiffy.dart';
import '../main.dart';
import '../mainScreen.dart';

int switchScreen = 0;
bool switchBlude = false;
String Ubath = 'Гуляли под дождиком';
String Udate = '23.02.2020';
String Utime = '19:03';


class walkPage extends StatefulWidget {
  @override
  _walkPageState createState() => _walkPageState();
}

class _walkPageState extends State<walkPage> with SingleTickerProviderStateMixin {

  TextEditingController _controllerDate, _controllerTime, _controllerBath;

  @override
  void initState() {
    super.initState();
    _controllerDate = TextEditingController(text: Udate);
    _controllerTime = TextEditingController(text: Utime);
    _controllerBath = TextEditingController(text: Ubath);

  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:switchScreen == 1 ? Container( //подтверждение удаления записи
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
                                height: 150,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(20,MediaQuery.of(context).size.width/2,0,20),
                                padding: EdgeInsets.fromLTRB(20,52,20,20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white),
                                child:Text('Уверены, что хотите удалить данную запись?', style: TextStyle(fontSize: 14.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.center,),

                              ),
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
                                              image: AssetImage("images/strollerIcon.png"),
                                              scale: 7,
                                              fit:BoxFit.none,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(textFieldBorder).withOpacity(0.5),
                                                spreadRadius: 0.2,
                                                offset: Offset(0, 0.5), // changes position of shadow
                                              ),
                                            ],
                                            color: Color(0xFFF2EDFD),
                                          ),
                                        ),
                                      ])),
                              Positioned(
                                  bottom: 85,
                                  left: 20,
                                  child: FlatButton(
                                    onPressed:(){
                                      setState(() {
                                        switchScreen = 0;
                                      });
                                      Navigator.push(context,
                                          CupertinoPageRoute(builder: (context) => mainScreenPage()));
                                    } ,
                                    minWidth: MediaQuery.of(context).size.width - 40,
                                    height: 55,
                                    child: Text('Удалить', style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                    color: Color(0xFF7C52E4),
                                    textColor: Colors.white,
                                    splashColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  )
                              ),
                              Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: FlatButton(
                                    onPressed:(){
                                      setState(() {
                                        switchScreen = 0;
                                      });
                                      Navigator.push(context,
                                          CupertinoPageRoute(builder: (context) => mainScreenPage()));
                                    } ,
                                    minWidth: MediaQuery.of(context).size.width - 40,
                                    height: 55,
                                    child: Text('Отменить', style: TextStyle(fontSize: 14.0, color: Color(buttonBackGround), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                    color: Color(buttonBackgroundLight),
                                    textColor: Color(buttonBackGround),
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
              ])) : switchScreen == 0 ? Container( // диалог выбора действия с бутылкой
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
                                      Text('Прогулка с ребенком', style: TextStyle(fontSize: 18.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),),
                                      Text('$Udate $Utime', style: TextStyle(fontSize: 16.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5),),
                                      SizedBox(height: 40,),
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text('$Ubath', style: TextStyle(fontSize: 18.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                                          ),
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
                                                switchScreen = 1;
                                              });
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
                                                switchScreen = 3;
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
                                              image: AssetImage("images/strollerIcon.png"),
                                              scale: 7,
                                              fit:BoxFit.none,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(textFieldBorder).withOpacity(0.5),
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
                                        image: AssetImage("images/strollerIcon.png"),
                                        scale: 7,
                                        fit:BoxFit.none,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder).withOpacity(0.5),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFFF2EDFD),
                                    ),
                                  ),
                                  Text('Прогулка', style: TextStyle(fontSize: 22.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                                ]),
                            SizedBox(height: 30,),

                            Container(
                              //alignment: Alignment.topCenter,
                                margin: EdgeInsets.fromLTRB(20,20,20,0),
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                width: MediaQuery.of(context).size.width - 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(textFieldBorder).withOpacity(0.5),
                                      spreadRadius: 0.2,
                                      offset: Offset(0, 0.5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:TextFormField(
                                  textAlign: TextAlign.center,
                                  enabled: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 16.0, color: Color(textFieldText)),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint)),
                                    hintText: "Комментарий",
                                    fillColor: Color(textFieldBackGround),
                                    filled: true,
                                    suffixIcon: IconButton(
                                      onPressed: () => _controllerBath.clear(),
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
                                        //width: 1.0,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value){ Ubath = value;},
                                  // ignore: deprecated_member_use
                                  autovalidate: false,
                                  controller: _controllerBath,
                                )),



                            Container(
                              //alignment: Alignment.topCenter,
                                margin: EdgeInsets.fromLTRB(20,20,20,0),
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                width: MediaQuery.of(context).size.width - 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(textFieldBorder).withOpacity(0.5),
                                      spreadRadius: 0.2,
                                      offset: Offset(0, 0.5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:TextFormField(
                                  textAlign: TextAlign.left,
                                  enabled: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 16.0, color: Color(textFieldText)),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint)),
                                    hintText: Udate,
                                    fillColor: Color(textFieldBackGround),
                                    filled: true,
                                    suffixIcon: IconButton(
                                      onPressed: () => _controllerDate.clear(),
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
                                  onTap: (){DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: Jiffy(DateTime.now()).add(years: -5),
                                      maxTime: Jiffy(DateTime.now()).add(years: 5),
                                      onChanged: (date) {}, onConfirm: (date) {
                                        String monthBolb = '';
                                        String dayBolb = '';
                                        if(date.month < 10){monthBolb = '0';}
                                        if(date.day < 10){dayBolb = '0';}
                                        _controllerDate = TextEditingController(text: '${dayBolb + date.day.toString()+"."+ monthBolb + date.month.toString()+"."+ date.year.toString()}');
                                        Udate = dayBolb + date.day.toString()+"."+ monthBolb + date.month.toString()+"."+ date.year.toString();
                                        setState(() {});
                                      }, currentTime: DateTime.now(), locale: LocaleType.en);},
                                  onChanged: (value){ Udate= value;},
                                  // ignore: deprecated_member_use
                                  autovalidate: false,
                                  controller: _controllerDate,
                                )),
                            Container(
                              //alignment: Alignment.topCenter,
                                margin: EdgeInsets.fromLTRB(20,20,20,0),
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                width: MediaQuery.of(context).size.width - 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(textFieldBorder).withOpacity(0.5),
                                      spreadRadius: 0.2,
                                      offset: Offset(0, 0.5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:TextFormField(
                                  textAlign: TextAlign.left,
                                  enabled: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 16.0, color: Color(textFieldText)),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint)),
                                    hintText: Utime,
                                    fillColor: Color(textFieldBackGround),
                                    filled: true,
                                    suffixIcon: IconButton(
                                      onPressed: () => _controllerTime.clear(),
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
                                  onTap: () {
                                    DatePicker.showPicker(context, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
                                      String minuteBolb = '';
                                      String hourBolb = '';
                                      if(date.minute < 10){minuteBolb = '0';}
                                      if(date.hour < 10){hourBolb = '0';}
                                      Utime = hourBolb + date.hour.toString()+":" + minuteBolb + date.minute.toString();
                                      _controllerTime = TextEditingController(text: hourBolb + date.hour.toString()+":" + minuteBolb + date.minute.toString());
                                      setState(() {});
                                    }, pickerModel: CustomPicker(currentTime: DateTime.now()),
                                        locale: LocaleType.en);
                                  },
                                  onChanged: (value){},
                                  // ignore: deprecated_member_use
                                  autovalidate: false,
                                  controller: _controllerTime,
                                )),
                          ]
                      ),
                    ])
            ),
          )
      ),
      bottomNavigationBar: switchScreen == 1 || switchBlude == true ? BottomAppBar(): switchScreen == 0 ? BottomAppBar(): BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: 145,
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
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => mainScreenPage()));
                    } ,
                    minWidth: MediaQuery.of(context).size.width - 40,
                    height: 55,
                    child: Text('Сохранить', style: TextStyle(fontSize: 14.0, color: Color(buttonTextWhite), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    color: Color(buttonBackGround),
                    textColor: Color(buttonTextWhite),
                    splashColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 55,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(20,0,20,10),
                  child: FlatButton(
                    onPressed:(){
                      setState(() {
                        switchScreen = 0;
                      });
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => mainScreenPage()));
                    } ,
                    minWidth: MediaQuery.of(context).size.width - 40,
                    height: 55,
                    child: Text('Отменить', style: TextStyle(fontSize: 14.0, color: Color(buttonBackGround), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    color: Color(buttonBackgroundLight),
                    textColor: Color(buttonBackGround),
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
