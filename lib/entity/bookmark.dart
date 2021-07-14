import 'package:floor/floor.dart';
@entity
class Bookmark
{

  @primaryKey
  final int id;

  final int catId ;
  final int pageNo ;





  @ignore
  bool isSelect = false;

  Bookmark(this.id,this.catId, this.pageNo);

}