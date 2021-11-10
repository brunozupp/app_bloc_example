import 'package:flutter/material.dart';
import 'package:app_bloc_example/application/styles/colors_app.dart';

class PasswordFormFieldWidget extends StatefulWidget {

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String label;

  const PasswordFormFieldWidget({ 
    Key? key,
    this.controller,
    this.validator,
    this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  State<PasswordFormFieldWidget> createState() => _PasswordFormFieldWidgetState();
}

class _PasswordFormFieldWidgetState extends State<PasswordFormFieldWidget> {

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.primaryColor
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.errorColor
          ),
        ),
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: ColorsApp.primaryColor
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(
            Icons.remove_red_eye,
            color: obscureText ? Colors.grey : ColorsApp.primaryColor,
          ),
        ),
      ),
    );
  }
}