import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  String? email;
  String? password;

  ChatScreen({
    required
    this.email,
    this.password,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Instance (FireStore)
  final fireStore = FirebaseFirestore.instance;

  final String collectionName = 'chat';

  TextEditingController msgController = TextEditingController();

  addMsg() {
    fireStore.collection(collectionName).add({
      'msg': msgController.text,
      'senderID': widget.email,
    });
    msgController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStore.collection(collectionName).snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? chatBody(snapshot.data)
              : snapshot.hasError
              ? Text('ERROR')
              : Center(

            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget chatBody(dynamic data) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount: data.docs.length,
              reverse: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Align(
                      alignment: widget.email == data.docs[index]['senderID']
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(data.docs[index]['msg'] ?? ''),
                    ),
                    Text(DateFormat('KK:MM').format(DateTime.now()))
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      controller: msgController,
                      decoration: InputDecoration(
                        label: Text('Enter your Message'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          addMsg();
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
