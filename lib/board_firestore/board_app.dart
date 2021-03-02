import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earthquake_app/board_firestore/ui/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoardApp extends StatefulWidget {
  @override
  _BoardAppState createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {
  final firestoreDb = FirebaseFirestore.instance.collection("board");
  TextEditingController nameInputController;
  TextEditingController titleInputController;
  TextEditingController descriptionInputController;

  @override
  @override
  void initState() {
    super.initState();
    nameInputController = TextEditingController();
    titleInputController = TextEditingController();
    descriptionInputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Commmunity Board App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        child: Icon(FontAwesomeIcons.pen),
      ),
      body: StreamBuilder(
        //future: FirebaseFirestore.initializeApp(),
        stream: firestoreDb.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, int index) {
              return CustomCard(snapshot: snapshot.data, index: index);
              //return Text(snapshot.data.docs[index]['description']);
            },
          );
        },
      ),
    );
  }

  _showDialog(BuildContext context) async {
    await showDialog(
        context: context,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Column(
            children: [
              Text("Please Fill the form."),
              Expanded(
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  decoration: InputDecoration(labelText: "Your Name"),
                  controller: nameInputController,
                ),
              ),
              Expanded(
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  decoration: InputDecoration(labelText: "*Title*"),
                  controller: titleInputController,
                ),
              ),
              Expanded(
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  decoration: InputDecoration(labelText: "*Discription*"),
                  controller: descriptionInputController,
                ),
              )
            ],
          ),
          actions: [
            RaisedButton(
              onPressed: () {
                nameInputController.clear();
                titleInputController.clear();
                descriptionInputController.clear();
                Navigator.pop(context);
              },
              child: Text("Cancel"),
              color: Colors.red,
            ),
            RaisedButton(
              onPressed: () {
                if (nameInputController.text.isNotEmpty &&
                    titleInputController.text.isNotEmpty &&
                    descriptionInputController.text.isNotEmpty) {
                  FirebaseFirestore.instance.collection("board").add({
                    "name": nameInputController.text,
                    "title": titleInputController.text,
                    "description": descriptionInputController.text,
                    "timeState": new DateTime.now(),
                  }).then((response) {
                    print(response.id);
                    Navigator.pop(context);
                    nameInputController.clear();
                    titleInputController.clear();
                    descriptionInputController.clear();
                  }).catchError((error) => print("Error"));
                }
              },
              child: Text("Save"),
              color: Colors.green,
            ),
          ],
        ));
  }
}
