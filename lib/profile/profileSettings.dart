import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:momzy/foto/mainPhotoScreen.dart';
import 'package:momzy/profile/premiumScreen.dart';
import 'package:momzy/statistics/statisticScreen.dart';
import '../addBaby.dart';
import '../addTask.dart';
import '../bottomMenu/fab_bottom_app_bar.dart';
import '../bottomMenu/fab_with_icons.dart';
import '../bottomMenu/layout.dart';
import '../foto/mainPhotoScreen.dart';
import '../main.dart';
import 'package:intl/intl.dart';

import '../mainScreen.dart';

double distance0 = 0.0,slideStart0,distance1 = 0.0,slideStart1;

class profileSettingsScreenPage extends StatefulWidget {
  @override
  _profileSettingsScreenPageState createState() => _profileSettingsScreenPageState();
}

class _profileSettingsScreenPageState extends State<profileSettingsScreenPage>{


  @override
  void initState() {
    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(340.0),
          child: AppBar(
            backgroundColor: Color(0xFFFFFFFF),
            elevation: 0.0,
            brightness: Brightness.dark,
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: Container(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -70,
                    top: -125,
                    child:Transform.rotate(
                      angle: 0.15,
                      child:SizedBox(
                          height:250,
                          width: MediaQuery.of(context).size.width+100,
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: MediaQuery.of(context).size.width+100,
                                height: 250,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  //border: Border.all(color: Color(0xFF6A6A6A)),
                                  color: Color(buttonBackGround),//цвет кружка меняем в зависимости от наличия выплаты

                                ),
                              )
                          )
                      ),
                    ),),
                Positioned(
                  left: 0,
                  top: 50,
                  child:Container(
                      margin: EdgeInsets.fromLTRB(20,0,10,0),
                     child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget> [
                              Text('+7 (999) 654-63-03', style: TextStyle(fontSize: 20.0, color: Color(0xFFFFFFFF), fontFamily: 'Roboto', fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                              Container(
                                height: 28,
                                width: 28,
                                margin: EdgeInsets.fromLTRB(20,0,10,0),
                                padding: EdgeInsets.fromLTRB(5,5,5,5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFFF8D149).withOpacity(0.2),
                                  /*image: DecorationImage(
                                      image: AssetImage("images/ageIcon.png"),
                                      //scale: 0.5,
                                      fit:BoxFit.fitWidth,
                                      alignment: Alignment(0.0, 0.0)
                                  ),*/
                                ),
                              child: Image.asset("images/corona.png"),
                              ),
                            ]),

                        ),
                    ),
                  Positioned(
                    left: 0,
                    top: 75,
                    child:Container(
                      margin: EdgeInsets.fromLTRB(0,20,20,0),
                      padding: EdgeInsets.fromLTRB(1,1,1,1),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 77,
                      child: GestureDetector(
                        onPanStart: (DragStartDetails details) {
                          slideStart0 = details.globalPosition.dx;
                        },
                        onPanUpdate: (DragUpdateDetails details) {
                          distance0 = details.globalPosition.dx - slideStart0;
                        },
                        onPanEnd: (DragEndDetails details) {
                          slideStart0 = 0.0;
                          print(distance0);
                          setState(() {

                          });
                        },
                        child: ListView(
                            padding: EdgeInsets.only(left: 0, top: 0, bottom: 1),
                            //physics: const AlwaysScrollableScrollPhysics (),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              distance0 > 0 ? Container(
                                //margin: EdgeInsets.fromLTRB(20,0,20,0),
                                alignment: Alignment.center,
                                width: 100,
                                height: 70,
                                child: Image.asset("images/del.png",width: 24,height: 24,),
                              ) : Container(),
                              Container(
                                width: MediaQuery.of(context).size.width-40 ,
                                height: 74,
                                margin: EdgeInsets.fromLTRB(0,0,0,0),
                                decoration: BoxDecoration(
                                  color: Color(textFieldBackGround),
                                  borderRadius: BorderRadius.circular(15.0),
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
                                      child: Image.asset("images/boy.png",width: 24,height: 24,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(64,0,20,0),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Станислав', style: TextStyle(fontSize: 17.0, color: Color(textFieldText), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.fromLTRB(0,0,20,0),
                                      child: Icon(CupertinoIcons.chevron_forward),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),


                      Positioned(
                        left: 0,
                        top: 165,
                        child:Container(
                            margin: EdgeInsets.fromLTRB(0,20,20,0),
                            padding: EdgeInsets.fromLTRB(1,1,1,1),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 77,
                                child: GestureDetector(
                                  onPanStart: (DragStartDetails details) {
                                    slideStart1 = details.globalPosition.dx;
                                  },
                                  onPanUpdate: (DragUpdateDetails details) {
                                    distance1 = details.globalPosition.dx - slideStart1;
                                  },
                                  onPanEnd: (DragEndDetails details) {
                                    slideStart1 = 0.0;
                                    print(distance1);
                                    setState(() {

                                    });
                                  },
                                  child: ListView(
                                      padding: EdgeInsets.only(left: 0, top: 0, bottom: 1),
                                    //physics: const AlwaysScrollableScrollPhysics (),
                                      physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      distance1 > 0 ? Container(
                                        //margin: EdgeInsets.fromLTRB(20,0,20,0),
                                        alignment: Alignment.center,
                                        width: 100,
                                        height: 70,
                                          child: Image.asset("images/del.png",width: 24,height: 24,),
                                      ) : Container(),
                                    Container(
                                        width: MediaQuery.of(context).size.width-40 ,
                                        height: 74,
                                        margin: EdgeInsets.fromLTRB(0,0,0,0),
                                        decoration: BoxDecoration(
                                          color: Color(textFieldBackGround),
                                          borderRadius: BorderRadius.circular(15.0),
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
                                                    child: Image.asset("images/girl.png",width: 24,height: 24,),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(64,0,20,0),
                                                  alignment: Alignment.centerLeft,
                                                  child: Text('Кристина', style: TextStyle(fontSize: 17.0, color: Color(textFieldText), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                                                ),
                                                Container(
                                                  alignment: Alignment.centerRight,
                                                  padding: EdgeInsets.fromLTRB(0,0,20,0),
                                                  child: Icon(CupertinoIcons.chevron_forward),
                                                )
                                              ],
                                            ),
                                      ),
                                   ]),
                                ),
                      ),
                  ),


              Positioned(
                      left: 20,
                      top: 275,
                      child:GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                CupertinoPageRoute(builder: (context) => addBabyPage()));
                          },
                          child:DottedBorder(
                          borderType: BorderType.RRect,
                        dashPattern: [10, 8],
                          radius: Radius.circular(12),
                          padding: EdgeInsets.all(6),
                        color: Colors.grey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Container(
                              width: MediaQuery.of(context).size.width-53 ,
                              height: 62,
                              margin: EdgeInsets.fromLTRB(0,0,0,0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20,0,20,0),
                                    alignment: Alignment.centerLeft,
                                    child: Icon(CupertinoIcons.add),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(64,0,20,0),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Добавить', style: TextStyle(fontSize: 17.0, color: Color(textFieldText), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.fromLTRB(0,0,20,0),
                                    child: Icon(CupertinoIcons.chevron_forward),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                  ),
              ),

                ]
              ),
            )
          )
      ),

      body:Container(
        decoration: new BoxDecoration(
            /*gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF7C52E4),
                Colors.white
              ],
            )*/),
        child: SingleChildScrollView(

          physics: ScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },

            child:Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(30),
                color: Color(0xFFFFFFFF),
              ),
              child:Column(
                  children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20,0,20,0),
                    alignment: Alignment.centerLeft,
                    child: Text('Профиль', style: TextStyle(fontSize: 16.0, color: Color(textFieldText), fontFamily: 'Roboto', fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                  ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => premiumScreenPage()));
                },

                child:Container(
                      width: MediaQuery.of(context).size.width-40 ,
                      height: 74,
                      margin: EdgeInsets.fromLTRB(20,20,20,0),
                      decoration: BoxDecoration(
                        color: Color(textFieldBackGround),
                        borderRadius: BorderRadius.circular(15.0),
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
                            child: Image.asset("images/corona.png",width: 24,height: 24,),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(64,0,20,0),
                            alignment: Alignment.centerLeft,
                            child: Text('Премиум', style: TextStyle(fontSize: 17.0, color: Color(textFieldText), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(0,0,20,0),
                            child: Icon(CupertinoIcons.chevron_forward),
                          )
                        ],
                      ),
                    ),
            ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          CupertinoPageRoute(builder: (context) => momzyHomePage()));
                    },

                    child:Container(
                      width: MediaQuery.of(context).size.width-40 ,
                      height: 74,
                      margin: EdgeInsets.fromLTRB(0,15,0,20),
                      decoration: BoxDecoration(
                        color: Color(textFieldBackGround),
                        borderRadius: BorderRadius.circular(15.0),
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
                            child: Image.asset("images/exit.png",width: 24,height: 24,),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(64,0,20,0),
                            alignment: Alignment.centerLeft,
                            child: Text('Выйти', style: TextStyle(fontSize: 17.0, color: Color(textFieldText), fontFamily: 'Roboto'),textAlign: TextAlign.left,),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(0,0,20,0),
                            child: Icon(CupertinoIcons.chevron_forward),
                          )
                        ],
                      ),
                    ),
            ),

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
