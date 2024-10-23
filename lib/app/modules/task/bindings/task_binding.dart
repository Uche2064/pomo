import 'package:get/get.dart';
import 'package:pomo/app/modules/task/controllers/pomo_task_controller.dart';


class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PomoTaskController>(
      () => PomoTaskController(),
    );
  }
}
