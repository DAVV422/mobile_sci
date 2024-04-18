class User {
    String id;
    String createdAt;
    String updatedAt;
    String nombre;
    String apellido;
    String email;
    String role;

  User(
    {
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.nombre,
      required this.apellido,
      required this.email,
      required this.role
    }
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      email: json['email'],
      role: json['role'],
    );
  }

   
}