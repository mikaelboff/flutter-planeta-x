import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controlePeso = new TextEditingController();

  int radioValor = 1;
  String _nomePlaneta = "";

  bool selecaoValorA = true;
  bool selecaoValorB = false;
  bool selecaoValorC = false;
  bool switchValor = false;

  double _resultadoFinal = 0.0;

  void tomaContaValorRadio(int value) {
    setState(() {
      radioValor = value;
      switch (radioValor) {
        case 0:
          _nomePlaneta = "Plutão";
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.06);
          break;

        case 1:
          _nomePlaneta = "Marte";
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.38);
          break;

        default:
          _nomePlaneta = "Vênus";
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.91);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _controlePeso,
                    decoration: InputDecoration(
                        labelText: "O seu peso na Terra",
                        hintText: "Kg",
                        icon: Icon(Icons.person_outline)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.brown,
                        value: 0,
                        groupValue: radioValor,
                        onChanged: tomaContaValorRadio,
                      ),
                      Text(
                        "Plutão",
                        style: TextStyle(color: Colors.white),
                      ),
                      Radio<int>(
                        activeColor: Colors.red,
                        value: 1,
                        groupValue: radioValor,
                        onChanged: tomaContaValorRadio,
                      ),
                      Text(
                        "Marte",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2,
                        groupValue: radioValor,
                        onChanged: tomaContaValorRadio,
                      ),
                      Text(
                        "Vênus",
                        style: TextStyle(color: Colors.white30),
                      )
                    ],
                  ),

                  //Resultado

                  Text(
                    _controlePeso.text.isEmpty
                        ? "Digite o seu peso"
                        : "O meu peso no planeta $_nomePlaneta é ${_resultadoFinal.toStringAsFixed(2)} KG ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calcularPesoEmPlaneta(String peso, double gravidadeSuperficial) {
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0) {
      return (int.parse(peso) * gravidadeSuperficial);
    } else {
      print("Número Errado");

      return int.parse("180") * 0.38; //peso padrão
    }
  }
}
