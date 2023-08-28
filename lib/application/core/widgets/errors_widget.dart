import 'package:flutter/material.dart';

class ShowErrorAppWidget extends StatelessWidget {

  final String errorMessage; 
  
  const ShowErrorAppWidget({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.onPrimary,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50,
          ),
          const SizedBox(height: 15,),
          Flexible(
            child:  Text(errorMessage, style: const TextStyle(
              fontSize: 18
             ),),
          )
        ],
      ),
    );
  }
}
