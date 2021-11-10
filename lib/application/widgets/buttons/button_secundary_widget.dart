import 'package:app_bloc_example/application/styles/colors_app.dart';
import 'package:flutter/material.dart';

class ButtonSecundaryWidget extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final bool loading;

  const ButtonSecundaryWidget({ 
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
                valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor),
              ),
            )
            
            : Text(
              text,
            ),
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            side: MaterialStateProperty.all(
              const BorderSide(
                color: ColorsApp.primaryColor
              )
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if(states.contains(MaterialState.disabled)) return Colors.grey;
              if(states.contains(MaterialState.pressed)) return ColorsApp.primaryColor.withAlpha(25);

              return ColorsApp.primaryColor.withAlpha(25);
            }),
            textStyle: MaterialStateProperty.resolveWith((states) {
              if(states.contains(MaterialState.pressed)) {
                return TextStyle(
                  fontSize: 18,
                  foreground: Paint()..color = ColorsApp.primaryColor,
                );
              }

              return TextStyle(
                fontSize: 16,
                foreground: Paint()..color = ColorsApp.primaryColor,
              );
            }),
          ),
        ),
      ),
    );
  }
}