import 'package:app_bloc_example/application/pages/dashboard/dashboard_page.dart';
import 'package:app_bloc_example/application/pages/default/error_page.dart';
import 'package:app_bloc_example/application/pages/default/not_found_page.dart';
import 'package:app_bloc_example/application/pages/splash/splash_page.dart';
import 'package:app_bloc_example/application/pages/tasks/task_form_page.dart';
import 'package:app_bloc_example/application/pages/tasks/tasks_list_page.dart';
import 'package:app_bloc_example/domain/models/task.dart';
import 'package:flutter/material.dart';

abstract class RouteGenerator {

  static Route<dynamic> generateRoutes(RouteSettings settings) {

    final args = settings.arguments;

    switch(settings.name) {

      case "/":
        return _goTo(const SplashPage());
      
      case "/dashboard":
        return _goTo(const DashboardPage());

      case "/tasks":      
        return _goTo(const TasksListPage());

      case "/tasks/form":

        if(args == null || (args is Task)) {
          return _goTo(TaskFormPage(task: args as Task?));
        }
      
        return _goTo(
          const ErrorPage(text: "Erro na passagem de parâmetros")
        );

      default:
        return _goTo(const NotFoundPage());
    }
  }

  static MaterialPageRoute<dynamic> _goTo(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}