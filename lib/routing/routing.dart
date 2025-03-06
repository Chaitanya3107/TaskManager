import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/navbar/navbar.dart';
import 'package:taskmanager/screens/add_tasks.dart';
import 'package:taskmanager/screens/task_list_screen.dart';

class Routing extends StatelessWidget {
  const Routing({super.key});

  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const NavBar();
        },
      ),
      GoRoute(
        path: '/AddTaskScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const AddTaskScreen();
        },
      ),
      GoRoute(
        path: '/TaskListScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const TaskListScreen();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
