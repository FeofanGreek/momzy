import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'addBaby.dart';
import 'main.dart';
import 'mainScreen.dart';






class babyCharactersPage extends StatefulWidget {
  @override
  _babyCharactersPageState createState() => _babyCharactersPageState();
}

class _babyCharactersPageState extends State<babyCharactersPage>{

  TextEditingController _controllerMassa, _controllerToll;
  //var maskFormatterPhone = new MaskTextInputFormatter(mask: '+7 (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') });


  @override
  void initState() {

    //_controllerPhone = TextEditingController(text: Uphone);
    _controllerMassa = TextEditingController(text: UbabyMassa);
    _controllerToll = TextEditingController(text: UbabyToll);

    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Color(0xFFffffff),
        appBar:AppBar(
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
                      CupertinoPageRoute(builder: (context) => addBabyPage()));
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
                            child: Text('Добавление ребенка', style: TextStyle(fontSize: 22.0, color: Color(bodyTextMajor), fontFamily: 'Roboto',fontWeight: FontWeight.w600, height: 1.5),textAlign: TextAlign.center,)
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.fromLTRB(20,10,0,10),
                            child: Text('Дополнительная информация', style: TextStyle(fontSize: 16.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.center,)
                        ),
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
                                  textAlign: TextAlign.center,
                                  enabled: true,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true,
                                      signed: false),
                                  style: TextStyle(fontSize: 16.0, color: Color(textFieldText),fontWeight: FontWeight.w600),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint),fontWeight: FontWeight.w600),
                                    hintText: "Вес",
                                    fillColor: Color(textFieldBackGround),
                                    filled: true,
                                    suffixIcon: IconButton(
                                      onPressed: () => _controllerMassa.clear(),
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
                                  onChanged: (value){ UbabyMassa = value;},
                                  // ignore: deprecated_member_use
                                  autovalidate: false,
                                  controller: _controllerMassa,
                                )),
                            Container(
                              //alignment: Alignment.topCenter,
                                margin: EdgeInsets.fromLTRB(0,20,20,0),
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                width: 61,
                                height: 65,
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
                                  //enableInteractiveSelection: false,
                                  //focusNode: false,
                                  enabled: false,
                                  style: TextStyle(fontSize: 16.0, color: Color(textFieldText),fontWeight: FontWeight.w600),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint),fontWeight: FontWeight.w600),
                                    hintText: "кг",
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
                                        //width: 1.0,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        //width: 1.0,
                                      ),
                                    ),
                                  ),
                                  // ignore: deprecated_member_use
                                  autovalidate: false,
                                )),
                              ]),
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
                                        color: Color(textFieldBorder).withOpacity(0.5),
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 0.5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child:TextFormField(
                                    textAlign: TextAlign.center,
                                    enabled: true,
                                    keyboardType: TextInputType.numberWithOptions(
                                        decimal: true,
                                        signed: false),
                                    style: TextStyle(fontSize: 16.0, color: Color(textFieldText),fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint),fontWeight: FontWeight.w600),
                                      hintText: "Рост",
                                      fillColor: Color(textFieldBackGround),
                                      filled: true,
                                      suffixIcon: IconButton(
                                        onPressed: () => _controllerToll.clear(),
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
                                    onChanged: (value){ UbabyToll = value;},
                                    // ignore: deprecated_member_use
                                    autovalidate: false,
                                    controller: _controllerToll,
                                  )),
                              Container(
                                //alignment: Alignment.topCenter,
                                  margin: EdgeInsets.fromLTRB(0,20,20,0),
                                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                                  width: 61,
                                  height: 65,
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
                                    //enableInteractiveSelection: false,
                                    //focusNode: false,
                                    enabled: false,
                                    style: TextStyle(fontSize: 16.0, color: Color(textFieldText),fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 16.0, color: Color(textFieldHint),fontWeight: FontWeight.w600),
                                      hintText: "см",
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
                                          //width: 1.0,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          //width: 1.0,
                                        ),
                                      ),
                                    ),

                                    // ignore: deprecated_member_use
                                    autovalidate: false,
                                  )),
                            ]),

                      ]),

                ]),
          ),
        )
        ),
      bottomNavigationBar: BottomAppBar(
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
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) => mainScreenPage()));
                        } ,
                        minWidth: MediaQuery.of(context).size.width - 40,
                        height: 55,
                        child: Text('Далее', style: TextStyle(fontSize: 14.0, color: Color(buttonTextWhite), fontFamily: 'Roboto',fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                        color: Color(buttonBackGround),
                        textColor: Color(buttonTextWhite),
                        splashColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                SizedBox(height: 20,),
                Container(
                      height: 55,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.fromLTRB(20,0,20,10),
                      child: FlatButton(
                        onPressed:(){
                          /*Uphone.length > 10 ?*/
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) => mainScreenPage()));
                        } ,
                        minWidth: MediaQuery.of(context).size.width - 40,
                        height: 55,
                        child: Text('Заполнить позже', style: TextStyle(fontSize: 14.0, color: Color(buttonBackGround), fontFamily: 'Roboto',fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
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
