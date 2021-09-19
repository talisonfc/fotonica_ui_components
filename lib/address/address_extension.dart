import 'package:fotonica_ui_components/address/_exports.dart';

extension AddressExtension on Address {
  String? get fullAddress {
    if (cep.isNotEmpty) {
      List<String?> fullAddress = [
        this.street,
        this.cep,
        this.number,
        this.district!,
        this.state,
        this.country,
      ];
      return fullAddress.where((e) => e != null && e.isNotEmpty).join(", ");
    }
    return null;
  }
}
