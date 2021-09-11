import 'package:flutter/material.dart';
import 'package:fotonica_ui_components/address/cep_input.dart';
import 'package:fotonica_ui_components/address/data/models/via_cep_address.dart';

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
    Color? titleColor = Theme.of(context).textTheme.headline6!.color;

    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Endereço",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: titleColor),
          ),
          iconTheme: IconThemeData(
            color: titleColor
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
