import 'package:flutter/material.dart';
import 'package:structure/Dao/bookmarkDAO.dart';
import 'package:structure/entity/bookmark.dart';

import 'database/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase.databaseBuilder('pecis_database.db').build();
  final dao = database.bookmarkDao;

  runApp(MyApp(dao:dao));

}
class MyApp extends StatelessWidget {
  final BookmarkDao dao;

  MyApp({this.dao});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page',dao:dao),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.dao}) : super(key: key);

  final BookmarkDao dao;

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<Bookmark> result = [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Precis'),
        actions: [
          IconButton(icon: Icon(Icons.add),
              onPressed:() async{


            final bookmark = Bookmark(7,10,38);


            await widget.dao.insertBookmark(bookmark);

          }),
          IconButton(icon: Icon(Icons.stacked_line_chart_sharp), onPressed:() async {

                  result = await widget.dao.findAllBookmark();

          }),
          IconButton(icon: Icon(Icons.get_app), onPressed:() async {

            for(int i=0; i<result.length;i++)
              {
                print(result[i].id);
                print(result[i].catId);
                print(result[i].pageNo);
                print('');
              }

          })
        ],
      ),

    );
  }
}
