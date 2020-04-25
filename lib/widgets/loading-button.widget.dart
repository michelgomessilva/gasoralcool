import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function function;
  var text = "";

  LoadingButton({
    @required this.busy,
    @required this.invert,
    @required this.function,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return this.busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: this.invert
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              child: Text(
                this.text,
                style: TextStyle(
                  color: this.invert
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
              onPressed: this.function,
            ),
          );
  }
}
