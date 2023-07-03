import 'package:flutter/material.dart';
import 'package:flutter_elisoft_task/router/app_router.dart';

void main() {
  runApp(ElisoftTask(
    appRouter: AppRouter(),
  ));
}

class ElisoftTask extends StatelessWidget {
  final AppRouter appRouter;

  const ElisoftTask({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
