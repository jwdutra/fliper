import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:fliper/app/modules/home/pages/home_store.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  NumberFormat formatter = NumberFormat.simpleCurrency();

  @override
  void initState() {
    store.beforeInit();
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    //Future.delayed(Duration.zero, () => store.init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe8ebf6),
      body: Observer(
        builder: (context) => Column(
          children: [!store.carregando ? _resumo() : Container()],
        ),
      ),
    );
  }

  Widget _resumo() {
    var estiloTitulo = TextStyle(
        color: Colors.blue[800], fontWeight: FontWeight.bold, fontSize: 20);
    var estiloValorLista = TextStyle(
        height: 1.5,
        color: Colors.blue[800],
        fontWeight: FontWeight.bold,
        fontSize: 15);
    var estiloLabels =
        TextStyle(height: 1.5, color: Colors.black87, fontSize: 15);
    //
    var valores = store.wealthSummaryAggregate!.aggregate!;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Seu resumo', style: estiloTitulo),
                  Icon(Icons.more_vert)
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Text('Valor investido', style: estiloLabels),
              ),
              Center(
                child: Text('${formatter.format(valores.sum!.total)}',
                    style: estiloTitulo),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rentabilidade / mês', style: estiloLabels),
                  Text('${formatter.format(valores.avg!.profitability)}',
                      style: estiloValorLista)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CDI', style: estiloLabels),
                  Text('${formatter.format(valores.avg!.cdi)}',
                      style: estiloValorLista)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ganho / mês', style: estiloLabels),
                  Text('${formatter.format(valores.sum!.gain)}',
                      style: estiloValorLista)
                ],
              ),
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(
                          top: 20, left: 10.0, right: 20.0, bottom: 10),
                      child: Divider(
                        color: Colors.black87,
                        height: 36,
                      )),
                ),
              ]),
              _botaoVerMais()
            ],
          ),
        ),
      ),
    );
  }

  Row _botaoVerMais() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 150,
          child: SizedBox(
            width: double.infinity,
            height: 45,
            child: OutlinedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)))),
              child: Text('VER MAIS'),
              onPressed: () async {},
            ),
          ),
        )
      ],
    );
  }
}
