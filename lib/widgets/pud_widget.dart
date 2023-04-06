import 'package:flutter/material.dart';

class PubWidget extends StatelessWidget {
  const PubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://images.pexels.com/photos/14396021/pexels-photo-14396021.jpeg?auto=compress&cs=tinysrgb&w=600',
                    height: 50,
                    width: 50,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Usúario',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua 😊😊😊',
              style: TextStyle(),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://images.pexels.com/photos/2657669/pexels-photo-2657669.jpeg?auto=compress&cs=tinysrgb&w=600',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                    color: Colors.grey,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
