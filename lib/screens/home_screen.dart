import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_network/screens/create_pub_screen.dart';
import 'package:social_network/widgets/bottom_navigator_widget.dart';
import 'package:social_network/widgets/pub_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tela Inicial',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 5,
            ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('pubs')
                  .orderBy('date')
                  .snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  default:
                    if (snapshot.hasError) {
                      return const Center(
                        child:
                            Text('Ocorreu um erro ao carregar as publicações'),
                      );
                    } else {
                      List<DocumentSnapshot> documents =
                          snapshot.data!.docs.reversed.toList();

                      return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> item =
                              documents[index].data() as Map<String, dynamic>;
                          return PubWidget(
                            imageURL:
                                item.containsKey('img') ? item['img'] : null,
                            text:
                                item.containsKey('text') ? item['text'] : null,
                            timestamp: item['date'],
                            displayName: item['displayName'],
                            photoURL: item['photoURL'],
                            uid: item['uid'],
                          );
                        },
                      );
                    }
                }
              },
            )),
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
      bottomNavigationBar: BottomNavigatorWidget(
        index: 0,
      ),
    );
  }
}
