// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/custom_snack_bar.dart';

class EditProfileController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController numberTextEditingController = TextEditingController();
  TextEditingController languageTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  final editProfileFormKey = GlobalKey<FormState>();
  List<String> selectedLanguage = [];

  FocusNode focusName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusNumber = FocusNode();
  FocusNode focusLanguage = FocusNode();
  FocusNode focusCountry = FocusNode();

  var selectedCountry = "".obs;

  String? selectedFile;

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

  final String _email = '';
  String get email => _email;

  @override
  void onClose() {
    focusName.removeListener(() {});
    focusEmail.removeListener(() {});
    focusNumber.removeListener(() {});
    focusLanguage.removeListener(() {});
    focusCountry.removeListener(() {});
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    numberTextEditingController.text = "+1";
    focusName.addListener(() {
      update();
    });
    focusEmail.addListener(() {
      update();
    });
    focusNumber.addListener(() {
      update();
    });
    focusLanguage.addListener(() {
      update();
    });
    focusCountry.addListener(() {
      update();
    });
    //
    //TODO: implement onInit
    super.onInit();
  }
}
