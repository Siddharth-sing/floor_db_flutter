import 'package:floor/floor.dart';
import 'package:structure/entity/bookmark.dart';


  @dao
  abstract class BookmarkDao {

  @insert
  Future<void> insertBookmark(Bookmark bookmark);

  @delete
  Future<void> deleteBookmark(Bookmark bookmark);

  @Query('SELECT * FROM Bookmark')
  Future<List<Bookmark>> findAllBookmark();




}