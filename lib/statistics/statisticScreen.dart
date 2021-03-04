import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:momzy/bottomMenu/fab_bottom_app_bar.dart';
import 'package:momzy/bottomMenu/fab_with_icons.dart';
import 'package:momzy/bottomMenu/layout.dart';
import 'package:momzy/foto/mainPhotoScreen.dart';
import 'package:momzy/foto/slidePhotos.dart';
import 'package:momzy/profile/profileSettings.dart';
import '../addBaby.dart';
import '../addTask.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

import '../mainScreen.dart';
import 'package:fl_chart/fl_chart.dart';


int topMenuSwitch = 0;

class statisticsScreenPage extends StatefulWidget {
  @override
  _statisticsScreenPageState createState() => _statisticsScreenPageState();
}

class _statisticsScreenPageState extends State<statisticsScreenPage>{

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  List<Color> gradientColors2 = [
    const Color(0xffE4526C),
    const Color(0xffE5E937),
  ];

  bool showAvg = false;

  @override
  void initState() {
    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
            elevation: 0.0,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(0,0,0,0),
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            child:
            Stack(
              children: <Widget> [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 24,
                          width: 24,
                          margin: EdgeInsets.fromLTRB(0,0,10,0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(UbabySex == 'Мальчик' ? "images/boy.png" :  "images/girl.png"),
                                fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                            ),
                          ),),),

