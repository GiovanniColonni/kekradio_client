import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:kekradio_client/model/repeater_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';


class DbUtil {
  static String url = 'https://db.infokek.tk/repeaters.db';

  static init() async {
  }
  // A method that retrieves all the dogs from the dogs table.
  static Future<List<RepeaterModel>> repeaters() async {
    // Get a reference to the database.

    var file = await DefaultCacheManager().getSingleFile(url);

    final Future<Database> database = openDatabase(file.path);

    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('repeaters');

    return List.generate(maps.length, (i) {
      return RepeaterModel.fromMap(maps[i]);
    });
  }
}