

class Usuario {
  String name;
  String password;
  String mail;
  int id; 
  Usuario({
    required this.name,
    required this.password,
    required this.mail,
    required this.id,
  });
}

 String? estabientodo(
  String mail,
  String usuario,
  String password,
  List<Usuario> usuarios,
) {
  for (var u in usuarios) {
    if (u.mail == mail && u.name == usuario && u.password == password) {
      return u.name; 
    }
  }
  return null;
}