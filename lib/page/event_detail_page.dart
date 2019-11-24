import 'package:flutter/cupertino.dart';
import "package:dokode_flutter/repository/event_repository.dart";
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailPage extends StatelessWidget {
  EventRepository event;

  EventDetailPage(EventRepository event) {
    this.event = event;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(event.name),
        ),
        body: Column(children: <Widget>[
          FlatButton(
              onPressed: () {
                _launchURL(event.url);
              },
              child: Container(child: Text(event.name))),
          Image.network(
            event.thumbnailLarge,
          ),
          ListTile(
            title: Text(event.displayStartAt),
            subtitle: Text(event.venueName),
          ),
          ListTile(
            title: Text(event.organizer != null ? event.organizer : '情報なし'),
            subtitle: Text(event.organizerAffiliation != null
                ? event.organizerAffiliation
                : '情報なし'),
          ),
        ]));
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
