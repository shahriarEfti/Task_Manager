import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/Auth/email_verification_screen.dart';
import 'package:task_manager/ui/screens/Auth/sign_up_screen.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';

import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {


  final TextEditingController _emailTEController= TextEditingController();
  final TextEditingController _passwordTEController= TextEditingController();



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
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'E-mail',

                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: InputDecoration(
                      hintText: 'Password',

                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _onTapToNextButton,
                      child: Icon(Icons.arrow_circle_right_outlined),


                    ),



                  ),
                  SizedBox(height: 36),
                  Center(
                    child: Column(
                      children: [
                        TextButton(onPressed: _onForgotPasswordButton,
                        child: Text('Forgot Password??'),),

                        RichText(
                          text:TextSpan(
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight:FontWeight.w600,
                              letterSpacing: 0.4,
                            ),
                            text: "'Don't have an Account?",
                            children: [
                              TextSpan(

                            text: 'Sign Up',
                                style: TextStyle(
                                  color: AppColors.themeColor,

                                ),
                                recognizer: TapGestureRecognizer()..onTap=(){
                                  _onTapSignUpButton();
                                }),



                            ]
                          )



                        ),
                      ],
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


  void _onTapToNextButton(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainBottomNavScreen(),),);

  }


  void _onTapSignUpButton()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen(),),);
  }

  void _onForgotPasswordButton()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> EmailVerificationScreen(),),);
  }



  @override
void dispose(){
  _emailTEController.dispose();
  _passwordTEController.dispose();
  super.dispose();

}
}
