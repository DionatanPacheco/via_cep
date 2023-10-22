import 'package:flutter/material.dart';
import 'package:via_cep/model/back4app_model.dart';
import 'package:via_cep/pages/cep_page.dart';
import 'package:via_cep/repositories/cep_repositories.dart';
// ignore: depend_on_referenced_packages

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  CepBack4AppModel cepModel = CepBack4AppModel([]);
  CepRepository cepRepository = CepRepository();

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
                cepModel = await cepRepository.consultarCEP(cep);
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
            cepModel.cep ?? '',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            cepModel.localidade ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            cepModel.logradouro ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            cepModel.uf ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (loading) const CircularProgressIndicator(),
          Text(
            cepModel.ddd ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CepPage()));
                /*cepModel.cep;
                cepModel.bairro;
                cepModel.ddd;
                cepModel.localidade;
                cepModel.bairro;
                cepModel.uf;
                var response = await BaseClient()
                    .post(baseUrl, cepModel)
                    .catchError((err) {});
                if (response == null) return;
                debugPrint('successful');*/
              },
              child: const Text('Cadastrar Cep'))
        ],
      ),
    );
  }
}
