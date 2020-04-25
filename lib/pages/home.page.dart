import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gasoralcool/widgets/logo.widget.dart';
import 'package:gasoralcool/widgets/submit-form.widget.dart';
import 'package:gasoralcool/widgets/success.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double indexPaysOff = 0.7;

  Color _backgroundColor = Colors.lightGreen;
  var _gasolinaController = new MoneyMaskedTextController();
  var _alcoolController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _error = false;
  var _resultText = "Vai de Gasolina!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 1200),
          color: this._backgroundColor,
          child: ListView(
            children: <Widget>[
              Logo(),
              this._completed
                  ? Success(
                      result: this._resultText,
                      reset: reset,
                    )
                  : SubmitForm(
                      gasolinaController: this._gasolinaController,
                      alcoolController: this._alcoolController,
                      busy: this._busy,
                      submitFunction: calculate,
                      error: this._error,
                    ),
            ],
          ),
        ));
  }

  Future calculate() {
    double totalAlcool = double.parse(
            this._alcoolController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double totalGasolina = double.parse(
            this._gasolinaController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double total = totalAlcool / totalGasolina;

    if (totalAlcool == 0 || totalGasolina == 0) {
      return new Future.delayed(const Duration(seconds: 0), () {
        setState(() {
          this._busy = false;
          this._completed = false;
          this._error = true;
        });
      });
    }

    setState(() {
      this._backgroundColor = Colors.lightGreenAccent;
      this._completed = false;
      this._busy = true;
      this._error = false;
    });

    return new Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        this._error = false;
        this._resultText = "Vai de Álcool!";
        if (total >= indexPaysOff) {
          this._resultText = "Vai de Gasolina!";
        }
        this._busy = false;
        this._completed = true;
      });
    });
  }

  reset() {
    setState(() {
      this._backgroundColor = Colors.lightGreen;
      this._alcoolController = new MoneyMaskedTextController();
      this._gasolinaController = new MoneyMaskedTextController();
      this._completed = false;
      this._busy = false;
      this._error = false;
    });
  }
}
