import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudScreen extends StatefulWidget {
  @override
  _CrudScreenState createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _newController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase CRUD'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _oldController,
              decoration: InputDecoration(
                labelText: 'Old Data',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _newController,
              decoration: InputDecoration(
                labelText: 'New Data',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _updateFirestore();
                },
                child: Text('Update'),
              ),
              ElevatedButton(
                onPressed: () {
                  _addToFirestore();
                },
                child: Text('Add'),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('data').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document =
                        snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
                    return ListTile(
                      title: Text(document['text']),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteFromFirestore(document.id);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addToFirestore() {
    _firestore.collection('data').add({
      'text': _newController.text,
    }).then((_) {
      setState(() {
        _newController.clear();
        _oldController.clear();
      });
    });
  }

  void _updateFirestore() {
    String oldData = _oldController.text;
    String newData = _newController.text;

    if (oldData.isNotEmpty && newData.isNotEmpty) {
      _firestore
          .collection('data')
          .where('text', isEqualTo: oldData)
          .get()
          .then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'text': newData}).then((_) {
              setState(() {
                _newController.clear();
                _oldController.clear();
              });
            });
          });
        } else {
          // Document doesn't exist
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Old data does not exist.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      });
    } else {
      // Show error if any of the fields is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please provide both old and new data.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _deleteFromFirestore(String documentId) {
    _firestore.collection('data').doc(documentId).delete();
  }
}
