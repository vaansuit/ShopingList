import 'package:flutter/material.dart';

class UserImageButton extends StatelessWidget {
  const UserImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        //TODO refatorar, criar variaveis para Theme e colorScheme

        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Text('V'),
      ),
    );
  }
}
