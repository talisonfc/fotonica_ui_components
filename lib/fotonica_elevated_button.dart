import 'package:flutter/material.dart';

typedef Future FutureCallback();

class FotonicaElevatedButton extends StatefulWidget {
  final String label;
  final FutureCallback onPressed;
  final Icon? icon;
  final Color? color;
  final Color? labelColor;

  FotonicaElevatedButton({required this.label,
    required this.onPressed,
    this.icon,
    this.color,
    this.labelColor});

  @override
  createState() {
    return FotonicaElevatedButtonState();
  }
}

class FotonicaElevatedButtonState extends State<FotonicaElevatedButton> {

  bool _isRequesting = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        if(widget.onPressed != null){
          setState(() {
            _isRequesting = true;
          });
          widget.onPressed().then((_){
            setState(() {
              _isRequesting = false;
            });
          }).catchError((e){
            setState(() {
              _isRequesting = false;
            });
          });
        }
      },
      color: widget.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (widget.icon != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: widget.icon,
            ),
          if(_isRequesting)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2,),
            ),
          if(!_isRequesting)
            Text(
              widget.label,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(
                  fontWeight: FontWeight.bold, color: widget.labelColor),
            )
        ],
      ),
    );
  }
}
