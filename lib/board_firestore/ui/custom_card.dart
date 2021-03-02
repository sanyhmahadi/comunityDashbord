import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  final snapshot;
  final int index;

  const CustomCard({Key key, this.snapshot, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var timeToDate = new DateTime.fromMillisecondsSinceEpoch(
        snapshot.docs[index].data()["timeState"].seconds * 1000);
    var dateFormat = DateFormat("EEEE,MMM d,y").format(timeToDate);
    return Column(
      children: [
        Container(
          height: 200,
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                ListTile(
                  title: Text(snapshot.docs[index].data()["name"].toString()),
                  subtitle: Text(snapshot.docs[index].data()["description"]),
                  leading: CircleAvatar(
                      radius: 35,
                      child: Text(
                          snapshot.docs[index].data()["name"].toString()[0])),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Msg By: ${snapshot.docs[index].data()["name"].toString()},",
                        style: TextStyle(color: Colors.red),
                      ),
                      Text("${dateFormat.toString()}",
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.edit,
                        size: 15,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.trashAlt,
                        size: 15,
                      ),
                      onPressed: () async {
                        await snapshot.docs[index].data().delete();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
