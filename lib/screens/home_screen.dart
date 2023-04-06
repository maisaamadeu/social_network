import 'package:flutter/material.dart';
import 'package:social_network/screens/create_pub_screen.dart';
import 'package:social_network/widgets/pud_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Social',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.login,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
          ),
          child: ListView(
            children: [
              PubWidget(),
              PubWidget(),
              PubWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatePubScreen(),
          ),
        ),
        child: const Icon(
          Icons.create,
        ),
      ),
    );
  }
}
