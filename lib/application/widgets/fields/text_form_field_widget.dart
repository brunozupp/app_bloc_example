import 'package:flutter/material.dart';
import 'package:app_bloc_example/application/styles/colors_app.dart';

class TextFormFieldWidget extends StatelessWidget {

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String label;

  const TextFormFieldWidget({ 
    Key? key,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
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
        labelText: label,
        labelStyle: const TextStyle(
          color: ColorsApp.primaryColor
        )
      ),
    );
  }
}