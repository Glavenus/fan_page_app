import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fan_page_app/login_screen.dart';
import 'package:fan_page_app/model/messages.dart';
import 'package:fan_page_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  User? message = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  Messages messages = Messages();
  final messageEditingController = TextEditingController();
  CollectionReference newMessage =
      FirebaseFirestore.instance.collection('messages');

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("${loggedInUser.role}"),
      ),
      floatingActionButton: ("${this.loggedInUser.role}") == "Admin"
          ? FloatingActionButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('New Post'),
                  actions: <Widget>[
                    TextFormField(
                      controller: messageEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        messageEditingController.text = value!;
                        messages.message = messageEditingController.text;
                      },
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Post Message'),
                      child: const Text('Post Message'),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.deepPurple,
              child: const Icon(Icons.add),
            )
          : Container(),
    );
  }
}
