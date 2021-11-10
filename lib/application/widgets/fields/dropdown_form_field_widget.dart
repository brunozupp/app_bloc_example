import 'package:app_bloc_example/application/styles/colors_app.dart';
import 'package:flutter/material.dart';

class DropdownFormFieldWidget<T> extends StatelessWidget {

  final T? value;
  final String Function(T) onGenerateDescription;
  final List<T> items;
  final void Function(T?)? onChanged;
  final String label;
  final String? Function(T?)? validator;

  const DropdownFormFieldWidget({ 
    Key? key, this.value, 
    required this.onGenerateDescription, 
    required this.items, 
    required this.onChanged, 
    required this.label,
    this.validator
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      items: items.map((e) => DropdownMenuItem(
        child: Text(onGenerateDescription(e)),
        value: e,
      )).toList(),
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
        ),
      ),
      validator: validator,
    );
  }
}