import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentations/providers.dart';

class CardDetails extends ConsumerWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lego = ref.watch(selectedLegoProvider);

    return Scaffold(
      body: GestureDetector(
      behavior: HitTestBehavior.opaque, 
      onTap: () {
         Navigator.pop(context); 
      },
        child:Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen
              Image.network(
                lego!.posterurl,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
          
              // Botones
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 50.0,
                    icon: const Icon(Icons.edit),
                    onPressed: () {
          
                  context.push('/card_edit/add');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                      iconSize: 50.0,
                      icon: const Icon(Icons.delete),
                      onPressed: () {
          ref.read(listalegosprovider.notifier).state =
            ref.read(listalegosprovider.notifier).state.where((d) => d != lego).toList();
                        Navigator.pop(context);('/movie_Screen');
                        // Acción de guardar
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
