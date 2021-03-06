import 'package:calculadora_flutter_dell/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() => runApp(Calculadora());

class Calculadora extends StatelessWidget {
  final CalculatorController calcController = CalculatorController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: <Widget>[
                  Numeros(calcController.onPrimeiroNumeroEscolhido),
                  Divider(),
                  Operacoes(calcController.onOperacaoEscolhida),
                  Divider(),
                  Numeros(calcController.onSegundoNumeroEscolhido),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      BotaoCalcular(calcController.todasOpcoesForamEscolhidas()
                          ? calcController.onClickBotao
                          : null),
                      BotaoZerar(calcController.onClickBotaoZerar)
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Text(
                        'Operação: ',
                        style: TextStyle(fontSize: 28),
                      ),
                      calcController.primeiroNumero != null
                          ? Text(
                              calcController.primeiroNumero.toString(),
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                      calcController.operacaoEscolhida != null
                          ? Text(
                              calcController.operacaoEscolhida,
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                      calcController.segundoNumero != null
                          ? Text(
                              calcController.segundoNumero.toString(),
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Resultado: ',
                        style: TextStyle(fontSize: 28),
                      ),
                      calcController.resultado != null
                          ? Observer(
                              builder: (BuildContext context) {
                                return Text(
                                  calcController.resultado.toStringAsFixed(2),
                                  style: TextStyle(fontSize: 28),
                                );
                              },
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BotaoZerar extends StatelessWidget {
  BotaoZerar(this.onClickBotao);

  final VoidCallback onClickBotao;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: onClickBotao,
      child: Text(
        'Zerar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class BotaoCalcular extends StatelessWidget {
  BotaoCalcular(this.onClickBotao);

  final VoidCallback onClickBotao;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: onClickBotao,
      child: Text(
        'Calcular',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class Operacoes extends StatelessWidget {
  Operacoes(this.onOperacaoEscolhida);

  final Function(String) onOperacaoEscolhida;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        GestureDetector(
          onTap: () => onOperacaoEscolhida('+'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Observer(
                builder: (BuildContext context) {
                  return Text(
                    '+',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('-'),
          child: Card(
            child: Padding(
                padding: const EdgeInsets.all(18),
                child: Observer(
                  builder: (BuildContext context) {
                    return Text(
                      '-',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                )),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('*'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Observer(
                builder: (BuildContext context) {
                  return Text(
                    '*',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('/'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Observer(
                builder: (BuildContext context) {
                  return Text(
                    '/',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('%'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Observer(
                builder: (BuildContext context) {
                  return Text(
                    '%',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Numeros extends StatelessWidget {
  Numeros(this.onNumeroEscolhido);

  final Function(int) onNumeroEscolhido;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: getNumeros(),
    );
  }

  List<Widget> getNumeros() {
    List<Widget> numeros = [];

    for (int i = 0; i < 10; i++) {
      numeros.add(
        GestureDetector(
          onTap: () => onNumeroEscolhido(i),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Observer(
                builder: (BuildContext context) {
                  return Text(
                    i.toString(),
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }
    return numeros;
  }
}
