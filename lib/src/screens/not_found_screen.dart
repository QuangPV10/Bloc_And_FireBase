import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Center(
        child: Text(
          'Not Found Screen',
          textAlign: TextAlign.center,
          style: theme.textTheme.headline1,
        ),
      ),
    );
  }
}
