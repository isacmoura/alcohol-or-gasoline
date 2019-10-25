import 'package:alcool_gasolina/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'input.widget.dart';

class SubmitForm extends StatelessWidget {
  MoneyMaskedTextController gasController = new MoneyMaskedTextController();
  MoneyMaskedTextController alcController = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm({
    @required this.gasController,
    @required this.alcController,
    @required this.busy,
    @required this.submitFunc
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            controller: gasController,
            label: "Gasolina",
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            controller: alcController,
            label: "Álcool"
          ),
        ),

        LoadingButton(
            busy: busy,
            function: submitFunc,
            invert: false,
            text: "CALCULAR",
          ),
      ],
    );
  }
}