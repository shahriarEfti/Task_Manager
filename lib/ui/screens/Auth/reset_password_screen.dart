import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/Auth/sign_in_screen.dart';

import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {


  final TextEditingController _passwordTEController= TextEditingController();
  final TextEditingController _confirmpasswordTEController= TextEditingController();



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
                    'Set Password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    ' Minimum length of  password  8 character with letter number and combination',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const  SizedBox(height: 24),
                  TextFormField(
                    controller: _passwordTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: ' Password ',

                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  const  SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmpasswordTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: ' Confirm Password ',

                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),



                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _onTapConfirmButton,
                      child: Text(
                          "Confrim"
                      ),


                    ),



                  ),
                  SizedBox(height: 36),
                  Center(
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


                  )
                ],
              ),

            ),


          ),

        ),
      ),
    );
  }


  void _onTapSignInButton()
  {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInScreen()), (route)=>false);
  }

  void _onTapConfirmButton()
  {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInScreen()), (route)=>false);
  }
@override
void dispose(){
  _confirmpasswordTEController.dispose();
  _passwordTEController.dispose();
  super.dispose();

}
}
