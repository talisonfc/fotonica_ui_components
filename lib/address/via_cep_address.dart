

class ViaCepAddress {
  String? cep;
  String? logradouro;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;
  String? numero;
  String? complemento;

  ViaCepAddress(
      {this.cep,
      this.localidade,
      this.bairro,
      this.logradouro,
      this.uf,
      this.ibge,
      this.ddd,
      this.gia,
      this.siafi,
      this.numero,
      this.complemento});

  ViaCepAddress.fromJson(Map<String, dynamic> json){
    cep = json["cep"];
    logradouro = json["logradouro"];
    bairro = json["bairro"];
    localidade = json["localidade"];
    uf = json["uf"];
    ibge = json["ibge"];
    ddd = json["ddd"];
    gia = json["gia"];
    siafi = json["siafi"];
  }

  String? get fullAddress {

    if(logradouro != null) {
      String address = "";
      address += logradouro!;
      address += ", ${numero ?? "SN"}";
      address += ", $bairro";
      address += ", $cep";
      address += ", $localidade";
      address += ", $uf";
      return address;
    }
    return null;
  }

  @override
  String toString() {
    return 'ViaCepAddress{cep: $cep, logradouro: $logradouro, bairro: $bairro, localidade: $localidade, uf: $uf, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi}';
  }
}
