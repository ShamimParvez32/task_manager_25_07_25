import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/ui/controllers/auth_controller.dart';
import 'package:task_manager_25_07_25/ui/screens/sign_in_screen.dart';
import 'package:task_manager_25_07_25/ui/screens/update_profile_screen.dart';
import 'package:task_manager_25_07_25/ui/utils/app_colors.dart';

class TMAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppbar({super.key, this.fromUpdateProfile = false});

  final bool fromUpdateProfile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: AppColors.themeColor,
      title: Row(
        children: [
          const CircleAvatar(radius: 16),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if(fromUpdateProfile== false){
                  Navigator.pushNamed(context, UpdateProfileScreen.name);

                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userModel?.fullName?? '',
                    style: textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                  Text(
                    AuthController.userModel?.email?? '',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () async{
            await AuthController.clearUserData();
            Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate) => false);
          }, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
