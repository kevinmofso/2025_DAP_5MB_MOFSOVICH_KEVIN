import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentations/providers.dart';

class MovieScreen extends ConsumerWidget {
  const MovieScreen({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final legoList = ref.watch(listalegosprovider);
    final nameusuario = ref.watch(nameprovider);
    return Scaffold(
      appBar: AppBar(title: Text('hola $nameusuario')),
      body: ListView.builder(
        itemCount: legoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(legoList[index].name),
              subtitle: Text(
                 '${legoList[index].description}\n${legoList[index].weight}${' gr'}',
              ),
              leading: Image.network(
                legoList[index].posterurl,
                width: 150,
                height: 400,
                fit: BoxFit.fitHeight,
              ),
              onTap: () {
                final seleccionadolego = legoList[index];
                ref.read(selectedLegoProvider.notifier).state =
                    seleccionadolego;
                context.push('/card_detail');
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(selectedLegoProvider.notifier).state = null;
          context.push('/card_edit/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
