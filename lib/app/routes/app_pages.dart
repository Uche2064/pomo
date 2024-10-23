import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/create_task/bindings/create_task_binding.dart';
import '../modules/create_task/views/create_task_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home.dart';
import '../modules/statistics/bindings/statistics_binding.dart';
import '../modules/statistics/views/statistics_view.dart';
import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/task_view.dart';
import '../views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => const TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => StatisticsView(),
      binding: StatisticsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TASK,
      page: () =>  CreateTaskView(),
      binding: CreateTaskBinding(),
    ),
  ];
}
