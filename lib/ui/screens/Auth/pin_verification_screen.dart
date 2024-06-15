import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/Auth/reset_password_screen.dart';
import 'package:task_manager/ui/screens/Auth/sign_in_screen.dart';

import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {


  final TextEditingController _pinTEController= TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const  SizedBox(height: 100),
                  Text(
                    'Pin Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    ' A 6 digits  verification pin has been sent your e-mail address',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const  SizedBox(height: 24),
                  _buildPinCodeTextField(),


                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed:_onTapVerifyOtpButton,
                      child: Text(
                        "Verify"
                      ),


                    ),



                  ),
                  SizedBox(height: 36),
                  _buildSignInSection()
                ],
              ),

            ),


          ),

        ),
      ),
    );
  }

  Widget _buildSignInSection() {
    return Center(
                  child:
                RichText(
                        text:TextSpan(
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight:FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                          text: " Have  Account?",
                          children: [
                            TextSpan(

                          text: 'Sign In',
                              style: TextStyle(
                                color: AppColors.themeColor,

                              ),
                              recognizer: TapGestureRecognizer()..onTap=(){
                                _onTapSignInButton();
                              }),



                          ]
                        )



                      ),


                );
  }

 Widget _buildPinCodeTextField() {
    return PinCodeTextField(
                  length: 6,

                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedColor: AppColors.themeColor,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  keyboardType: TextInputType.number,

                  enableActiveFill: true,

                  controller: _pinTEController,
                    appContext:context,
                );
  }


  void _onTapSignInButton()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
  }

  void _onTapVerifyOtpButton()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
  }





  @override
void dispose(){
 _pinTEController.dispose();
  super.dispose();

}
}
