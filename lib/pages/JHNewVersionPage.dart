import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class JHNewVersionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: new PageView(
        onPageChanged: (int index) {
          print(index);
        },
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(0.0),
            child: new Image.asset(
              'images/pic_welcome0.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(0.0),
            child: new Image.asset(
              'images/pic_welcome1.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(0.0),
            child: new Stack(
              alignment: const Alignment(0.0, 0.8),
              children: <Widget>[
                new Image.asset('images/pic_welcome2.jpeg', fit: BoxFit.cover),
                new CupertinoButton(
                  child: new Text(
                    '立即进入',
                    style: new TextStyle(color: Colors.blue, fontSize: 18.0),
                  ),
                  onPressed: _func_enter,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _func_enter() {
    print('enter');
  }
}
