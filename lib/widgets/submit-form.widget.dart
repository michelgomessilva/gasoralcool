import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gasoralcool/widgets/input.widget.dart';

import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasolinaController = new MoneyMaskedTextController();
  var alcoolController = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunction;
  var errorMessage = "Os valores devem ser maior que zero!";
  var error = false;

  SubmitForm(
      {@required this.gasolinaController,
      @required this.alcoolController,
      @required this.busy,
      @required this.submitFunction,
      @required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 1,
            right: 1,
          ),
          child: Input(
            controller: this.gasolinaController,
            label: "Gasolina",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 1,
            right: 1,
          ),
          child: Input(
            controller: this.alcoolController,
            label: "Álcool",
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          this.error ? errorMessage : "",
          style: TextStyle(
              color: Colors.redAccent,
              fontSize: 25,
              fontFamily: "Big Shoulders Display",
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 5,
        ),
        LoadingButton(
          busy: this.busy,
          invert: false,
          function: this.submitFunction,
          text: "CALCULAR",
        )
      ],
    );
  }
}
