import 'package:alcool_gasolina/widgets/logo.widget.dart';
import 'package:alcool_gasolina/widgets/submit-form.widget.dart';
import 'package:alcool_gasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  MoneyMaskedTextController _gasController = new MoneyMaskedTextController();
  MoneyMaskedTextController _alcController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";
  Function func;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      //appBar: AppBar(),
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed ? Success(
              reset: reset,
              result: _resultText,
            )
            :
            SubmitForm(
              alcController: _alcController,
              gasController: _gasController,
              busy: _busy,
              submitFunc: calculate,
            )
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alcool = double.parse(_alcController.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gasolina = double.parse(_gasController.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double res = alcool / gasolina;

    setState(() {
      _completed = false;
      _busy = true; 
    });

    return new Future.delayed(const Duration(seconds: 1),
      () {
        setState(() {
          _color = Colors.deepPurpleAccent;
          if (res >= 0.7) {
            _resultText = "Compensa utilizar Gasolina!";
          } else {
            _resultText = "Compensa utilizar Álcool!";
          }

          _busy = false;
          _completed = true;
        });
      });
  }

  reset() {
    setState(() {
      _alcController = new MoneyMaskedTextController();
      _gasController = new MoneyMaskedTextController();
      _completed = false;
      _busy = false; 
      _color = Colors.deepPurple;
    });
  }
}