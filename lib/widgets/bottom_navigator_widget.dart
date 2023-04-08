import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/user_screen.dart';

class BottomNavigatorWidget extends StatelessWidget {
  const BottomNavigatorWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (index != 0) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
                icon: Icon(
                  Icons.home,
                  size: 24,
                  color: index == 0 ? Colors.white : Colors.lightBlue[100],
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              IconButton(
                onPressed: () {
                  if (index != 1) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => UserScreen(),
                      ),
                    );
                  }
                },
                icon: Icon(
                  Icons.person,
                  size: 24,
                  color: index == 1 ? Colors.white : Colors.lightBlue[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
