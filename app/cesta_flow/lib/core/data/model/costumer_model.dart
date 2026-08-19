class Costumer {
  final int id;
  final String name;
  final DateTime dateOfBirth;
  final String email;
  final String phone;
  final String adress;
  final String city;
  final String cep;
  final String documentCPF;
  final String? documentRG;

  Costumer({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.email,
    required this.phone,
    required this.adress,
    required this.city,
    required this.cep,
    required this.documentCPF,
    this.documentRG,
  });
}
