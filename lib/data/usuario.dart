// ignore_for_file: non_constant_identifier_names

class Usuario {
  factory Usuario.fromMap(Map<String, dynamic> data) {
    final int id = data["ID"];
    final String nome = data["Nome"];
    final String login = data["Login"];
    final int grupoId = data["GrupoUsuario_ID"];
    final String password = data["Password"];
    final String hash = data["Hash"];
    final String token = data["Token"];

    return Usuario._internal(
      ID: id,
      Nome: nome,
      Login: login,
      GrupoUsuario_ID: grupoId,
      Password: password,
      Hash: hash,
      Token: token,
    );
  }

  Usuario._internal({
    required this.ID,
    required this.Nome,
    required this.Login,
    required this.GrupoUsuario_ID,
    required this.Password,
    required this.Hash,
    required this.Token,
  });

  final int ID;
  final String Nome;
  final String Login;
  final int GrupoUsuario_ID;
  final String Password;
  final String Hash;
  final String Token;
}
