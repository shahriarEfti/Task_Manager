import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/Auth/pin_verification_screen.dart';

import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {


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
                    'Your E-mail Adress',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    ' A 6 digits  verification pin will sent your e-mail address',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: ' E-mail ',

                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),


                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _onTapConfirmButton,
                      child: Icon(Icons.arrow_circle_right_outlined),


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
    Navigator.pop(context);
  }

  void _onTapConfirmButton()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PinVerificationScreen()));
  }
@override
void dispose(){
  _emailTEController.dispose();
  _passwordTEController.dispose();
  super.dispose();

}
}
