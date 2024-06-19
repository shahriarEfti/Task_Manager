import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';
import 'package:task_manager/ui/widgets/profile_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final TextEditingController _emailTEController= TextEditingController();
  final TextEditingController _passwordTEController= TextEditingController();
  final TextEditingController _firstnameTEController= TextEditingController();
  final TextEditingController _lastnameTEController= TextEditingController();
  final TextEditingController _mobileTEController= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(context, true),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 48,),
                  Text(
                    "Update Profile",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16,),
                  _buildPhotoPickerWidget(),
                        
                  const SizedBox(height: 16,),
                        
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
                    controller: _firstnameTEController,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                        
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                  controller: _lastnameTEController,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                        
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _mobileTEController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                        
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
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.arrow_circle_right_outlined),
                        
                        
                        
                    ),
                        
                        
                        
                  ),
                  SizedBox(height: 16),
                        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 Widget _buildPhotoPickerWidget() {
    return Container(
              width: double.maxFinite,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              alignment: Alignment.centerLeft,
              child: Container(
                width: 100,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: Colors.grey,
                ),
                alignment: Alignment.center,
                child: Text("Photo",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16,
                ),),
              ),
            );
  }

}
