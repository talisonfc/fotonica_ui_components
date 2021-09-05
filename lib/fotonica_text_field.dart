import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef String? ValidateFunction(String? s);

typedef Widget? BuildCounterFunction(BuildContext,
    {int currentLength, bool isFocused, int? maxLength});

class FotonicaTextField extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final TextInputType? type;
  final TextStyle? textStyle;
  final TextStyle? textStyleLabel;
  final InputBorder? border;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final VoidCallback? onTap;
  final bool readOnly;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final bool filled;
  final Widget? prefixIcon;
  final Widget? suffix;
  final ValidateFunction? validator;
  final TextCapitalization textCapitalization;
  final AutovalidateMode autovalidateMode;
  final double radius;
  final List<TextInputFormatter>? inputFormatters;

  FocusNode? focusNode;
  final BuildCounterFunction? buildCounter;
  final int? maxLength;
  final String? tooltipText;
  final TextInputAction textInputAction;
  final EdgeInsets contentPadding;
  final String? initialValue;
  final bool isRequired;

  FotonicaTextField({Key? key,
    this.label,
    this.placeholder,
    this.controller,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.onChange,
    this.type,
    this.textStyle,
    this.textStyleLabel,
    this.border,
    this.minLines = 1,
    this.maxLines = 1,
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixIcon,
    this.filled = false,
    this.prefixIcon,
    this.initialValue,
    this.suffix,
    this.validator,
    this.radius = 5.0,
    this.textCapitalization = TextCapitalization.sentences,
    this.edgeInsetsGeometry = EdgeInsets.zero,
    this.inputFormatters,
    this.focusNode,
    this.buildCounter,
    this.maxLength,
    this.isRequired = false,
    this.textInputAction = TextInputAction.none,
    this.tooltipText,
    this.contentPadding =
    const EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 16)})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FotonicaTextField();
  }
}

class _FotonicaTextField extends State<FotonicaTextField> {
  bool _textFieldFocus = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) widget.focusNode = FocusNode();

    widget.focusNode!.addListener(() {
      setState(() {
        _textFieldFocus = !_textFieldFocus;
      });
    });
  }

  Widget buildLabel(BuildContext context) =>
      widget.tooltipText != null
          ? Tooltip(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(8.0),
        message: widget.tooltipText ?? "Tooltip message not defined",
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.label != null)
                Text(
                  widget.label!,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              const SizedBox(width: 4.0),
              Icon(
                Icons.help,
                size: 14.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      )
          : Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          widget.label!,
          style: Theme
              .of(context)
              .textTheme
              .bodyText1!
              .copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  String? defaultValidator(String? v) {
    if (v != null && v.isEmpty) return "Campo obrigatório";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [];

    if (widget.label != null) {
      content.add(buildLabel(context));
    }

    content.add(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          border: !_textFieldFocus
              ? Border.all(color: Colors.grey[200]!, width: 2)
              : Border.all(color: Colors.grey[300]!, width: 2),
        ),
        child: Row(children: [
          Expanded(
            child: TextFormField(
              initialValue: widget.initialValue,
              autovalidateMode: AutovalidateMode.disabled,
              readOnly: widget.readOnly,
              obscureText: widget.obscureText,
              controller: widget.controller,
              onChanged: widget.onChange,
              textCapitalization: widget.textCapitalization,
              keyboardType:
              widget.type != null ? widget.type : TextInputType.text,
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                filled: widget.filled,
                fillColor: Colors.white,
                focusColor: Colors.white,
                suffixIcon: widget.suffixIcon,
                suffix: widget.suffix,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(color: Theme
                      .of(context)
                      .errorColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(color: Theme
                      .of(context)
                      .errorColor),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide.none),
                contentPadding: widget.contentPadding,
                // labelText: placeholder,
                labelStyle: widget.textStyleLabel != null
                    ? widget.textStyleLabel
                    : TextStyle(color: Colors.grey[10]),
                hintText: widget.placeholder,
                hintMaxLines: widget.maxLines,
                hintStyle: widget.textStyleLabel != null
                    ? widget.textStyleLabel
                    : TextStyle(color: Colors.grey[10]),
              ),
              style: widget.textStyle,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              focusNode: widget.focusNode,
              onTap: widget.onTap,
              cursorWidth: 2.0,
              validator: widget.validator != null
                  ? widget.validator
                  : widget.isRequired ? defaultValidator : null,
              inputFormatters: widget.inputFormatters,
              maxLength: widget.maxLength,
              buildCounter: widget.buildCounter,
            ),
          )
        ]),
      ),
    );

    return Container(
      margin: widget.edgeInsetsGeometry != null
          ? widget.edgeInsetsGeometry
          : EdgeInsets.only(bottom: 8),
      child: Wrap(children: content),
    );
  }
}
