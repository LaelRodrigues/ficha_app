import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConsultaFicha(title: 'Ficha Financeira'),
    );
  }
}

class ConsultaFicha extends StatefulWidget {
  const ConsultaFicha({super.key, required this.title});

  final String title;

  @override
  State<ConsultaFicha> createState() => _ConsultaFichaState();
}

class _ConsultaFichaState extends State<ConsultaFicha> {
  TextEditingController _dataInicial = TextEditingController();
  TextEditingController _dataFinal = TextEditingController();

  Widget _buildDataInicial() {
    return TextField(
      controller: _dataInicial,
      decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today_rounded), labelText: "Mês inicial"),
      onTap: () async {
        DateTime? escolhaData = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));

        if (escolhaData != null) {
          setState(() {
            _dataInicial.text = DateFormat('yyyy-MM-dd').format(escolhaData);
          });
        }
      },
    );
  }

  Widget _buildDataFinal() {
    return TextField(
      controller: _dataFinal,
      decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today_rounded), labelText: "Mês Final"),
      onTap: () async {
        DateTime? escolhaData = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));

        if (escolhaData != null) {
          setState(() {
            _dataFinal.text = DateFormat('yyyy-MM-dd').format(escolhaData);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildDataInicial(), 
              _buildDataFinal(),
              SizedBox(height: 40),
              ElevatedButton(
                child: Text('Gerar PDF'),
                onPressed: () {
                  print(_dataFinal.text);
                },
              )
            ],
          ),
        ));
  }
}
