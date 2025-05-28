import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
   // ignore: prefer_final_fields
   bool _ocultarContrasenia = true;

  String contrasenia = '2';
  String usuario = '1';

  TextEditingController inputusuario = TextEditingController();
  TextEditingController inputcontrasenia = TextEditingController();
   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextField(
              controller: inputusuario,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu usuario',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              controller: inputcontrasenia,
              obscureText: _ocultarContrasenia,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu contraseña',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _ocultarContrasenia,
                onChanged: (value) {
                  setState(() {
                    _ocultarContrasenia = value!;
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
                    inputcontrasenia.text == '' ) {
                  mensaje = 'todos los campos deben estar completados';
                } else if (inputusuario.text == usuario &&
                    inputcontrasenia.text == contrasenia) {
                  mensaje = 'login exitoso';
                      context.go('/home',extra: usuario);
                } else {
                  mensaje = 'usuario o contraseña incorrectos';
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

