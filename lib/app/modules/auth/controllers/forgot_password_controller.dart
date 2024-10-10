import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pomo/app/modules/auth/models/contact_details.dart';
import 'package:pomo/core/global/strings.dart';

class ForgotPasswordController extends GetxController {
RxInt currentIndex = 0.obs;

  List<ContactDetails> contactDetails = [
    ContactDetails(
      leadingIconData: Iconsax.message,
      title: Strings.viaSms,
      subtitle: "+000***0000",
    ),
    ContactDetails(
      leadingIconData: Iconsax.sms,
      title: Strings.viaEmail,
      subtitle: "joh****@gmail.com",
    ),
  ];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
