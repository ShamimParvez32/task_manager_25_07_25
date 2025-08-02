import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/data/services/network_caller.dart';
import 'package:task_manager_25_07_25/data/utils/urls.dart';
import 'package:task_manager_25_07_25/ui/utils/app_colors.dart';
import 'package:task_manager_25_07_25/ui/widgets/center_circular_progress_indecator.dart';
import 'package:task_manager_25_07_25/ui/widgets/screen_background.dart';
import 'package:task_manager_25_07_25/ui/widgets/showSnackBarMessage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool signUpInProgress = false;



  @override
  Widget build(BuildContext context) {
     final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text('Join With Us', style: textTheme.titleLarge),
                  const SizedBox(height: 24),
                  TextFormField(
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter your email';
                      }
                        else {
                          return null;
                      }
                    },
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter your firstName';
                      }
                      else {
                        return null;
                      }
                    },
                    controller: _firstNameTEController,
                    decoration: const InputDecoration(hintText: 'First Name'),
                  ), const SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter your lastName';
                      }
                      else {
                        return null;
                      }
                    },
                    controller: _lastNameTEController,
                    decoration: const InputDecoration(hintText: 'Last Name'),
                  ), const SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter your mobile';
                      }
                      else {
                        return null;
                      }
                    },
                    controller: _mobileTEController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Mobile'),
                  ), const SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter your password';
                      }
                      else {
                        return null;
                      }
                    },
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                    visible: signUpInProgress == false,
                    replacement: const CenterCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTabSignUpButton,

                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child:
                        _buildSignInSection()
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
   void _onTabSignUpButton(){
    if(_formKey.currentState!.validate()){
      _registerUser();
    }
   }

   Future<void> _registerUser()async{
    signUpInProgress =true;
    setState(() {});
    
    Map<String, dynamic> requestBody={
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _mobileTEController.text.trim(),
      "photo": ""
    };
    
    final NetworkResponse response = await NetworkCaller.postRequest(url: Urls.registrationUrl,body: requestBody);
    signUpInProgress=false;
    setState(() {});
    if(response.isSuccess){
      _clearTextField();
     showSnackBarMessage(context, 'New User registration successful');
    }
    else{ showSnackBarMessage(context, response.errorMessage);}
   }


  Widget _buildSignInSection() {
    return RichText(
      text: TextSpan(
        text: "Already have an account ?",
        style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w400),
        children: [
          TextSpan(
              text: '   Sign In',
              style: const TextStyle(
                color: AppColors.themeColor,
              ),
              recognizer: TapGestureRecognizer()..onTap=(){
                Navigator.pop(context);
              }
          )
        ],
      ),
    );
  }


void _clearTextField(){
  _emailTEController.clear();
  _passwordTEController.clear();
  _firstNameTEController.clear();
  _lastNameTEController.clear();
  _mobileTEController.clear();

}



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();


  }

}
