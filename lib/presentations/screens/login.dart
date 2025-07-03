import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/usuario.dart';
import 'package:myapp/presentations/providers.dart';

final ocultarContraseniaProvider = StateProvider<bool>((ref) => true);
class Login extends ConsumerStatefulWidget {
  const Login({super.key});
  @override
  ConsumerState<Login> createState() => _LoginState();

}

class _LoginState extends ConsumerState<Login> {
  TextEditingController inputmail = TextEditingController();
  TextEditingController inputusuario = TextEditingController();
  TextEditingController inputcontrasenia = TextEditingController();
    bool ocultarContrasenia = false;
  
  @override
  Widget build(BuildContext context) {
    final usuarios = ref.watch(listausuariosprovider);

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
              if( ocultarContrasenia == false)
             IconButton(
                    iconSize: 50.0,
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        ocultarContrasenia = !ocultarContrasenia;
                      });
                    },
                  ),
                  if (ocultarContrasenia == true)
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        ocultarContrasenia = !ocultarContrasenia;
                      });
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


