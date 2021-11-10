import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {

  final String text;

  const ErrorPage({ 
    Key? key,
    this.text = "Um erro ocorreu" 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 100,
              color: Colors.red.shade900,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}