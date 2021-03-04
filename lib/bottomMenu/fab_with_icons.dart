import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../addTask.dart';
import '../checkPhoneCode.dart';

// https://stackoverflow.com/questions/46480221/flutter-floating-action-button-with-speed-dail
class FabWithIcons extends StatefulWidget {
  FabWithIcons({this.icons, this.onIconTapped});
  final List<IconData> icons;
  ValueChanged<int> onIconTapped;
  @override
  State createState() => FabWithIconsState();
}

class FabWithIconsState extends State<FabWithIcons> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.icons.length, (int index) {
        return _buildChild(index);
      }).toList()..add(
        _buildFab(),
      ),
    );
  }

  Widget _buildChild(int index) {
    Color backgroundColor = Theme.of(context).cardColor;
    Color foregroundColor = Theme.of(context).accentColor;
    return Container(
      height: 70.0,
      width: 68.0,
      alignment: FractionalOffset.topCenter,
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: _controller,
          curve: Interval(
              0.0,
              1.0 - index / widget.icons.length / 2.0,
              curve: Curves.easeOut
          ),
        ),
        child: FloatingActionButton(
                backgroundColor: Color(0xFF7C52E4),
                mini: true,
                child: Icon(widget.icons[index], color: foregroundColor),
                onPressed: () => _onTapped(index),
              ),


      ),
    );
  }

  Widget _buildFab() {
    return Container(
        height: 68.0,
        width: 68.0,
        child: FittedBox(
        child:  FloatingActionButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => addTaskPage()));
        print('Перешли в добавление задачи'); // запускаем действие при нажатии на центральную круглую кнопк
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
      backgroundColor: Color(0xFF7C52E4),
      elevation: 2.0,
    )
    )
    );
  }

  void _onTapped(int index) {
   // _controller.reverse();
   // widget.onIconTapped(index);
    print('Yажали');
  }
}