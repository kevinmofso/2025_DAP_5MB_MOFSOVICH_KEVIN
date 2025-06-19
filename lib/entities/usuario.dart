class Usuario {
  String name;
  String password;
  String mail;
  String? direccion;
  Usuario({required this.name,required this.password,required this.mail,this.direccion });


}

bool estabientodo(String mail, String usuario, String password, List<Usuario> usuarios) {
  if (usuarios.any((u) => u.mail == mail)) {
    var usuarioencontrado = usuarios.firstWhere((u) => u.mail == mail);
    return usuarioencontrado.name == usuario && usuarioencontrado.password == password;
  } else {
    return false;
  }
}
