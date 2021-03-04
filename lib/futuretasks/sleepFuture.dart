import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jiffy/jiffy.dart';
import '../main.dart';
import '../mainScreen.dart';
import '../stopwhatch.dart';

int switchScreen = 2;
bool switchBlude = false;
String timerStatus = 'Таймер остановлен';
String Udate = '23.02.2020';
String Utime = '19:03';
String UbludeMassa = '300';
int roundMarker = 1;
bool timerStarted = false;

class sleepFuturePage extends StatefulWidget {
  @override
  _sleepFuturePageState createState() => _sleepFuturePageState();
}

class _sleepFuturePageState extends State<sleepFuturePage> with SingleTickerProviderStateMixin {


  //timer
  bool flag = true;
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
        timerStarted = false;
        timerStatus = 'Таймер остановлен';
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
      if (!flag) {
        stopTimer();
      }
    }


    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
      timerStarted = true;
      timerStatus = 'Таймер запущен';
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }
  //end timer

  @override
  void dispose() {
    timerSubscription.cancel();
    timerStream = null;
    /*setState(() {
      timerStarted = false;
    });*/
    timerStarted = false;
    super.dispose();
  }

  TextEditingController _controllerDate, _controllerTime, _controllerBludeMassa,_controllerTimerStatus;

  @override
  void initState() {
    super.initState();
    _controllerDate = TextEditingController(text: Udate);
    _controllerTime = TextEditingController(text: Utime);
    _controllerBludeMassa = TextEditingController(text: UbludeMassa);
    _controllerTimerStatus = TextEditingController(text: timerStatus);
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:switchScreen == 0 ? Container( // дилог выбора действия с бутылкой
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
                                      Text('Таймер сна', style: TextStyle(fontSize: 18.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),),
                                      Text('$Udate $Utime', style: TextStyle(fontSize: 16.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5),),
                                      SizedBox(height: 40,),
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text('$timerStatus', style: TextStyle(fontSize: 18.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                                          ),
                                          /*Container(
                                            alignment: Alignment.centerRight,
                                            child: Text('$bludeValue', style: TextStyle(fontSize: 18.0, color: Color(bodyTextMajor), fontFamily: 'Roboto'),textAlign: TextAlign.right,),

                                          )*/
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
                                                Navigator.pushReplacement(context,
                                                    CupertinoPageRoute(builder: (context) => mainScreenPage()));
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
                                              image: AssetImage("images/sleepIcon.png"),
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
                                      switchScreen = 2;
                                      timerSubscription.cancel();
                                      timerStream = null;
                                      setState(() {
                                        timerStarted = false;
                                      });
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
                height: MediaQuery.of(context).size.height +100,
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
                                        image: AssetImage("images/sleepIcon.png"),
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
                                  Text('Сон', style: TextStyle(fontSize: 22.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),),
                                  Text('$timerStatus', style: TextStyle(fontSize: 18.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto')),
                                ]),
                            SizedBox(height: 40,),
                            Container(
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
                                child: TextFormField(

                                  textAlign: TextAlign.center,
                                  enabled: true,
                                  showCursor: true,
                                  readOnly: true,
                                  //keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 19.0, color: Color(textFieldText)),
                                  onTap: (){
                                    /*setState(() {
                                    switchBlude = true;
                                  });*/
                                  },
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 14.0, color: Color(textFieldHint)),
                                    hintText: 'Мелодия для сна',
                                    prefixIcon: Icon(Icons.music_note, color: Color(textFieldHint),),
                                    fillColor: Color(textFieldBackGround),
                                    filled: true,
                                    suffixIcon: IconButton(
                                        onPressed: () { },
                                        // icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Color(textFieldHint), size: 36,)
                                        icon: Icon(CupertinoIcons.chevron_down_circle, color: Color(textFieldHint), size: 36,)
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
                                  //onChanged: (value){ },
                                  // ignore: deprecated_member_use
                                  //autovalidate: false,
                                  //controller: _controllerBludeType,
                                )),
                            SizedBox(height: 40,),
                            SizedBox(
                                width:200,
                                height: 300,
                                child: Stack(
                                    children: <Widget>[
                                      Container(
                                          width:200,
                                          height: 200,
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100.0),
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 10, color: Color(0xFFFBF9FF)),
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

                                                Positioned(
                                                    top: 1,
                                                    left: -2,
                                                    child: CustomPaint(
                                                      painter: OpenPainter(),
                                                    )
                                                ),
                                              ]
                                          )
                                      ),
                                      Positioned(
                                        top: 150,
                                        left: 60,
                                        child:Container(
                                          width:80,
                                          height: 80,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100.0),
                                            color: Color(0xFFFBF9FF),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(textFieldBorder).withOpacity(0.5),
                                                spreadRadius: 0.2,
                                                offset: Offset(0, 0.5), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: GestureDetector(
                                              onTap: () {
                                                if(timerStarted == false) {timerStream = stopWatchStream();
                                                timerSubscription = timerStream.listen((int newTick) {
                                                  setState(() {
                                                    hoursStr = ((newTick / (60 * 60)) % 60)
                                                        .floor()
                                                        .toString()
                                                        .padLeft(2, '0');
                                                    minutesStr = ((newTick / 60) % 60)
                                                        .floor()
                                                        .toString()
                                                        .padLeft(2, '0');
                                                    secondsStr =
                                                        (newTick % 60).floor().toString().padLeft(2, '0');
                                                  });
                                                });
                                                } else {
                                                  timerSubscription.cancel();
                                                  timerStream = null;
                                                  /*setState(() {
                                                   hoursStr = '00';
                                                   minutesStr = '00';
                                                   secondsStr = '00';
                                                 });*/
                                                  setState(() {
                                                    timerStarted = false;
                                                  });
                                                }
                                              },
                                              child:Text('${timerStarted == false ? 'START' : 'STOP'}', style: TextStyle(fontSize: 12.0, color: Color(0xFF7C52E4), fontFamily: 'Roboto', height: 1.5, fontWeight: FontWeight.bold),)
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 80,
                                        left: 22,
                                        child:Text('$hoursStr:$minutesStr:$secondsStr', style: TextStyle(fontSize: 36.0, color: Color(0xFF221A51), fontFamily: 'Roboto',),),
                                        //child: FlutterStopWatch(),
                                      ),
                                    ])),
                          ]
                      ),

                    ])
            ),
          )
      ),
      bottomNavigationBar: switchScreen == 1 || switchBlude == true ? BottomAppBar(): switchScreen == 0 ? BottomAppBar(): BottomAppBar(
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
                        switchScreen = 0;
                      });
                      /*Navigator.push(context,
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
                SizedBox(height: 10,),


              ]),
        ),
        elevation: 0,
      ),
    );
  }


}
//рисовалка полукругов
class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(textFieldBorder).withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    //draw arc
    canvas.drawArc(Offset(0, 0) & Size(180, 185),
        -3.1, //radians
        3.1, //radians
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
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
