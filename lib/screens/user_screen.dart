import 'package:flutter/material.dart';

import '../widgets/bottom_navigator_widget.dart';
import '../widgets/google_sign_in_button_widget.dart';
import 'create_pub_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/14396021/pexels-photo-14396021.jpeg?auto=compress&cs=tinysrgb&w=600',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Faça login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            GoogleSignInButtonWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreatePubScreen(),
          ),
        ),
        child: Icon(
          Icons.create,
          color: Colors.lightBlue[100],
        ),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigatorWidget(
        index: 1,
      ),
    );
  }
}
