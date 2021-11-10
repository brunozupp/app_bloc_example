import 'package:app_bloc_example/application/styles/colors_app.dart';
import 'package:flutter/material.dart';

class ButtonPrimaryWidget extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final bool loading;

  const ButtonPrimaryWidget({ 
    Key? key,
    required this.text,
    required this.onPressed,
    this.loading = false 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: loading,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          child: loading 
          
            ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
            
            : Text(
              text,
            ),
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if(states.contains(MaterialState.disabled)) return Colors.grey;
              if(states.contains(MaterialState.pressed)) return Colors.purple.shade700;

              return ColorsApp.primaryColor;
            }),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
              if(states.contains(MaterialState.pressed)) {
                return const TextStyle(
                  fontSize: 18
                );
              }

              return const TextStyle(
                fontSize: 16
              );
            }),
          ),
        ),
      ),
    );
  }
}