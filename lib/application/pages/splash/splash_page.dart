import 'package:app_bloc_example/application/pages/dashboard/dashboard_page.dart';
import 'package:app_bloc_example/application/pages/default/error_page.dart';
import 'package:app_bloc_example/application/styles/colors_app.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1)),
        builder: (context,snapshot) {

          if(snapshot.hasError) {
            return const ErrorPage(text: "Erro na inicialização do app");
          }

          if(snapshot.connectionState == ConnectionState.done) {
            return const DashboardPage();
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.playlist_add_check_rounded,
                  size: 100,
                  color: ColorsApp.primaryColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Aplicativo para testes com o BLOC",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}