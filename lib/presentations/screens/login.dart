import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/usuario.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  // ignore: prefer_final_fields
  bool _ocultarContrasenia = true;

  List<Usuario> usuarios = [
    Usuario(name: "iphone", password: '1', mail: 'iphone@gmail.com'),
    Usuario(name: "samsung", password: '1', mail: 'samsung@gmail.com'),
  ];

  TextEditingController inputmail = TextEditingController();
  TextEditingController inputusuario = TextEditingController();
  TextEditingController inputcontrasenia = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: inputusuario,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu usuario',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: inputcontrasenia,
              obscureText: _ocultarContrasenia,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu contraseña',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                    inputcontrasenia.text == '' ||
                    inputmail.text == '') {
                  mensaje = 'todos los campos deben estar completados';
                } else if (estabientodo(inputmail.text, inputusuario.text, inputcontrasenia.text, usuarios)) {
                  var usuarioencontrado = usuarios.firstWhere((u) => u.mail == inputmail.text);
                  mensaje = 'Login exitoso';
                  context.go('/home', extra: usuarioencontrado );
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
