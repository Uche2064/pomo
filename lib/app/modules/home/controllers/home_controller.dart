import 'package:get/get.dart';
import 'package:pomo/app/modules/auth/controllers/auth_controller.dart';
import 'package:pomo/app/modules/auth/models/task.dart';
import 'package:pomo/app/modules/auth/models/user_account.dart';
import 'package:pomo/app/modules/auth/services/app_services.dart';
import 'package:pomo/app/modules/auth/services/auth_services.dart';

class HomeController extends GetxController {
  AuthServices _authServices = AuthServices();
  AppServices _appServices = AppServices();
  AuthController _authController = Get.find();
  RxInt currentIndex = 0.obs;
  final second = 0.obs;
  final minutes = 2.obs;
  Rx<UserAccount?> currentUser = Rx<UserAccount?>(null);
  RxList<Task?> tasksList = <Task>[].obs;
  RxList<Task?> completedTasks = <Task>[].obs;
  RxList<Task?> notCompletedTask = <Task>[].obs;

  @override
  void onReady() async {
    await fetchCurrentUserInfo();
    printInfo(info: "current user: ${currentUser.value.toString()}");

    super.onReady();
  }

  @override
  void onInit() {
    fetchAllTasks();

    super.onInit();
  }

  // String? displayName() {
  //   if (currentUser.value?.nickName == "") {
  //     return currentUser.value!.fullName!;
  //   }
  //   return currentUser.value?.nickName;
  // }
  String extractUsername(String email) {
    if (email.contains('@')) {
      return email.split('@')[0]; // Récupère la partie avant le '@'
    } else {
      throw FormatException("L'adresse e-mail est invalide.");
    }
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }

  Future<void> fetchCurrentUserInfo() async {
    await _authServices.fetchCurrentUser().listen((user) {
      currentUser.value = user;
      printInfo(info: "current user: ${currentUser.value.toString()}");
    });
  }

  Future<void> logoutUser() async {
    await _authServices.logoutUser();
    _authController.screenRedirect();
  }

  fetchAllTasks() async* {
    // yield* _appServices.getTasksByUser();
  }
}
