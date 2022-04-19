import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Container(
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() => Container(
    alignment: Alignment.center,
    child: Card(
      child:
      Image.asset(
        'assets/images/man1.jpg',        fit: BoxFit.fill,
      ),
    ),
);
}