import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'babyCharasteristics.dart';
import 'checkPhoneCode.dart';
import 'main.dart';


bool switchBabySex = false;

class addBabyPage extends StatefulWidget {
  @override
  _addBabyPageState createState() => _addBabyPageState();
}

class _addBabyPageState extends State<addBabyPage>  with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  TextEditingController _controllerName, _controllerBorn, _controllerSex ;
  //var maskFormatterPhone = new MaskTextInputFormatter(mask: '+7 (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') });

  @override
  void initState() {

    _animationController =
    new AnimationController(vsync: this, duration: Duration(seconds: 3));

   _controllerName = TextEditingController(text: UbabyName);
   _controllerSex = TextEditingController(text: UbabySex);
   _controllerBorn = TextEditingController(text: UbabyBornDate);
    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: switchBabySex == false ? AppBar(
          elevation: 0.0,
          title:Text("", style: TextStyle(fontSize: 18.0, color: Color(backGround), fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(backGround),
          brightness: Brightness.light,
          leading: Container(
            child: Material(
              color: Color(backGround), // button color
              child: InkWell(
                splashColor: Color(buttonBackGround), // splash color
                onTap: () {
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => checkPhoneCodePage()));
                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.arrow_back_ios, size: 20.0, color: Color(buttonBackGround)), // icon
                    Text("", style: TextStyle(color: Color(backGround),fontSize: 9.0)), // text
                  ],
                ),
              ),
            ),
          ),
        ): AppBar(backgroundColor: Colors.black.withOpacity(0.7),elevation: 0.0,),

        body:SingleChildScrollView(
        physics: ScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(backGround),),
            child: Stack(
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Container(
                            height: 63,
                            width: 63,
                            margin: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height > 600 ? 30 : 0,0,20),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/addImage.png"),
                                  fit:BoxFit.fitHeight, alignment: Alignment(0.0, 0.0)
                              ),
                            ),
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.fromLTRB(20,0,0,0),
                            child: Text('Добавление ребенка', style: TextStyle(fontSize: 22.0, color: Color(bodyTextMajor), fontFamily: 'Roboto', fontWeight: FontWeight.w600, height: 1.5),textAlign: TextAlign.center,)
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.fromLTRB(20,10,0,10),
                            child: Text('Основная информация', style: TextStyle(fontSize: 16.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.center,)
                        ),
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
                              style: TextStyle(fontSize: 16.0, color: Color(textFieldText), fontFamily: 'Roboto', ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint), fontFamily: 'Roboto', ),
                                hintText: "Имя ребенка",
                                fillColor: Color(textFieldBackGround),
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () => _controllerName.clear(),
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
                              onChanged: (value){ UbabyName = value;},
                              // ignore: deprecated_member_use
                              autovalidate: false,
                              controller: _controllerName,
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
                          child: TextFormField(
                              textAlign: TextAlign.center,
                              enabled: true,
                              showCursor: true,
                              readOnly: true,
                              //keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 16.0, color: Color(textFieldText), fontFamily: 'Roboto', ),
                              onTap: (){setState(() {
                                switchBabySex = true;
                              });},
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint), fontFamily: 'Roboto', ),
                                hintText: "Пол",
                                fillColor: Color(textFieldBackGround),
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () { },
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
                                    //width: 1.0,
                                  ),
                                ),
                              ),
                              //onChanged: (value){ },
                              // ignore: deprecated_member_use
                              //autovalidate: false,
                              controller: _controllerSex,
                            )),
                    Container(
                      alignment: Alignment.topCenter,
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
                          showCursor: true,
                          readOnly: true,
                        //keyboardType: TextInputType.datetime,
                        style: TextStyle(fontSize: 16.0, color: Color(textFieldText), fontFamily: 'Roboto', ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint), fontFamily: 'Roboto', ),
                          hintText: "Дата рождения",
                          fillColor: Color(textFieldBackGround),
                          filled: true,
                          suffixIcon: IconButton(
                            onPressed: () => _controllerBorn.clear(),
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
                              _controllerBorn = TextEditingController(text: '${dayBolb + date.day.toString()+"."+ monthBolb + date.month.toString()+"."+ date.year.toString()}');
                              UbabyBornDate = dayBolb + date.day.toString()+"."+ monthBolb + date.month.toString()+"."+ date.year.toString();
                              //var dateDeliverySend = date.year.toString()+"." + date.month.toString()+"." + date.day.toString();
                              setState(() {});
                            }, currentTime: DateTime.now(), locale: LocaleType.en);},
                        onChanged: (value){ UbabyBornDate = value;},
                        // ignore: deprecated_member_use
                        autovalidate: false,
                        controller: _controllerBorn,
                      )),
                      ]),

                  switchBabySex != false ? Positioned(
                  top: 0,
                  left: 0,
                      /*child: FadeTransition(
                          opacity: _animationController,*/
                          child:
                       Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.7),
                        child: Column(
                          children: <Widget> [
                            SizedBox(height: MediaQuery.of(context).size.height - 355, width: MediaQuery.of(context).size.width - 40-20,),
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
                                          switchBabySex = false;
                                          _controllerSex = TextEditingController(text: UbabySex);
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
                                            Text('Мальчик', style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto'),textAlign: TextAlign.left,)
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
                                              switchBabySex = false;
                                              _controllerSex = TextEditingController(text: UbabySex);
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
                                                Text('Девочка', style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto'),textAlign: TextAlign.left,)
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
                  ): Container()
                ]),
          ),
        ),
      bottomNavigationBar: switchBabySex == false ? BottomAppBar(
        color: Colors.transparent,
        child:Container(
          height: 55,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.fromLTRB(20,0,20,10),
          child: FlatButton(
            onPressed:(){

              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => babyCharactersPage()));
            } ,
            minWidth: MediaQuery.of(context).size.width - 40,
            height: 55,
            child: Text('Далее', style: TextStyle(fontSize: 14.0, color: Color(buttonTextWhite), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            color: Color(buttonBackGround),
            textColor: Color(buttonTextWhite),
            splashColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        elevation: 0,
      ) : BottomAppBar(
    color:Colors.black.withOpacity(0.7)
    //child:Container(height: 0,)
    ),
        //)
    );
  }
}