                      Text('$UbabyName', style: TextStyle(fontSize: 18.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                      Container(
                        child: Material(
                          color: Color(buttonBackGround), // button color
                          child: InkWell(
                            splashColor: Color(buttonBackGround), // splash color
                            onTap: () {}, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('', style: TextStyle(fontSize: 2.0,)),
                                Icon(Icons.expand_more, size: 30.0, color: Color(0xFFFFFFFF)), // icon
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(0,100,0,0),
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  color: Color(buttonBackGround),
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics (),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget> [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            topMenuSwitch = 0;
                          });
                        },
                          child: topMenuSwitch != 0 ?Container(
                            margin: EdgeInsets.fromLTRB(0,0,10,0),
                              child: GradientText(
                                "Кормление",
                                gradient: LinearGradient(colors: [
                                  Color(buttonBackGround),
                                  Color(textFieldHint),
                                ]),
                                style: TextStyle(fontSize: 16.0, color: Color(textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                              ):Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.0, color: Colors.white),
                              ),
                              //color: Colors.white,
                            ),
                            margin: EdgeInsets.fromLTRB(10,0,10,0),
                            child: Text('Кормление', style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto',),textAlign: TextAlign.left,),
                          ),
                      ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          topMenuSwitch = 1;
                        });
                      },
                      child: topMenuSwitch != 1 ?Container(
                        margin: EdgeInsets.fromLTRB(10,0,10,0),
                        child: Text('Сон', style: TextStyle(fontSize: 16.0, color: Color(textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                      ):Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.white),
                          ),
                          //color: Colors.white,
                        ),
                        margin: EdgeInsets.fromLTRB(10,0,10,0),
                        child: Text('Сон', style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto',),textAlign: TextAlign.left,),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          topMenuSwitch = 2;
                        });
                      },
                      child: topMenuSwitch != 2 ? Container(
                        margin: EdgeInsets.fromLTRB(10,0,10,0),
                        child: Text('Подгузники', style: TextStyle(fontSize: 16.0, color: Color(textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                      ):Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.white),
                          ),
                          //color: Colors.white,
                        ),
                        margin: EdgeInsets.fromLTRB(10,0,10,0),
                        child: Text('Подгузники', style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto',),textAlign: TextAlign.left,),
                      ),
                    ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        topMenuSwitch = 3;
                      });
                    },
                    child: topMenuSwitch != 3 ? Container(
                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                        child: GradientText(
                          "Кормление",
                          gradient: LinearGradient(colors: [
                            Color(textFieldHint),
                            Color(buttonBackGround),
                          ]),
                          style: TextStyle(fontSize: 16.0, color: Color(textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                      ): Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.white),
                        ),
                        //color: Colors.white,
                      ),
                      margin: EdgeInsets.fromLTRB(10,0,10,0),
                      child: Text('Кормление', style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto',),textAlign: TextAlign.left,),
                    ),
                  ),
                    ],
                  ),
                ),
              ]
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(buttonBackGround),
        brightness: Brightness.dark,
      )),
      body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  margin: EdgeInsets.fromLTRB(20,20,20,0),
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(textFieldBackGround),
                    borderRadius: BorderRadius.circular(16),
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
                        child: Text('Статистика за неделю', style: TextStyle(fontSize: 14.0, color: Color(textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20,0,20,0),
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(textFieldHint),
                            borderRadius: BorderRadius.circular(12),
                          ),child: Icon(CupertinoIcons.chevron_down_circle_fill, color: Colors.white,),
                        )
                      )
                    ],
                  ),),


                Container(
                  margin: EdgeInsets.fromLTRB(20,15,20,0),
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(textFieldBackGround),
                    borderRadius: BorderRadius.circular(16),
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
                        alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(textFieldHint),
                      borderRadius: BorderRadius.circular(12),
                    ),
                        child: Icon(CupertinoIcons.chevron_left_circle_fill, color: Colors.white,),
                  )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20,0,20,0),
                        alignment: Alignment.center,
                        child: Text('7-13 Декабря', style: TextStyle(fontSize: 14.0, color: Color(textFieldHint), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20,0,20,0),
                          padding: EdgeInsets.fromLTRB(0,0,0,0),
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(textFieldHint),
                            borderRadius: BorderRadius.circular(12),
                          ),
                            child: Icon(CupertinoIcons.chevron_right_circle_fill, color: Colors.white,),
                        )
                      )
                    ],
                  ),),
              Container(
            //alignment: Alignment.centerRight,
              margin: EdgeInsets.fromLTRB(20,20,20,20),
                child: Text('Количество кормлений в день', style: TextStyle(fontSize: 20.0, color: Color(0xFF000000), fontFamily: 'Roboto', fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
            ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('В среднем', style: TextStyle(fontSize: 12.0, color: Color(0xFFAFAFC9), fontFamily: 'Roboto',),textAlign: TextAlign.left,),
                        Text('8', style: TextStyle(fontSize: 22.0, color: Color(0xFFAFAFC9), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                      ]
                    ),
                    SizedBox(width: 30,),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Минимум', style: TextStyle(fontSize: 12.0, color: Color(0xFFAFAFC9), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                          Text('18', style: TextStyle(fontSize: 22.0, color: Color(0xFFAFAFC9), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                        ]
                    ),
                    SizedBox(width: 30,),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Максимум', style: TextStyle(fontSize: 12.0, color: Color(0xFFAFAFC9), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                          Text('10', style: TextStyle(fontSize: 22.0, color: Color(0xFFAFAFC9), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                        ]
                    ),
                  ]
                ),
                SizedBox(height: 20,),
                Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 10, top: 20, bottom: 20),
                          child: LineChart(
                            mainData(),
                            swapAnimationDuration: const Duration(milliseconds: 250),
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 10, top: 20, bottom: 20),
                          child: LineChart(
                            mainData1(),
                            swapAnimationDuration: const Duration(milliseconds: 250),
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 10, top: 20, bottom: 20),
                          child: LineChart(
                            mainData2(),
                            swapAnimationDuration: const Duration(milliseconds: 250),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                    children: <Widget>[
                      SizedBox(width: 20,),
                      Container(width: 12,height: 12,decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),),
                      SizedBox(width: 10,),
                      Text('Бутылкой'),
                      SizedBox(width: 20,),
                      Container(width: 12,height: 12,decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),),
                      SizedBox(width: 10,),
                      Text('Грудью'),
                      SizedBox(width: 20,),
                      Container(width: 12,height: 12,decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(6),
                      ),),
                      SizedBox(width: 10,),
                      Text('Всего'),
                    ]
                ),
                SizedBox(height: 30,),
                Stack(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.fromLTRB(20,0,20,0),
                            //width: (MediaQuery.of(context).size.width - 40)/3,
                            child: Text('Рост', style: TextStyle(fontSize: 14.0, color: Color(0xFF000000), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(0,0,20,0),
                            //width: (MediaQuery.of(context).size.width - 40)/3,
                            child:
                            Text('См', style: TextStyle(fontSize: 14.0, color: Color(0xFF000000), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                          ),
                        ]
                    ),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 10, top: 20, bottom: 20),
                          child: LineChart(
                            mainData(),
                            swapAnimationDuration: const Duration(milliseconds: 250),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 30,),
                Stack(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.fromLTRB(20,0,20,0),
                            //width: (MediaQuery.of(context).size.width - 40)/3,
                            child: Text('Вес', style: TextStyle(fontSize: 14.0, color: Color(0xFF000000), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(0,0,20,0),
                            //width: (MediaQuery.of(context).size.width - 40)/3,
                            child:
                            Text('Кг', style: TextStyle(fontSize: 14.0, color: Color(0xFF000000), fontFamily: 'Roboto'),textAlign: TextAlign.left,),

                          ),
                        ]
                    ),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 10, top: 20, bottom: 20),
                          child: LineChart(
                            mainData1(),
                            swapAnimationDuration: const Duration(milliseconds: 250),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
              ],
            )
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
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked ,
      floatingActionButton:_buildFab(
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


  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          //print(value);
          return FlLine(
            color: const Color(0xffAFAFC9),
            strokeWidth: 0.2,
            dashArray: [10,4] ,

          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,

          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xffAFAFC9), fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Первая\nнеделя';
              case 4:
                return 'Вторая\nнеделя';
              case 7:
                return 'Третья\nнеделя';
              case 10:
                return 'Четвертая\nнеделя';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xffAFAFC9), fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 2:
                return '10';
              case 4:
                return '20';
              case 6:
                return '30';
              case 8:
                return '40';
              case 10:
                return '50';
              case 12:
                return '60';
              case 14:
                return '70';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 15,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1.5),
            FlSpot(2.6, 2),
            FlSpot(4.9, 4),
            FlSpot(6.8, 4.5),
            FlSpot(8, 7),
            FlSpot(9.5, 10),
            FlSpot(11, 14),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData mainData1() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          //print(value);
          return FlLine(
            color: const Color(0xffAFAFC9),
            strokeWidth: 0.2,
            dashArray: [10,4] ,

          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,

          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xffAFAFC9), fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Первая\nнеделя';
              case 4:
                return 'Вторая\nнеделя';
              case 7:
                return 'Третья\nнеделя';
              case 10:
                return 'Четвертая\nнеделя';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xffAFAFC9), fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 2:
                return '10';
              case 4:
                return '20';
              case 6:
                return '30';
              case 8:
                return '40';
              case 10:
                return '50';
              case 12:
                return '60';
              case 14:
                return '70';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 15,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 6),
            FlSpot(2.6, 3.5),
            FlSpot(4.9, 4),
            FlSpot(6.8, 8),
            FlSpot(8, 9),
            FlSpot(9.5, 10),
            FlSpot(11, 7),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors2.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData mainData2() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          //print(value);
          return FlLine(
            color: const Color(0xffAFAFC9),
            strokeWidth: 0.2,
            dashArray: [10,4] ,

          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,

          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xffAFAFC9), fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Первая\nнеделя';
              case 4:
                return 'Вторая\nнеделя';
              case 7:
                return 'Третья\nнеделя';
              case 10:
                return 'Четвертая\nнеделя';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xffAFAFC9), fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 2:
                return '10';
              case 4:
                return '20';
              case 6:
                return '30';
              case 8:
                return '40';
              case 10:
                return '50';
              case 12:
                return '60';
              case 14:
                return '70';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 15,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 15),
            FlSpot(2.6, 12),
            FlSpot(4.9, 8),
            FlSpot(6.8, 11),
            FlSpot(8, 9),
            FlSpot(9.5, 10),
            FlSpot(11, 15),
          ],
          isCurved: true,
          colors: [Color(0xFFE4526C),Color(0xFFE4526C)],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
            colors: gradientColors2.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }


}


