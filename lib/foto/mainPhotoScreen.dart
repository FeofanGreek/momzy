import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:momzy/bottomMenu/fab_bottom_app_bar.dart';
import 'package:momzy/bottomMenu/fab_with_icons.dart';
import 'package:momzy/bottomMenu/layout.dart';
import 'package:momzy/foto/slidePhotos.dart';
import 'package:momzy/profile/profileSettings.dart';
import 'package:momzy/statistics/statisticScreen.dart';
import '../addBaby.dart';
import '../addTask.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

import '../mainScreen.dart';

/*final List<Map> photos =
List.generate(60, (index) => {"id": index, "name": "${index == 11 ? '$index месяцев': index == 12 ? '$index месяцев': index == 13 ? '$index месяцев': index == 14 ? '$index месяцев': index.toString()[index.toString().length-1] == '1' ? '$index месяц' : index.toString()[index.toString().length-1] == '2' ?  '$index месяца' : index.toString()[index.toString().length-1] == '3' ?  '$index месяца' : index.toString()[index.toString().length-1] == '4' ?  '$index месяца' : '$index месяцев'}"})
    .toList();*/

/*final List<Map> photos =
List.generate(60, (index) => {"id": index, "name":
"${index < 12 ?
(index == 1 ? '$index месяц' : index == 2 ? '$index месяца' : index == 3 ? '$index месяца' : index == 4 ? '$index месяца' : '$index месяцев' ) :

    (
        index/48 >= 1 ? '4 года ${index-48 == 1 ? '${index-48} месяц' : index-48 == 2 ? '${index-48} месяца' : index-48 == 3 ? '${index-48} месяца' : index-48 == 4 ? '${index-48} месяца' : '${index-48 > 0 ? '${index-48} месяцев' : ''}'}' :
        index/36 >= 1 ? '3 года ${index-36 == 1 ? '${index-36} месяц' : index-36 == 2 ? '${index-36} месяца' : index-36 == 3 ? '${index-36} месяца' : index-36 == 4 ? '${index-36} месяца' : '${index-36 > 0 ? '${index-36} месяцев' : ''}'}' :
        index/24 >= 1 ? '2 года ${index-24 == 1 ? '${index-24} месяц' : index-24 == 2 ? '${index-24} месяца' : index-24 == 3 ? '${index-24} месяца' : index-24 == 4 ? '${index-24} месяца' : '${index-24 > 0 ? '${index-24} месяцев' : ''}'}' :
        index/12 >= 1 ? '1 год ${index-12 == 1 ? '${index-12} месяц' : index-12 == 2 ? '${index-12} месяца' : index-12 == 3 ? '${index-12} месяца' : index-12 == 4 ? '${index-12} месяца' : '${index-12 > 0 ? '${index-12} месяцев' : ''}'}' :


    '5 лет')}"})
    .toList();*/
int count2= 0;
bool switchBabySex = false;
int switchMethod = 2;
final List<Map> photos =
List.generate(60, (index) => {"id": index, "name":
"${index < 12 ?
(index == 1 ? '$index месяц' : index == 2 ? '$index месяца' : index == 3 ? '$index месяца' : index == 4 ? '$index месяца' : '$index месяцев' ) :

(
    index/48 >= 1 ? '4 года ${index-48 > 0 ? '${index-48} мес.' : ''}' :
    index/36 >= 1 ? '3 года ${index-36 > 0 ? '${index-36} мес.' : ''}':
    index/24 >= 1 ? '2 года ${index-24 > 0 ? '${index-24} мес.' : ''}':
    index/12 >= 1 ? '1 год ${index-12 > 0 ? '${index-12} мес.' : ''}':


    '5 лет')}", "image" : "${index == 10 ? 'https://ostrovok.club/wp-content/uploads/2018/01/Babysitting-Courses-featured-1.jpg' : index == 3 ? 'https://images.inteltoys.ru/500x500/galleries/2019/04/50_1556535487.jpg' : index == 5 ? 'https://javasea.ru/uploads/posts/2019-02/1550229294_spyaschiy-malysh-s-otkrytym-rtom.jpg': index == 8 ? 'https://images.ctfassets.net/u4vv676b8z52/12FNn9egARB3yVQRLeEaQC/c4511bcec50e30503d45eadef4d6a942/baby-scarf-hat-1200x630.jpeg?fm=jpg&q=80':'0'}",
  "switch" : index == 10 ? count2++ : index == 3 ? count2++ : index == 5 ? count2++ : index == 8 ? count2++ :0})
    .toList();

bool nightMode = false;
var dateTime1 = DateFormat('d.M.yyyy').parse(UbabyBornDate);
final date2 = DateTime.now();
final difference = date2.difference(dateTime1).inDays;


