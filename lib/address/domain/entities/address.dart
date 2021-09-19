class Address {
  String cep;
  String street;
  String? complement;
  String city;
  String country;
  String state;
  String number;
  String? district;
  double? lat;
  double? lng;

  Address(
      {required this.cep,
      required this.street,
      this.complement,
      required this.city,
      required this.country,
      required this.state,
      this.district,
      this.number = "SN",
      this.lat,
      this.lng});
}
