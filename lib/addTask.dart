import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'addBaby.dart';
import 'futuretasks/bathFuture.dart';
import 'futuretasks/bottleFuture.dart';
import 'futuretasks/feedFuture.dart';
import 'futuretasks/pampersFuture.dart';
import 'futuretasks/playFuture.dart';
import 'futuretasks/shpritzFuture.dart';
import 'futuretasks/sleepFuture.dart';
import 'futuretasks/walkfuture.dart';
import 'main.dart';
import 'mainScreen.dart';

class addTaskPage extends StatefulWidget {
  @override
  _addTaskPageState createState() => _addTaskPageState();
}

class _addTaskPageState extends State<addTaskPage>{

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
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child:
          Stack(
              children: <Widget> [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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

                      Text('$UbabyName', style: TextStyle(fontSize: 20.0, color: Color(0xFF000000), fontFamily: 'Roboto', ),textAlign: TextAlign.left,),
                      Container(
                        child: Material(
                          color: Color(backGround), // button color
                          child: InkWell(
                            splashColor: Color(buttonBackGround), // splash color
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  CupertinoPageRoute(builder: (context) => addBabyPage()));
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('', style: TextStyle(fontSize: 2.0,)),
                                Icon(Icons.expand_more, size: 30.0, color: Color(0xFF000000)), // icon
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ]
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(backGround),
        brightness: Brightness.light,
      ),

      body:SingleChildScrollView(
          physics: ScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(backGround),),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(20,20,20,0),
                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 40 ,
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
                        style: TextStyle(fontSize: 17.0, color: Color(textFieldText)),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0,0,0,0),
                          hintStyle: TextStyle(fontSize: 17.0, color: Color(textFieldHint)),
                          hintText: "Поиск",
                          prefixIcon: Icon(Icons.search, color: Color(textFieldHint),),
                          fillColor: Color(textFieldBackGround),
                          filled: true,
                          suffixIcon: IconButton(
                            //onPressed: () => _controllerName.clear(),
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
                        //onChanged: (value){ UbabyName = value;},
                        // ignore: deprecated_member_use
                        autovalidate: false,
                        //controller: _controllerName,
                      )),
                  //блок выбора задач
                  Container(
                      margin: EdgeInsets.fromLTRB(20,20,0,0),
                      alignment: Alignment.centerLeft,
                      child: Text('Основное', style: TextStyle(fontSize: 16.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        GestureDetector(
                        onTap: () {
                  Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => sleepFuturePage()));
                  },
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
                            Text('Сон', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)

                            ]),
                        ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => bottleFuturePage()));
                  },
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
                                        color: Color(textFieldBorder).withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0.5), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xFFF2EDFD),
                                  ),
                                ),
                                Text('Бутылка', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => feedFuturePage()));
                  },
                  child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
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
                                        color: Color(textFieldBorder).withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0.5), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xFFF2EDFD),
                                  ),
                                ),
                                Text('Кормление', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => pampersFuturePage()));
                  },
                  child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
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
                                        color: Color(textFieldBorder).withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0.5), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xFFF2EDFD),
                                  ),
                                ),
                                Text('Подгузник', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),
              ),
                        ]),

                  ),
                  SizedBox(height: 10,),
                  //конец блока выбора задач
                  //блок выбора задач
                  Container(
                      margin: EdgeInsets.fromLTRB(20,20,0,0),
                      alignment: Alignment.centerLeft,
                      child: Text('Параметры ребенка', style: TextStyle(fontSize: 16.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/tollIconColor.png"),
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
                                Text('Рост', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),
                          Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/massaIconColor.png"),
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
                                Text('Вес', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),
                          Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,10),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
                                  /*decoration: BoxDecoration(
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
                                  ),*/
                                ),
                                //Text('Кормление')
                              ]),
                          Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,10),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
                                  /*decoration: BoxDecoration(
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
                                  ),*/
                                ),
                                //Text('Подгузник')
                              ]),
                        ]),

                  ),
                  SizedBox(height: 10,),
                  //конец блока выбора задач
                  //блок выбора задач
                  Container(
                      margin: EdgeInsets.fromLTRB(20,20,0,0),
                      alignment: Alignment.centerLeft,
                      child: Text('Дополнительное', style: TextStyle(fontSize: 16.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        GestureDetector(
                        onTap: () {
                  Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => bathFuturePage()));
                  },
                      child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
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
                                        color: Color(textFieldBorder).withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0.5), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xFFF2EDFD),
                                  ),
                                ),
                                Text('Купание', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => playFuturePage()));
                  },
                  child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
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
                                        color: Color(textFieldBorder).withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0.5), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xFFF2EDFD),
                                  ),
                                ),
                                Text('Игра', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      CupertinoPageRoute(builder: (context) => walkFuturePage()));
                                },
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
                                Text('Прогулка', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ])),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => walkFuturePage()));
                  },
                  child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
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
                                        color: Color(textFieldBorder).withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0.5), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xFFF2EDFD),
                                  ),
                                ),
                                Text('Температура', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),),
                        ]),

                  ),
                Container(
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                          CupertinoPageRoute(builder: (context) => shpritzFuturePage()));
                          },
                              child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
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
                                        color: Color(textFieldBorder).withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0.5), // changes position of shadow
                                      ),
                                    ],
                                    color: Color(0xFFF2EDFD),
                                  ),
                                ),
                                Text('Вакцинация', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),),
                          Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
                                  /*decoration: BoxDecoration(
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
                                  ),*/
                                ),
                                //Text('Игра', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),
                          Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
                                  /*decoration: BoxDecoration(
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
                                  ),*/
                                ),
                                //Text('Прогулка', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),
                          Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,0,0,8),
                                  alignment: Alignment.centerLeft,
                                  width: 63,
                                  height: 63,
                                  /*decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/thermpmetrIcon.png"),
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
                                  ),*/
                                ),
                                //Text('Температура', style: TextStyle(fontSize: 12.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', height: 1.5),)
                              ]),
                        ]),

                  ),
                  SizedBox(height: 10,),
                  //конец блока выбора задач
                ],
              )
            ),
          )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: 65,
          child:ListView(
              children: <Widget>[
                Container(
                  height: 55,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(20,0,20,0),
                  child: FlatButton(
                    onPressed:(){
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => mainScreenPage()));
                    } ,
                    minWidth: MediaQuery.of(context).size.width - 40,
                    height: 55,
                    child: Text('Закрыть', style: TextStyle(fontSize: 14.0, color: Color(buttonTextWhite), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
