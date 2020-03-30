import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCampo = TextEditingController();
  String _textoSalvo = "Nada Salvo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              _textoSalvo,
            style: TextStyle(
              fontSize: 20
            ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  onPressed: _salvar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Ler",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: _recuperar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Remover",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: _remover,
                )
              ],
            )
          ],
        )
      ),
    );
  }


  _salvar() async{
   String valorDigitado = _controllerCampo.text;

   //SharedPreferencer
    final prefs = await SharedPreferences.getInstance();
    /// O primeiro parametro é a chave de pesquisa e o segundo o valor
    await prefs.setString("nome", valorDigitado); //salvar os dados

  }

  _recuperar() async{
    //SharedPreferencer
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      /// Recuperar o valor passando a chave
      _textoSalvo = prefs.getString("nome") ?? "Sem valor";
    });
  }

  _remover() async{
    //SharedPreferencer
    final prefs = await SharedPreferences.getInstance();
    /// Remover a preferencia passando a chave
    prefs.remove("nome");

  }

}
