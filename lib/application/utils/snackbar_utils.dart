import 'package:app_bloc_example/core/models/status_response.dart';
import 'package:flutter/material.dart';

abstract class SnackbarUtils {

  static void showSnackbarError({
    required BuildContext context, 
    required String message
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    ));
  }

  static void showSnackbarSuccess({
    required BuildContext context, 
    required String message
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    ));
  }

  static void showSnackbarWarning({
    required BuildContext context, 
    required String message
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.yellow.shade700,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.black
        ),
      ),
    ));
  }

  static void showSnackbarStatusResponse({
    required BuildContext context, 
    required StatusResponse statusResponse
  }) {

    if(statusResponse.isSuccess) {
      showSnackbarSuccess(context: context, message: statusResponse.message ?? "Sucesso na ação");
    } else if(statusResponse.isNotFound) {
      showSnackbarWarning(context: context, message: statusResponse.message ?? "Não foi encontrado o conteúdo");
    } else if(statusResponse.isError) {
      showSnackbarError(context: context, message: statusResponse.message ?? "Erro na ação");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.yellow.shade700,
        content: Text(
          statusResponse.message ?? "Mensagem não referenciada",
          style: TextStyle(
            color: Colors.grey.shade300,
          ),
        ),
      ));
    }

    
  }
}