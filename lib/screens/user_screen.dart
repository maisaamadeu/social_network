import 'package:flutter/material.dart';

import '../widgets/bottom_navigator_widget.dart';
import 'create_pub_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreatePubScreen(),
          ),
        ),
        child: const Icon(
          Icons.create,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigatorWidget(
        index: 1,
      ),
    );
  }
}
