import 'package:flutter/material.dart';
import 'package:app_bloc_example/application/styles/colors_app.dart';

class CardDashboard extends StatelessWidget {

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const CardDashboard({ 
    Key? key, 
    required this.text, 
    required this.icon, 
    required this.onTap 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorsApp.primaryColor,
            spreadRadius: 0.2
          )
        ]
      ),
      child: Material(
        color: ColorsApp.primaryBackgroundColor,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: ColorsApp.primaryColor,
                size: 70,
              ),
              Text(
                text.toUpperCase(),
                style: const TextStyle(
                  color: ColorsApp.primaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}