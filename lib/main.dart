import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _ocultarContrasenia = true;

  String contrasenia = '2';
  String usuario = '1';

  TextEditingController inputusuario = TextEditingController();
  TextEditingController inputcontrasenia = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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