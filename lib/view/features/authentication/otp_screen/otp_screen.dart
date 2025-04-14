
import 'package:ecommerce_app/view/features/authentication/reset_password_screen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'otp_controller.dart';
import '../../../../utils/global/global_variable.dart';
import '../../../../utils/global/screen_padding.dart';
import '../../../../utils/global/size_box.dart';
import '../../../../utils/style/app_style.dart';
import '../../../../utils/theme/app_colors/basic_color.dart';
import '../../../widgets/custom_widgets/custom_circular_progress_indicator.dart';
import '../../../widgets/custom_widgets/custom_elevated_button.dart';
import '../../../widgets/custom_widgets/custom_scaffold_widget.dart';
import 'widgets/custom_otp_text_form_field_widget.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = '/OtpScreen';
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>  {
  final controller = Get.find<OtpController>();
  dynamic txtTheme;

  //verify otp
  Future<void> otp()async{
    await controller.otp().then((value){
      if(value == success){
        Get.offNamedUntil(ResetPasswordScreen.routeName, (route) => false);
      }else{

      }
    });
  }

  initialize()async{
    controller.startTimer();
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_){
      initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textForm(),
        ],
      ),
    );
  }

  _textForm() {
    return Expanded(
      flex: 6,
      child: SingleChildScrollView(
        child: Padding(
          padding: screenPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter 4-digit OTP code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "We have sent you 4 digit code via your email, please check your email",
                //style: TextStyle(fontSize: 16, color: appAddToCartColor),
                style:  myTxt14(color: blackOnly),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomOtpTextFormFieldWidget(
                textFormLength: 6,
                returnOtpValue: (String digits){
                  //print("digits...$digits");
                  controller.otpDigits.value = digits;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return CustomElevatedButton(
                      themeIndex: 0,
                      textWidget:  controller.isLoading.value ? const CustomCircularProgressIndicator() :  "Verify OTP",
                      onPressed: !controller.buttonVisibility.value || controller.isLoading.value ? null : () async{
                        otp();
                      },
                    );
                  }),
                  szH20(),
                  GetBuilder<OtpController>(
                      builder: (controller){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Don't receive the code?",
                              style: myTxt14(color: Theme.of(context).textTheme.labelLarge!.color!),
                            ),
                            GetBuilder<OtpController> (
                                builder: (controller) {
                                  return controller.otpTimerValue > 0 ?  Text(
                                    " ${controller.formatTime()}",
                                    style: myTxt16(color: Theme.of(context).primaryColor ),
                                  )  : const SizedBox.shrink();
                                }
                            ),
                            GetBuilder<OtpController> (
                                builder: (controller) {
                                return controller.otpTimerValue > 0 ? const SizedBox.shrink() :
                                InkWell(
                                  onTap: ()async{
                                    if(controller.resendCounterForOTP > 0){
                                      await controller.setTimerValue(120);
                                      controller.startTimer();
                                    }
                                  },
                                  child: Text(
                                    " Resend Code",
                                    style: myTxt16(color: Theme.of(context).primaryColor),
                                  ),
                                );
                              }
                            ),
                          ],
                        );
                      }
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
