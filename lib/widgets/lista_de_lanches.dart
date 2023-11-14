import 'package:appcobranca/models/lanche.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListaDeLanches extends StatelessWidget {

  const ListaDeLanches({super.key, required  this.lanche, required this.addToTotal, required this.removeFromTotal});

  final Lanche lanche;
  final Function(double) addToTotal;
  final Function(double) removeFromTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.network(lanche.urlImagem, width: 100, height: 100),
                Column(
                  children: [
                    Text(
                      lanche.nome,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      " R\$ ${lanche.preco}",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          addToTotal(lanche.preco);
                        },
                        child: Text('Adicionar'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          removeFromTotal(lanche.preco);
                        },
                        child: Text('Remover'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),

      ],
    );
  }
}
