import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ModalProgressWidget extends StatelessWidget {
  const ModalProgressWidget({
    super.key,
    required this.isLoading,
    required this.child,
  });
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      opacity: 0.5,

      progressIndicator: const CircularProgressIndicator(),
      child: child,
    );
  }
}
