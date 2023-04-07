import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PubWidget extends StatelessWidget {
  const PubWidget(
      {super.key, this.imageURL, this.text, required this.timestamp});
  final String? imageURL;
  final String? text;
  final Timestamp timestamp;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = timestamp.toDate();
    String formattedDateTime = DateFormat('dd/MM/yy - HH:mm').format(dateTime);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(formattedDateTime),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (text != null)
              Text(
                text!,
                style: TextStyle(),
                textAlign: TextAlign.start,
              ),
            const SizedBox(
              height: 10,
            ),
            if (imageURL != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageURL!,
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
