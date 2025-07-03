import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/usuario.dart';
import 'package:myapp/presentations/providers.dart';

final ocultarContraseniaProvider = StateProvider<bool>((ref) => true);

class Login extends ConsumerWidget {
  const Login({super.key});
  // ignore: prefer_final_fields
  @override
  Widget build(BuildContext context, ref) {
    final ocultarContrasenia = ref.watch(ocultarContraseniaProvider);
    final usuarios = ref.watch(listausuariosprovider);
    TextEditingController inputmail = TextEditingController();
    TextEditingController inputusuario = TextEditingController();
    TextEditingController inputcontrasenia = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: inputusuario,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu usuario',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: inputcontrasenia,
              obscureText: ocultarContrasenia,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu contraseña',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: inputmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu mail',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: ocultarContrasenia,
                onChanged: (value) {
                  value = ref
                      .read(ocultarContraseniaProvider.notifier)
                      .update((state) => !state);
                },
              ),
              const Text("Ocultar contraseña"),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                String mensaje;
                if (inputusuario.text == '' ||
                    inputcontrasenia.text == '' ||
                    inputmail.text == '') {
                  mensaje = 'todos los campos deben estar completados';
                } else if (estabientodo(
                      inputmail.text,
                      inputusuario.text,
                      inputcontrasenia.text,
                      usuarios,
                    ) !=
                    null) {
                  ref
                      .read(nameprovider.notifier)
                      .update(
                        (state) =>
                            estabientodo(
                              inputmail.text,
                              inputusuario.text,
                              inputcontrasenia.text,
                              usuarios,
                            )!,
                      );
                  mensaje = 'Login exitoso';
                  context.go('/movie_Screen');
                  return;
                } else {
                  mensaje = 'Usuario o contraseña incorrectos';
                }

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(mensaje)));
              },
              child: const Text('Comprobar'),
            ),
          ),
        ],
      ),
    );
  }
}
