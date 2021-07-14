import 'package:floor/floor.dart';
import 'package:structure/Dao/bookmarkDAO.dart';
import 'package:structure/entity/bookmark.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';



@Database(version: 1, entities: [Bookmark])
abstract class AppDatabase extends FloorDatabase {
BookmarkDao get bookmarkDao;
}