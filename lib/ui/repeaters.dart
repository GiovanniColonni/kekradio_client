import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kekradio_client/model/repeater_model.dart';
import 'package:kekradio_client/util/db_util.dart';

class Repeaters extends StatefulWidget {
  const Repeaters() : super();

  @override
  State<StatefulWidget> createState() => _RepeatersState();
}

class _RepeatersState extends State<Repeaters> {
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: listViewBuilder(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return snapshot.data;
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<ListView> listViewBuilder() async {
    List<RepeaterModel> kRepeaters = await DbUtil.repeaters();
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2 + 1;
        return _buildRow(kRepeaters[index - 1], index);
      },
      itemCount: kRepeaters.length * 2,
      padding: const EdgeInsets.all(16.0),
    );
  }

  Widget _buildRow(RepeaterModel repeater, int idx) {
    return ListTile(
      leading: CircleAvatar(child: Text(repeater.country)),
      title: Text(repeater.name),
      trailing: repeater.type == "FM" ? Icon(Icons.radio) : Icon(Icons.cloud),
      onTap: () {
        Navigator.push(context, _RepeaterDetails(repeater));
      },
    );
  }
}

class _RepeaterDetails extends MaterialPageRoute<Null> {
  _RepeaterDetails(RepeaterModel repeater)
      : super(builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(title: Text(repeater.name + " Details")),
              body: Center(
                child: ListView(children: <Widget>[
                  Text("ID: " + repeater.id.toString()),
                  Text("RX: " + repeater.rxFreq.toString()),
                  Text("TX: " +
                          (repeater.rxFreq + repeater.shift).toString()),
                  Text("Grid: " + repeater.grid),
                  Text("Type: " + repeater.type),
                ]),
              ));
        });
}
