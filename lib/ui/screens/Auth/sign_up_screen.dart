import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/Auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  final TextEditingController _emailTEController= TextEditingController();
  final TextEditingController _passwordTEController= TextEditingController();
  final TextEditingController _firstnameTEController= TextEditingController();
  final TextEditingController _lastnameTEController= TextEditingController();
  final TextEditingController _mobileTEController= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  SizedBox(height: 100),
                    Text(
                      'Join With Us',
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
                      validator: (String? value){
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter your E-mail';

                    }
                        return null;
                    },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _firstnameTEController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      validator: (String? value){
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter your First name';

                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _lastnameTEController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      validator: (String? value){
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter your Last name';

                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Mobile',
                
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      validator: (String? value){
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter your Mobile Number';

                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                     
                      controller: _passwordTEController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      validator: (String? value){
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter your Password';

                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {

                          if(_formKey.currentState!.validate()){

                          }
                        },
                        child: Icon(Icons.arrow_circle_right_outlined),
                
                
                      ),
                
                
                
                    ),
                    SizedBox(height: 36),
                    _buildBackToSignInSection(),
                
                  ],
                ),
              ),

            ),


          ),

        ),
      ),
    );
  }

 Widget _buildBackToSignInSection() {
    return Center(
                  child: RichText(
                        text:TextSpan(
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight:FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                          text: "'Have Account?",
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

  void _onTapSignInButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
  }

@override
void dispose(){
  _emailTEController.dispose();
  _passwordTEController.dispose();
  _mobileTEController.dispose();
  _lastnameTEController.dispose();
  _firstnameTEController.dispose();
  super.dispose();

}
}
