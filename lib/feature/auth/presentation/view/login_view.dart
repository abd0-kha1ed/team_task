import 'package:flutter/material.dart';
import 'package:team_task/feature/auth/presentation/view/login_view_body.dart';

class LoginView extends StatelessWidget {
const LoginView({ super.key });
static const String routeName = '/loginView';
@override
Widget build(BuildContext context) {
return Scaffold(
body: LoginViewBody(),

);
}
}