class mainPhotoScreenPage extends StatefulWidget {
  @override
  _mainPhotoScreenPageState createState() => _mainPhotoScreenPageState();
}

class _mainPhotoScreenPageState extends State<mainPhotoScreenPage>{


  @override
  void initState() {
    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:AppBar(
          elevation: 0.0,
          title: Container(
            margin: EdgeInsets.fromLTRB(0,0,0,0),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child:
            Stack(
                children: <Widget> [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        switchBabySex == false ?  Container(
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
                            ),),):Container(),

                        Text('$UbabyName', style: TextStyle(fontSize: 20.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', ),textAlign: TextAlign.left,),
                        switchBabySex == false ? Container(
                          child: Material(
                            color: Color(buttonBackGround), // button color
                            child: InkWell(
                              splashColor: Color(buttonBackGround), // splash color
                              onTap: () {
                                setState(() {
                                  switchBabySex = true;
                                  switchMethod = 1;
                                });
                              }, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('', style: TextStyle(fontSize: 2.0,)),
                                  Icon(Icons.expand_more, size: 30.0, color: Color(0xFFFFFFFF)), // icon
                                ],
                              ),
                            ),
                          ),
                        ): Container(),
                      ]),
                ]
            ),
          ),
          centerTitle: false,
          backgroundColor: switchBabySex == false ? Color(buttonBackGround) : Colors.black.withOpacity(0.7),
          brightness: Brightness.dark,
        ),
        body: Container( child: Stack( children: <Widget> [ Container(
          decoration: new BoxDecoration(
            color:  Colors.white,
          ),
          child: Padding(

            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 99,
                    childAspectRatio: 99/130,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: photos.length,
                itemBuilder: (BuildContext ctx, index) {

                  return photos[index]["image"] == '0' ? GestureDetector(
                      onTap: () {
                        setState(() {
                          switchMethod = 0;
                          switchBabySex = true;
                        });
                      }, child: Container(
                    height: 106,
                    alignment: Alignment.center,
                    child:Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.fromLTRB(0,40,0,20),
                          child: Text(photos[index]["name"], style: TextStyle(fontSize: 14.0, color: Color(0xFFAFAFC9), fontFamily: 'Roboto', ),textAlign: TextAlign.center,),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height:50,
                            width: 50,
                            margin: EdgeInsets.fromLTRB(0,30,0,20),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/babyIcon.png"),
                                  fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                              ),
                            ),),
                        )
                      ],
                    ),
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
                  ) ):
                  GestureDetector(
                      onTap: () {

                        Navigator.pushReplacement(context,
                            CupertinoPageRoute(builder: (context) => slidePhotoScreenPage(photos[index]["switch"])));
                      }, child: Container(
                    height: 106,
                    alignment: Alignment.center,
                    child:Stack(
                      children: <Widget>[
                        Container(
                          width: 89,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0,88,0,13),
                          child: Text(photos[index]["name"], style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Roboto', ),textAlign: TextAlign.center,),
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(photos[index]["image"]),
                          fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                      ),
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
                  ));
                }),
          ),
        ),

          switchBabySex != false ? switchMethod == 1 ? Positioned(
              top: 0,
              left: 0,
              child:
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                      children: <Widget> [
                        SizedBox(height: MediaQuery.of(context).size.height - 310, width: MediaQuery.of(context).size.width - 40-20,),
                        Container(
                            width: MediaQuery.of(context).size.width - 40-20,
                            height: 119,
                            margin: EdgeInsets.fromLTRB(0,20,0,20),
                            //padding: EdgeInsets.fromLTRB(0,0,0,0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white),
                            child: Column(
                                children: <Widget> [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          UbabySex = 'Мальчик';
                                          UbabyName = 'Станислав';
                                          switchBabySex = false;
                                          //_controllerSex = TextEditingController(text: UbabySex);
                                        });
                                      },
                                      child: Container(
                                          width: MediaQuery.of(context).size.width - 40-20,
                                          height: 59,
                                          child: Row(
                                              children: <Widget> [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  margin: EdgeInsets.fromLTRB(20,0,20,0),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage("images/boy.png"),
                                                        fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                                                    ),
                                                  ),),
                                                Text('Станислав', style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto'),textAlign: TextAlign.left,)
                                              ]
                                          ))),
                                  SizedBox(height: 1.0, width: MediaQuery.of(context).size.width - 40-20,
                                    child: const DecoratedBox(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                      ),),),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          UbabySex = 'Девочка';
                                          UbabyName = 'Кристина';
                                          switchBabySex = false;
                                          //_controllerSex = TextEditingController(text: UbabySex);
                                        });
                                      },
                                      child: Container(
                                          width: MediaQuery.of(context).size.width - 40-20,
                                          height: 59,
                                          child: Row(
                                              children: <Widget> [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  margin: EdgeInsets.fromLTRB(20,0,20,0),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage("images/girl.png"),
                                                        fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                                                    ),
                                                  ),),
                                                Text('Кристина', style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto'),textAlign: TextAlign.left,)
                                              ]
                                          ))),
                                ])
                        ),
                        FlatButton(
                          onPressed:(){
                            setState(() {
                              switchBabySex = false;
                            });

                          } ,
                          minWidth: MediaQuery.of(context).size.width - 40-20,
                          height: 55,
                          child: Text('Отменить', style: TextStyle(fontSize: 14.0, color: Color(0xFF7C52E4), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          color: Colors.white,
                          textColor: Color(0xFF7C52E4),
                          disabledColor: Colors.white,
                          disabledTextColor: Colors.grey,
                          //padding: EdgeInsets.fromLTRB(50,10,50,10),
                          splashColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )
                      ]
                  )
              )
          ):  switchMethod == 0 ? Positioned(
              top: 0,
              left: 0,
              child:
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                      children: <Widget> [
                        SizedBox(height: MediaQuery.of(context).size.height - 310, width: MediaQuery.of(context).size.width - 40-20,),
                        Container(
                            width: MediaQuery.of(context).size.width - 40-20,
                            height: 119,
                            margin: EdgeInsets.fromLTRB(0,20,0,20),
                            //padding: EdgeInsets.fromLTRB(0,0,0,0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white),
                            child: Column(
                                children: <Widget> [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          //UbabySex = 'Мальчик';
                                          //UbabyName = 'Станислав';
                                          switchBabySex = false;
                                          //_controllerSex = TextEditingController(text: UbabySex);
                                        });
                                      },
                                      child: Container(
                                          width: MediaQuery.of(context).size.width - 40-20,
                                          height: 59,
                                          child: Row(
                                              children: <Widget> [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  margin: EdgeInsets.fromLTRB(20,0,20,0),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage("images/gallery.png"),
                                                        fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                                                    ),
                                                  ),),
                                                Text('Загрузить с телефона', style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto'),textAlign: TextAlign.left,)
                                              ]
                                          ))),
                                  SizedBox(height: 1.0, width: MediaQuery.of(context).size.width - 40-20,
                                    child: const DecoratedBox(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                      ),),),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          //UbabySex = 'Девочка';
                                          //UbabyName = 'Кристина';
                                          switchBabySex = false;
                                          //_controllerSex = TextEditingController(text: UbabySex);
                                        });
                                      },
                                      child: Container(
                                          width: MediaQuery.of(context).size.width - 40-20,
                                          height: 59,
                                          child: Row(
                                              children: <Widget> [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  margin: EdgeInsets.fromLTRB(20,0,20,0),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage("images/camera.png"),
                                                        fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                                                    ),
                                                  ),),
                                                Text('Сфотографировать', style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto'),textAlign: TextAlign.left,)
                                              ]
                                          ))),
                                ])
                        ),
                        FlatButton(
                          onPressed:(){
                            setState(() {
                              switchBabySex = false;
                            });

                          } ,
                          minWidth: MediaQuery.of(context).size.width - 40-20,
                          height: 55,
                          child: Text('Отменить', style: TextStyle(fontSize: 14.0, color: Color(0xFF7C52E4), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          color: Colors.white,
                          textColor: Color(0xFF7C52E4),
                          disabledColor: Colors.white,
                          disabledTextColor: Colors.grey,
                          //padding: EdgeInsets.fromLTRB(50,10,50,10),
                          splashColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )
                      ]
                  )
              )
          ):Container():Container(),

        ])),

      bottomNavigationBar: switchBabySex == false ? FABBottomAppBar(
        centerItemText: '',
        color: Colors.grey,
        backgroundColor: switchBabySex == false ? Color(0xFFF2EDFD) : Colors.black.withOpacity(0.7),
        selectedColor: Color(0xFF7C52E4),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: test,
        items: [
          FABBottomAppBarItem(iconData: AssetImage("images/homeIcon.png"), text: ''),
          FABBottomAppBarItem(iconData: AssetImage("images/statisticIcon.png"), text: ''),
          FABBottomAppBarItem(iconData: AssetImage("images/galleryIcon.png"), text: ''),
          FABBottomAppBarItem(iconData: AssetImage("images/settingIcon.png"), text: ''),
        ],
      ) : SizedBox(width: 0,height: 0,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked ,
      floatingActionButton: switchBabySex == false ? _buildFab(
          context) : SizedBox(width: 0,height: 0,), // This trailing comma makes auto-formatting nicer for build methods.
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
              backgroundColor: switchBabySex == false ? Color(0xFF7C52E4) : Colors.black.withOpacity(0.7),
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
