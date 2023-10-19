import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:via_cep/model/viacep_model.dart';
import 'package:via_cep/repositories/via_cep_repository.dart';
import 'package:via_cep/widgets/test_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  viaCepModel viacepModel = viaCepModel();
  ViaCepRepository viaCepRepository = ViaCepRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TestDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text(
          'Colsulta Cep',
          style: TextStyle(color: Colors.white60),
        ),
      ),
      body: Column(
        children: [
          const Text(
            'Consulta Cep',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: cepController,
            maxLength: 8,
            keyboardType: TextInputType.number,
            onChanged: (String value) async {
              var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
              if (cep.length == 8) {
                setState(() {
                  loading = true;
                });
                viacepModel = await viaCepRepository.consultarCEP(cep);
              } else {}
              setState(() {
                loading = false;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            viacepModel.cep ?? '',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            viacepModel.localidade ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            viacepModel.logradouro ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            viacepModel.uf ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (loading) CircularProgressIndicator(),
          Text(
            viacepModel.ddd ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Cadastrar Cep'))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
