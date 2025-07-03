import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/entities/lego.dart';
import 'package:myapp/presentations/providers.dart';

class CardModo extends ConsumerStatefulWidget {
  const CardModo({super.key});

  @override
  ConsumerState<CardModo> createState() => _CardModoState();
}

class _CardModoState extends ConsumerState<CardModo> {
  TextEditingController inputid = TextEditingController();
  TextEditingController inputname = TextEditingController();
  TextEditingController inputdescription = TextEditingController();
  TextEditingController inputposterurl = TextEditingController();
  TextEditingController inputweight = TextEditingController();
  late bool editar;
  late bool idbloqueado;
  @override
  void initState() {
    super.initState();
    final lego = ref.read(selectedLegoProvider);

    if (lego != null) {
      inputid.text = lego.id.toString();
      inputname.text = lego.name;
      inputdescription.text = lego.description;
      inputposterurl.text = lego.posterurl;
      inputweight.text = lego.weight.toString();
      idbloqueado = false;
      editar = false;
    } else {
      inputid.text = '';
      inputname.text = '';
      inputdescription.text = '';
      inputposterurl.text = '';
      inputweight.text = '';
      idbloqueado = true;
      editar = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lego = ref.watch(selectedLegoProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          crearcamposdetexto(
            inputid,
            idbloqueado,
            'id de tu pieza',
            tipo: TextInputType.numberWithOptions(decimal: true),
          ),
          crearcamposdetexto(
            inputname,
            editar,
            'name de tu pieza',
            tipo: TextInputType.text,
          ),
          crearcamposdetexto(
            inputdescription,
            editar,
            'descripcion de tu pieza',
            tipo: TextInputType.multiline,
          ),
          crearcamposdetexto(
            inputposterurl,
            editar,
            'url de la foto de tu pieza',
            tipo: TextInputType.url,
          ),
          crearcamposdetexto(
            inputweight,
            editar,
            'peso de tu pieza',
            tipo: TextInputType.numberWithOptions(decimal: true),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                if (lego != null)
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        editar = !editar;
                      });
                    },
                  ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () {
                      final esPesoNumero =
                          double.tryParse(inputweight.text) != null;
                      if (!esPesoNumero) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("El peso tiene que ser un numero."),
                          ),
                        );
                        return;
                      }
                      List<Lego> nuevaLista = [];

                      final listaActual = ref.read(listalegosprovider);
                      if (lego != null) {
                        List<Lego> nuevaLista = [];

                        for (var legoselected in ref.read(listalegosprovider)) {
                          if (legoselected.id == lego.id) {
                            nuevaLista.add(
                              Lego(
                                id: inputid.text,
                                name: inputname.text,
                                description: inputdescription.text,
                                posterurl: inputposterurl.text,
                                weight: inputweight.text,
                              ),
                            );
                          } else {
                            nuevaLista.add(legoselected);
                          }
                        }
                        ref.read(listalegosprovider.notifier).state =
                            nuevaLista;
                        Navigator.pop(context);
                      } else if (lego == null) {
                        final idYaExiste = listaActual.any(
                          (elemento) => elemento.id == inputid.text,
                        );
                        final esIdNumero = int.tryParse(inputid.text) != null;
                        final esPesoNumero =
                            double.tryParse(inputweight.text) != null;

                        if (!esIdNumero) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "El ID tiene que ser un número entero.",
                              ),
                            ),
                          );
                          return;
                        }

                        if (!esPesoNumero) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("El peso tiene que ser un numero."),
                            ),
                          );
                          return;
                        }
                        if (inputid.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("El id no puede estar vacio"),
                            ),
                          );
                        } else if (idYaExiste) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Ya existe una pieza con ese ID, por favor elegir otro.",
                              ),
                            ),
                          );
                        } else {
                          if (inputposterurl.text == '') {
                            inputposterurl.text =
                                'https://cdn-icons-png.freepik.com/256/15452/15452390.png?semt=ais_hybrid';
                          }
                          if (inputdescription.text == '') {
                            inputdescription.text = 'descripcion faltante';
                          }
                          if (inputweight.text == '') {
                            inputweight.text = 'peso faltante';
                          }
                          if (inputname.text == '') {
                            inputname.text = 'nombre faltante';
                          }

                          for (var item in listaActual) {
                            nuevaLista.add(item);
                          }

                          nuevaLista.add(
                            Lego(
                              id: inputid.text,
                              name: inputname.text,
                              description: inputdescription.text,
                              posterurl: inputposterurl.text,
                              weight: inputweight.text,
                            ),
                          );

                          ref.read(listalegosprovider.notifier).state =
                              nuevaLista;
                          Navigator.pop(context);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

crearcamposdetexto(
  TextEditingController input,
  bool editar,
  String s, {
  TextInputType tipo = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: TextField(
      controller: input,
      enabled: editar,
      keyboardType: tipo,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: s,
      ),
    ),
  );
}
