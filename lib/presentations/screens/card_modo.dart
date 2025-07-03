import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentations/providers.dart';

class CardModo extends ConsumerWidget {
  const CardModo({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final modo = ref.watch(modoprovider);
    final legoList = ref.watch(listalegosprovider);
    final editar = ref.watch(editarprovider);
    final lego = ref.watch(selectedLegoProvider);
  TextEditingController inputid = TextEditingController();
    TextEditingController inputname = TextEditingController();
    TextEditingController inputdescription = TextEditingController();
    TextEditingController inputposterurl = TextEditingController();
    TextEditingController inputweight = TextEditingController();
    if (lego != null) {
      inputid.text = lego.id.toString();
      inputname.text = lego.name;
      inputdescription.text = lego.description;
      inputposterurl.text = lego.posterurl;
      inputweight.text = lego.weight.toString();
    }
  

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: inputid,
              decoration:InputDecoration(
                border:const   OutlineInputBorder(),
                labelText: ' id de tu pieza',
                enabled: false,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: inputname,
              decoration:  InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'name de tu pieza',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: inputdescription,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe la descripcion de tu pieza',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: inputposterurl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe la url de tu pieza',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: inputweight,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe la weight de tu pieza',
              ),
            ),
          ),
Align(
  alignment: Alignment.bottomRight,
  child: Padding(
    padding: EdgeInsets.all(12.0),
    child: IconButton(
      icon: Icon(editar ? Icons.edit : Icons.edit_outlined),
      onPressed: () {
        ref.read(editarprovider.notifier).update((state) => !state);
      },
    ),
  ),
),
        ],
      ),
    );
  }
}
