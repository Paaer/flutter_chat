import 'package:flutter/material.dart';
import 'package:flutter_chat/databaseService.dart';
import 'package:flutter_chat/locationService.dart';
import 'package:flutter_chat/model.dart';

class ModelController extends ChangeNotifier {
  List<Message?> _messages = [];

  final DatabaseService _dbService = DatabaseService();
  final LocationService _locationService = LocationService();

  ModelController() {
    _dbService.chatStream().listen((snapshot) {
      _messages.clear();
      snapshot.docs.forEach((message) {
        _messages.add(Message.fromFirestore(message));
      });
      notifyListeners();
    });
  }

  int get numberOfMessages {
    return _messages.length = 0;
  }

  Message? getMessage(int index) {
    return _messages[index];
  }

  add({Message? message}) async {
    var locationData = await _locationService.getLocation();
    if (locationData != null) {
      message?.addLocation(locationData);
    }
    _messages.add(message);
    _dbService.add(message: message);
    notifyListeners();
  }

  //TODO: delete - HUSK delete i dbService
}
