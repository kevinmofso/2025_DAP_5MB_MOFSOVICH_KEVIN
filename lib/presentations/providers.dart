import 'package:myapp/entities/lego.dart';
import 'package:myapp/entities/usuario.dart';
import 'package:riverpod/riverpod.dart';

StateProvider<int> counterProvider = StateProvider<int>((ref) => 0);
StateProvider<List<Usuario>> listausuariosprovider =
    StateProvider<List<Usuario>>(
      (ref) => [
        Usuario(id: 1, name: "iphone", password: '1', mail: 'iphone@gmail.com'),
        Usuario(
          id: 2,
          name: "samsung",
          password: '1',
          mail: 'samsung@gmail.com',
        ),
        Usuario(id: 3, name: "1", password: '1', mail: '1'),
      ],
    );
final nameprovider = StateProvider<String>((ref) => '3');
StateProvider<List<Lego>> listalegosprovider = StateProvider<List<Lego>>(
  (ref) => [
    Lego(
      id: '1',
      name: 'estatua de la libertad',
      description: ' estatuas',
      posterurl:
          'https://m.media-amazon.com/images/I/71M2yesGbML._AC_SX679_.jpg',
      weight: '1',
    ),
    Lego(
      id: '2',
      name: 'nintendo ',
      description: ' gaming',
      posterurl: 'https://m.media-amazon.com/images/I/71mFyanrMSL._SL1500_.jpg',
      weight: '2',
    ),
    Lego(
      id: '3',
      name: 'Rocket',
      description: 'guardian of the galaxy',
      posterurl: 'https://m.media-amazon.com/images/I/81pf2CtxV7L._AC_SX569_.jpg',
      weight: '3',
    ),
    Lego(
      id: '4',
      name: 'spiderman',
      description: 'Spider‑Man: Car Chase',
      posterurl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDchWQMTL9dZx12ieVAs9MwVgjMr4G0moVmg&s',
      weight: '4',
    ),
  ],
);
final selectedLegoProvider = StateProvider<Lego?>((ref) => null);
final editarprovider = StateProvider<bool>((ref) => false);