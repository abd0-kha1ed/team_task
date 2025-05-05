import 'package:flutter/material.dart';
import 'package:team_task/feature/auth/presentation/view/widget/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
const SignInView({ super.key });
static const String routeName = '/signInView';
@override
Widget build(BuildContext context) {
return Scaffold(
body: SignInViewBody(),

);
}
}