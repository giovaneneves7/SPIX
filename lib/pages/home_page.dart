import 'package:appcobranca/models/lanche.dart';
import 'package:appcobranca/widgets/lista_de_lanches.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Lanche> lanches = [];


  double totalCompra = 0.0;

  void addToTotal(double price) {
    setState(() {
      totalCompra += price;
    });
  }

  void removeFromTotal(double price) {
    setState(() {
      totalCompra -= price;
    });
  }

  void finalizarCompra() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Compra finalizada!'),
          content: Text('Total: R\$ ${totalCompra.toStringAsFixed(2)}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void cadastrarLanche(){

    lanches.add(Lanche(nome: "Hamburguer", preco: 10.0, urlImagem: "https://img.freepik.com/fotos-gratis/hamburguer-isolado-no-fundo-branco-fastfood-de-hamburguer-fresco-com-carne-e-queijo_90220-1329.jpg?w=740&t=st=1699304445~exp=1699305045~hmac=c8eca2e24a91ec5fc03b9635f8ab92601c3859a173517f25c82758c4a61fc15c"));
    lanches.add(Lanche(nome: "Bata Frita", preco: 5.0, urlImagem: "https://img.freepik.com/fotos-gratis/vista-superior-deliciosas-batatas-fritas-e-molho_23-2149235944.jpg?w=740&t=st=1699304492~exp=1699305092~hmac=c616aab17422331ce49442438686455782e80bc647a7775faf7e4282ee321308"));
    lanches.add(Lanche(nome: "Cachorro Quente", preco: 7.0, urlImagem: "https://img.freepik.com/fotos-gratis/deliciosos-cachorros-quentes-com-mostarda-e-cebola_23-2148768194.jpg?w=740&t=st=1699304737~exp=1699305337~hmac=02cb3827f7ed216e453c92e48ca71be219686f662a2361eec4d3e60ee0edff73"));
    lanches.add(Lanche(nome: "Bata Frita", preco: 8.0, urlImagem: "https://img.freepik.com/fotos-gratis/variedade-de-pedacos-de-bolo_114579-28271.jpg?w=740&t=st=1699304817~exp=1699305417~hmac=3d8d3f2b4c7a3c3557717d37748da30c837247609a1336900c412c298fab8d47"));


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cardápio de Lanches'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Cardápio de Lanches",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w700),
                        ),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            cadastrarLanche();
                          });
                        },
                            child: Text("Adicionar"))
                      ],
                    ),

                    for(Lanche lanche in lanches)
                      ListaDeLanches(
                        lanche: lanche,
                        addToTotal: addToTotal,
                        removeFromTotal: removeFromTotal,
                      ),

                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Compra Total: R\$ ${totalCompra.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(width: 16.0),

                  ElevatedButton(
                    onPressed: () {
                      finalizarCompra();
                    },
                    child: Text('Finalizar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String title, double price, String imageUrl) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl, width: 50, height: 5-0),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    addToTotal(price);
                  },
                  child: Text('Adicionar'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    removeFromTotal(price);
                  },
                  child: Text('Remover'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}