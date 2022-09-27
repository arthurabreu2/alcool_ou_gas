import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if ( precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Valor inválido, digite números maiores que 0";
      });
    }
    /* Se o preço do álcool dividido pelo preço da gasolina
    * for >= 0.7 é melhor abastecer com gasolina
    * caso contrario, melhor abastecer com álcool */
    else{
      if (( precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina.";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com álcool.";
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina?"),
        backgroundColor: Colors.blueGrey,
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Image.asset("images/logo.png",),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Saiba qual a melhor opção de combustível para o seu carro:",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Álcool | ex: 2.50"
                  ),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300
                  ),
                  controller: _controllerAlcool,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Gasolina | ex: 3.50"
                  ),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300
                  ),
                  controller: _controllerGasolina,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                        backgroundColor: Colors.blueGrey,
                      ),

                      child: Text("Calcule aqui"),
                      onPressed: _calcular,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:15),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
