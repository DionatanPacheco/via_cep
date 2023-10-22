import 'package:flutter/material.dart';
import 'package:via_cep/model/back4app_model.dart';
import 'package:via_cep/repositories/ceps_back4app_repository.dart';
import 'package:via_cep/repositories/cep_repositories.dart';


class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  CepsBack4AppRepository cepRepository = CepsBack4AppRepository();
  var cepsBack4app = CepBack4AppModel([]);
  var cepViaRepository = CepRepository();
  var cepController = TextEditingController();
  var loading = false;
  @override
  void initState() {
    super.initState();
    obterCep();
  }

  void obterCep() async {
    cepsBack4app = (await cepRepository.obterCeps()) as CepBack4AppModel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cep'),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              loading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: cepsBack4App.ceps.length,
                        itemBuilder: (BuildContext bc, int index) {
                          var cep = cepRepository.cep[index];
                          return Dismissible(
                            onDismissed:
                                (DismissDirection dismissDirection) async {
                              await cepRepository
                                  .deletarCep(cep.objectId.toString());
                              obterCep();
                                                            setState(() {});
                            },
                            key: Key(cep.objectId.toString()),
                            child: ListTile(
                              title: Text(cep.logradouro.toString()),
                              subtitle: Text(
                                  "${cep.complemento.toString()} - ${cep.bairro.toString()} / ${cep.localidade.toString()}"),
                              isThreeLine: true,
                              leading: Text(cep.uf.toString()),
                              trailing: Text(cep.cep.toString()),
                              onTap: () {
                                cepRepository.alterarCep( cep);
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ));
  }

  Future<dynamic> adicionaCEP(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext bc) {
          return AlertDialog(
            title: const Text("Adicionar CEP"),
            content: TextField(
              controller: cepController,
            ),
            actions: [              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:  const Text("Cancelar"))]);
        }

  Future<dynamic> alterarCEP(context, CepBack4AppModel cep) {
    var logradouroController =
        TextEditingController(text: cep.logradouro.toString());
    var complementoController =
        TextEditingController(text: cep.complemento.toString());
    var bairroController = TextEditingController(text: cep.bairro.toString());
    var localidadeController =
        TextEditingController(text: cep.localidade.toString());
    var ufController = TextEditingController(text: cep.uf.toString());
    return showDialog(
        context: context,
        builder: (BuildContext bc) {
          return AlertDialog(
            title: Text("Alterar CEP: ${cep.cep.toString()}"),
            content: Column(
              children: [
                TextField(
                    controller: logradouroController,
                    decoration: const InputDecoration(
                        label: Text("Lougradouro(Rua/Av)"))),

                TextField(
                    controller: complementoController,
                    decoration: const InputDecoration(
                        label: Text("Complemento(Casa/Apto)"))),
                TextField(
                    controller: bairroController,
                    decoration: const InputDecoration(label: Text("Bairro"))),

                TextField(
                    controller: localidadeController,
                    decoration: const InputDecoration(
                        label: Text("Localidade(Cidade)"))),

                TextField(
                    controller: ufController,
                    decoration:
                        const InputDecoration(label: Text("UF(Estado)"))),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar")),
              TextButton(
                  onPressed: () async {},
                  child: const Text("Salvar"))]);});});
           
          
        }}
  

