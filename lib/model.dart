import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';

class Message {
  String? id;
  String? message;
  String? owner;
  DateTime date = DateTime.now();

  GeoLocation location =
      GeoLocation(latitude: 56.119657, longtitude: 10.158651);

  Message({this.id, this.message, this.owner});

  factory Message.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()!;
    Timestamp t = data['date'];
    GeoPoint gp = data['location'];
    Message _message =
        Message(id: doc.id, message: data['message'], owner: data['owner']);
    _message.date = t.toDate();
    _message.location =
        GeoLocation(latitude: gp.latitude, longtitude: gp.longitude);
    return _message;
  }

  addLocation(LocationData locationData) {
    this.location = GeoLocation(
        latitude: locationData.latitude, longtitude: locationData.longitude);
  }

  toMap() {
    return {
      'message': this.message,
      'owner': this.owner,
      'date': this.date.toUtc(),
      'location': GeoPoint(
          this.location.latitude ?? 10, this.location.longtitude ?? 10)
    };
  }
}

class GeoLocation {
  final double? latitude;
  final double? longtitude;

  GeoLocation({this.latitude, this.longtitude});
}
