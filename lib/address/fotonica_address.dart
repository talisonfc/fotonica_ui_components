
import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/address/cep_input.dart';
import 'package:fotonica_ui_components/address/via_cep_address.dart';

class FotonicaAddress extends StatefulWidget {
  final ViaCepAddress viaCepAddress;
  final Function(ViaCepAddress? address) onChange;

  FotonicaAddress({required this.viaCepAddress, required this.onChange});

  @override
  State<StatefulWidget> createState() {
    return FotonicaAddressState();
  }
}

class FotonicaAddressState extends State<FotonicaAddress> {
  // ViaCepAddress address;

  @override
  void initState() {
    super.initState();
    // this.address = widget.viaCepAddress;
  }

  void goToAddressEditor(ViaCepAddress address) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Endereço"
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CepInput(
            onChange: widget.onChange,
            address: address,
          ),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.viaCepAddress.fullAddress ?? "Not defined",
        style: Theme.of(context).textTheme.bodyText2,
      ),
      subtitle:
          Text(widget.viaCepAddress.complemento ?? "Complemento não definido"),
      trailing: IconButton(
        icon: Icon(Icons.location_on_outlined),
        onPressed: () {
          goToAddressEditor(widget.viaCepAddress);
        },
      ),
    );
  }
}
