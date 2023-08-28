import 'package:flutter/material.dart';

class LoadingContentWidget extends StatelessWidget {
  const LoadingContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive()
        ],
      ),
    );
  }
}