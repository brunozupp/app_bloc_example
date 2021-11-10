import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.not_listed_location_sharp,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Página não encontrada",
              style: TextStyle(
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}