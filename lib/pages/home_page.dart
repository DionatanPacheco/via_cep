import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cepController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text(
          'Colsulta Cep',
          style: TextStyle(color: Colors.white60),
        ),
      ),
      body: Column(
        children: [
          Text(
            'Consulta Cep',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Divider(),
          TextField(),
          Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        http.get(Uri.parse('https//www.google.com'));
      }),
    );
  }
}
