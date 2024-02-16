// import 'package:ResellerCustomerMobile/cores/configs/configs.dart';
// import 'package:ResellerCustomerMobile/cores/controllers/Controller.dart';
// import 'package:ResellerCustomerMobile/cores/data/models/api/api_response_plain.dart';
// import 'package:ResellerCustomerMobile/cores/data/models/login_model.dart';
// import 'package:ResellerCustomerMobile/cores/data/models/screen_argument_model.dart';
// import 'package:ResellerCustomerMobile/cores/data/providers/providers.dart';
// import 'package:ResellerCustomerMobile/cores/routes/pages.dart';
// import 'package:ResellerCustomerMobile/cores/services/services.dart';
// import 'package:ResellerCustomerMobile/cores/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:forisa_package/configs/config_constants.dart';
import 'package:forisa_package/controllers/Controller.dart';
import 'package:forisa_package/utils/AlertUtil.dart';
import 'package:forisa_package/utils/PickerUtil.dart';
import 'package:get/get.dart';
// import 'package:ResellerCustomerMobile/cores/data/models/lookup_model.dart'
//     as Lookup;
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as Http;

import '../../data/models/screen_argument_model.dart';

enum AuthTag { register, login, common }

class AuthController extends Controller {
  final AuthTag tag;
  AuthController(this.tag);

  // final _authService = AuthService();
  // final _lookupService = LookupService();
  final txtEmailController = TextEditingController(),
      txtPasswordController = TextEditingController(),
      txtPhoneController = TextEditingController(),
      txtAreaController = TextEditingController(),
      txtAddressController = TextEditingController(),
      txtIDNoController = TextEditingController(),
      txtTaxNoController = TextEditingController(),
      txtTaxEffectiveDateController = TextEditingController(),
      txtResetEmailController = TextEditingController(),
      txtOTPController = TextEditingController(),
      txtReferralController = TextEditingController(),
      txtNameController = TextEditingController();
  var iDNoFilePath = ''.obs, taxDocFilePath = ''.obs;
  var landcode = ''.obs;
  // final lancodeList = <Lookup.Arrdatum>[].obs;
  var lat = ''.obs, long = ''.obs;
  var txtEmailError = ''.obs,
      txtPasswordError = ''.obs,
      txtNameError = ''.obs,
      txtAreaError = ''.obs,
      txtAddressError = ''.obs,
      txtIDNoError = ''.obs,
      txtTaxNoError = ''.obs,
      txtTaxEffectiveDateError = ''.obs,
      txtResellerLatError = ''.obs,
      txtTaxDocFileError = ''.obs,
      txtiDNoFileError = ''.obs,
      txtResetEmailError = ''.obs,
      txtOTPError = ''.obs,
      txtReferralError = ''.obs,
      txtPhoneError = ''.obs;
  var isPasswordVisible = false.obs;

  var resetPassGranted = false.obs;
  final screenArgument = Get.arguments as ScreenArgument?;
  bool googleGranted = false;

  @override
  void onInit() {
    super.onInit();
    if (screenArgument?.listPayload != null) {
      googleGranted = true;
    }
  }

  uploadTax(ImageSource source) async {
    String path = await PickerUtil.pickImage(source);

    if (path != '') {
      this.txtTaxDocFileError.value = '';
      this.taxDocFilePath.value = path;
    }
  }

  uploadIDNo(ImageSource source) async {
    String path = await PickerUtil.pickImage(source);

    if (path != '') {
      this.txtiDNoFileError.value = '';
      this.iDNoFilePath.value = path;
    }
  }

}
