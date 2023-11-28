// ignore_for_file: unused_field

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/custom_snack_bar.dart';

class TeacherProfileController extends GetxController {
  List<String> labels = [
    'Graduate',
    'Teacher',
    'Professional',
    'Content Writing',
    'Professional',
  ];

  var selectedCountry = "".obs;

  String? selectedFile;

  final String _email = '';

  String get email => _email;

  Future<void> camPick() async {
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      selectedFile = result.path;
      update();
    } else {
      CustomSnackBar.show('No Image picked');
    }
  }

  Future<void> galleryPick() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      selectedFile = result.path;
      update();
    } else {
      CustomSnackBar.show('No Image picked');
    }
  }

  void updateSelectedCountry(String country) {
    selectedCountry.value = country;
  }
}
