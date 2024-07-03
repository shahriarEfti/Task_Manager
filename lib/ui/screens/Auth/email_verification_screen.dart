import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/screens/auth/pin_verification_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';



class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  bool _otpSendInProgress = false;

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
                  const SizedBox(height: 100),
                  Text(
                    'Your Email Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 6 digits verification pin will be sent to your email address',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 16),
                  _otpSendInProgress
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : ElevatedButton(
                    onPressed: _onTapConfirmButton,
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(height: 36),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                        text: "Haven't an account? ",
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: const TextStyle(color: AppColors.themeColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _onTapConfirmButton() {
    _sendOtp();
  }

  Future<void> _sendOtp() async {
    _otpSendInProgress = true;
    if (mounted) {
      setState(() {});
    }

    String email = _emailTEController.text.trim();

    NetworkResponse response = await NetworkCaller.getRequest(
      "${Urls.recoverVerifyEmail}/$email",
    );

    _otpSendInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.responseData['status'] == 'success') {
      _clearTextField();
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PinVerificationScreen(email: email),
          ),
        );
      }
    } else if (response.responseData['status'] == 'fail') {
      if (mounted) {
        _showDialog(
          "Failed!",
          "This email is not registered!",
          Icons.error_outline_rounded,
        );
      }
    } else {
      if (mounted) {
        _showDialog(
          "Failed!",
          "Something went wrong!",
          Icons.task_alt,
        );
      }
    }
  }

  void _clearTextField() {
    _emailTEController.clear();
  }

  void _showDialog(String title, String message, IconData icon) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}

