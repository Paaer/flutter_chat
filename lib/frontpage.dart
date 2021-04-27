import 'package:flutter/material.dart';
import 'package:flutter_chat/model.dart';
import 'package:flutter_chat/modelController.dart';
import 'package:provider/provider.dart';

class Frontpage extends StatelessWidget {
  const Frontpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addMessage');
            },
            icon: const Icon(Icons.chat),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: const Icon(Icons.login),
          )
        ],
      ),
      body: Consumer<ModelController>(
          builder: (context, _modelController, widgets) {
        return ListView.builder(
            itemCount: _modelController.numberOfMessages,
            itemBuilder: (context, index) {
              Message message = _modelController.getMessage(index)!;
              return Text(' ${message.owner}: ' "${message.message} \n");
            });
      }),
    );
  }
}
