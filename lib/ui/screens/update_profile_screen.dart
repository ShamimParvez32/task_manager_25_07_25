import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/ui/widgets/screen_background.dart';
import 'package:task_manager_25_07_25/ui/widgets/tm_appBar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
static const String name='/update-profile';
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(

      appBar: TMAppbar(
        fromUpdateProfile: true,
      ),

      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: _buildFormProfile(textTheme),
          ),
        ),
      ),
    );
  }

  Widget _buildFormProfile(TextTheme textTheme) {
    return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text('Update Profile', style: textTheme.titleLarge),
                const SizedBox(height: 24),
                _buildPhotoPicker(),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First Name'),
                ), const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                ), const SizedBox(height: 8),
                TextFormField(
                  controller: _mobileTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Mobile'),
                ), const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
          );
  }




  Widget _buildPhotoPicker() {
    return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)
                          )
                        ),
                        alignment: Alignment.center,
                        child: const Text('Photo',style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(width: 12),
                      const Text('No item selected',maxLines: 1,)
                    ],
                  ),
                );
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
