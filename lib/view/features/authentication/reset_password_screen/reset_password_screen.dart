import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'reset_password_controller.dart';
import '../../../../utils/global/classes/password_validation.dart';
import '../../../../utils/global/global_variable.dart';
import '../../../../utils/global/screen_padding.dart';
import '../../../../utils/global/size_box.dart';
import '../../../../utils/style/app_style.dart';
import '../../../widgets/custom_widgets/custom_circular_progress_indicator.dart';
import '../../../widgets/custom_widgets/custom_elevated_button.dart';
import '../../../widgets/custom_widgets/custom_scaffold_widget.dart';
import '../../../widgets/custom_widgets/custom_text_form_field.dart';
import '../login_screen/login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/ResetPasswordScreen';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final controller = Get.find<ResetPasswordController>();
  dynamic txtTheme;

  //login
  Future<void> resetPassword()async{
    await controller.resetPassword().then((value){
      if(value == success){
        Get.offNamedUntil(LoginScreen.routeName, (route) => false);
      }else{
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      body: Column(
        children: [
          formAndButtonContent(),
        ],
      ),
    );
  }

  formAndButtonContent() {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: screenPadding(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Reset Password',
                style: myTxt18(color: Colors.black),
              ),
              szH20(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password", style: myTxt14(color: Colors.black)),
                  szH6(),
                  GetBuilder<ResetPasswordController>(
                      builder: (controller) {
                        return CustomTextFormField(
                          controller: controller.passwordController,
                          hintText: "Password",
                          isPassword: true,
                          suffixIcon:  const Icon(Icons.visibility).icon,
                          onChanged: (value) {
                            controller.passwordErrorText.value = PasswordValidation().getPasswordValidationText(password: value, previousPassword: controller.confirmPasswordController.text);
                            controller.isPasswordError.value = !controller.passwordErrorText.contains(noError);
                            controller.loginButtonVisibility();
                          },
                          validation: (value) {
                            return controller.isPasswordError.value ? controller.passwordErrorText.value : null;
                          },
                        );
                      }),
                ],
              ),
              szH20(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Confirm Password", style: myTxt14(color: Colors.black)),
                  szH6(),
                  GetBuilder<ResetPasswordController>(
                      builder: (controller) {
                        return CustomTextFormField(
                          controller: controller.confirmPasswordController,
                          hintText: "Confirm password",
                          isPassword: true,
                          suffixIcon:  const Icon(Icons.visibility).icon,
                          onChanged: (value) {
                            controller.confirmPasswordErrorText.value = PasswordValidation().getPasswordValidationText(password: value, previousPassword: controller.passwordController.text);
                            controller.isConfirmPasswordError.value = !controller.confirmPasswordErrorText.contains(noError);
                            controller.loginButtonVisibility();
                          },
                          validation: (value) {
                            return controller.isConfirmPasswordError.value ? controller.confirmPasswordErrorText.value : null;
                          },
                        );
                      }),
                ],
              ),
              szH20(),
              Obx(() {
                return CustomElevatedButton(
                  themeIndex: 0,
                  textWidget:  controller.isLoading.value ? const CustomCircularProgressIndicator() :  "Submit",
                  onPressed: !controller.buttonVisibility.value || controller.isLoading.value ? null : () async{
                    resetPassword();
                  },
                );
              }),
              szH15(),
            ],
          ),
        ),
      ),
    );
  }
}
