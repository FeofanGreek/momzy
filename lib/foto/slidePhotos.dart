import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:momzy/bottomMenu/fab_bottom_app_bar.dart';
import 'package:momzy/bottomMenu/fab_with_icons.dart';
import 'package:momzy/bottomMenu/layout.dart';
import 'package:momzy/foto/mainPhotoScreen.dart';
import '../addBaby.dart';
import '../addTask.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

import '../mainScreen.dart';

var distance;
var count = -1;

double slideStart = 0.0;
double scrollPosition = 0.0;
final List<Map> photos =
List.generate(60, (index) => {"id": index, "name":
"${index < 12 ?
(index == 1 ? '$index месяц' : index == 2 ? '$index месяца' : index == 3 ? '$index месяца' : index == 4 ? '$index месяца' : '$index месяцев' ) :

(
    index/48 >= 1 ? '4 года ${index-48 > 0 ? '${index-48} мес.' : ''}' :
    index/36 >= 1 ? '3 года ${index-36 > 0 ? '${index-36} мес.' : ''}':
    index/24 >= 1 ? '2 года ${index-24 > 0 ? '${index-24} мес.' : ''}':
    index/12 >= 1 ? '1 год ${index-12 > 0 ? '${index-12} мес.' : ''}':


    '5 лет')}", "image" : "${index == 10 ? 'https://ostrovok.club/wp-content/uploads/2018/01/Babysitting-Courses-featured-1.jpg' : index == 3 ? 'https://images.inteltoys.ru/500x500/galleries/2019/04/50_1556535487.jpg' : index == 5 ? 'https://javasea.ru/uploads/posts/2019-02/1550229294_spyaschiy-malysh-s-otkrytym-rtom.jpg': index == 8 ? 'https://images.ctfassets.net/u4vv676b8z52/12FNn9egARB3yVQRLeEaQC/c4511bcec50e30503d45eadef4d6a942/baby-scarf-hat-1200x630.jpeg?fm=jpg&q=80':'0'}"})
    .toList();

bool nightMode = false;
var dateTime1 = DateFormat('d.M.yyyy').parse(UbabyBornDate);
final date2 = DateTime.now();
final difference = date2.difference(dateTime1).inDays;


class slidePhotoScreenPage extends StatefulWidget {

  final int recordName;
  const slidePhotoScreenPage(this.recordName);


  @override
  _slidePhotoScreenPageState createState() => _slidePhotoScreenPageState();
}

class _slidePhotoScreenPageState extends State<slidePhotoScreenPage>{
  final _controllerTwo = ScrollController();

  @override
  void initState() {
    count=-1;
    for(int i = 0; i < photos.length; i++){
      photos[i]["image"] != '0' ? count++ : null;
    }
    super.initState();
    //перемотать на нужный экран
    scrollPosition = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) =>scrollPosition = MediaQuery.of(context).size.width * (widget.recordName-1));

    WidgetsBinding.instance.addPostFrameCallback((_) => _controllerTwo.animateTo(MediaQuery.of(context).size.width * widget.recordName, duration: Duration(seconds: 1), curve: Curves.ease));
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        /*appBar: AppBar(
            backgroundColor: Color(0xFF262626).withOpacity(0.75),
            elevation: 0.0,
            brightness: Brightness.dark,),*/
      body: ListView.builder(
          //physics: const AlwaysScrollableScrollPhysics (),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          controller: _controllerTwo,
              scrollDirection: Axis.horizontal,
                itemCount: photos.length,
                itemBuilder: (BuildContext context, int index) {
                    return photos[index]["image"] != '0' ? GestureDetector(
                        onPanStart: (DragStartDetails details) {
                          slideStart = details.globalPosition.dx;
                        },
                        onPanUpdate: (DragUpdateDetails details) {
                          distance = details.globalPosition.dx - slideStart;
                        },
                        onPanEnd: (DragEndDetails details) {
                          slideStart = 0.0;
                          print(distance);

                          //+ve distance signifies a drag from left to right(start to end)
                          //-ve distance signifies a drag from right to left(end to start)
                          if(distance > 0){
                            print('Скролим в право $scrollPosition');
                            scrollPosition > 0 ? scrollPosition = scrollPosition - MediaQuery.of(context).size.width : null;
                            _controllerTwo.animateTo(scrollPosition, duration: Duration(seconds: 1), curve: Curves.ease);
                            setState(() {

                            });
                          }else{
                            print('скролим в лево $scrollPosition');
                            scrollPosition < MediaQuery.of(context).size.width * count ? scrollPosition = scrollPosition + MediaQuery.of(context).size.width : null;
                            _controllerTwo.animateTo(scrollPosition, duration: Duration(seconds: 1), curve: Curves.ease);
                            setState(() {

                            });
                          }
                        },

                  child:Container(

                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        image: DecorationImage(
                          image: NetworkImage(photos[index]["image"]),
                            fit:BoxFit.fitHeight,
                        ),
                      ),
                        child: Container(
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
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.centerLeft,
                                    color: Color(0xFF262626).withOpacity(0.75),
                                  ),
                                    Container(
                                      height: 100,
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                                      child: InkWell(
                                        splashColor: Color(buttonBackGround), // splash color
                                        onTap: () {
                                          Navigator.pushReplacement(context,
                                              CupertinoPageRoute(builder: (context) => mainPhotoScreenPage()));
                                        }, // button pressed
                                        child: Icon(CupertinoIcons.chevron_back, size: 30.0, color: Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                    Container(
                                        height: 100,
                                        alignment: Alignment.center,
                                        child: Text('${photos[index]["name"]}', style: TextStyle(fontSize: 18.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                                    ),
                                    Container(
                                      height: 100,
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.fromLTRB(0,0,10,0),
                                      child: InkWell(
                                        splashColor: Color(buttonBackGround), // splash color
                                        onTap: () {
                                          /*Navigator.pushReplacement(context,
                                              CupertinoPageRoute(builder: (context) => addBabyPage()));*/
                                        }, // button pressed
                                        child: Icon(CupertinoIcons.square_arrow_down, size: 30.0, color: Color(0xFFFFFFFF)),
                                      ),
                                    ),

                                  ]
                              ),
                            ),
                  )) : Container();
                }
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
