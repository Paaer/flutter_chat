import 'package:flutter/material.dart';
import 'package:flutter_chat/model.dart';
import 'package:flutter_chat/modelController.dart';
import 'package:provider/provider.dart';

class AddMessage extends StatefulWidget {
  AddMessage({Key? key}) : super(key: key);

  @override
  _AddMessageState createState() => _AddMessageState();
}

class _AddMessageState extends State<AddMessage> {
  final _formKey = GlobalKey<FormState>();

  Message _message = Message();

  @override
  Widget build(BuildContext context) {
    // Det her er totalt overkill!!
    // Vi kunne også bare bruge Provider.of<ModelController>(context, listen: false).add(message: _message)
    // i linie 35 herunder
    return Consumer<ModelController>(
        builder: (context, _modelController, widgets) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Opret besked'),
          actions: [
            IconButton(
                onPressed: () {
                  final _form = _formKey.currentState;
                  _form?.save();
                  _modelController.add(message: _message);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Afsender'),
                  onSaved: (afsender) {
                    setState(() {
                      _message.owner = afsender;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Besked'),
                  onSaved: (besked) {
                    setState(() {
                      _message.message = besked;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
