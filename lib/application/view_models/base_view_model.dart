import 'package:flutter/cupertino.dart';

abstract class BaseViewModel {
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validate() => formKey.currentState!.validate();
}