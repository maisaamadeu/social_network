import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_network/utils/authentication.dart';

import '../utils/user_mobx.dart';
import '../widgets/bottom_navigator_widget.dart';
import '../widgets/google_sign_in_button_widget.dart';
import 'create_pub_screen.dart';

class UserScreen extends StatefulWidget {
  UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print(_auth.currentUser);
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
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                _auth.currentUser != null
                    ? _auth.currentUser!.photoURL!
                    : 'https://images.pexels.com/photos/14396021/pexels-photo-14396021.jpeg?auto=compress&cs=tinysrgb&w=600',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _auth.currentUser != null
                  ? _auth.currentUser!.displayName!
                  : 'Faça login',
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
            _auth.currentUser != null
                ? SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Authentication.signOut(context: context);
                        setState(() {});
                      },
                      child: Text('Sair'),
                    ),
                  )
                : GoogleSignInButtonWidget(
                    restarState: () {
                      setState(() {});
                    },
                  ),
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
