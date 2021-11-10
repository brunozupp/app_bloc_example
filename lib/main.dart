import 'package:app_bloc_example/application/cubits/task_cubit/task_cubit_state.dart';
import 'package:app_bloc_example/application/routes/route_generator.dart';
import 'package:app_bloc_example/application/styles/themes_app.dart';
import 'package:app_bloc_example/data/repositories/task_repository_impl.dart';
import 'package:app_bloc_example/domain/services/task_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* OBSERVAÇÃO AO ENVOLVER TODA A APLICAÇÃO NUM PROVIDER
     * Apenas os Blocs que são necessários para toda a aplicação deveriam vir aqui.
     * Um exemplo disso seria um BLOC de autenticação, em que todas as requisições vão
     * precisar do token para autorizar a ação no backend.
     * Esse exemplo de Task, seria melhor empregado envolvendo o widget da página localmente,
     * isso é, lá na função RouteGenerator.generateRoutes, achar a rota e envolver a chamada
     * da página num BlocProvider ou MultiBlocProvider. E no caso da página de Form da Task,
     * eu passaria o contexto da página de lista, que contém a identificação do BLOC para dentro
     * da página de Form, assim eu poderia chamar a função de salvar/editar a partir de
     * context.read<TaskCubitState>().insert(...)     
     **/
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskCubitState>(create: (_) => TaskCubitState(
          taskService: TaskServiceImpl(
            taskRepository: TaskRepositoryImpl()
          ),
        )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc Example',
        theme: ThemesApp.primary,
        onGenerateRoute: RouteGenerator.generateRoutes,
        initialRoute: "/",
      ),
    );
  }
}