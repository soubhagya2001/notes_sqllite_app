import 'package:flutter/material.dart';
import 'package:notes_sqllite/db_handler.dart';
import 'package:notes_sqllite/notes.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    // TODO: implement initState
    dbHelper = DBHelper();
    super.initState();
    loadData();
  }

  loadData () async{
    notesList = dbHelper!.getNotesList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTES-sqllite'),
        centerTitle: true,
      ),
      body: const Column(
        children: [

        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
          dbHelper?.insert(
              NotesModel(
                  title: 'First Note',
                  age: 22,
                  description: 'This is my first sql app',
                  email: 'soubhagyaprusty@gmail.com')).then((value){
                    print('data added');
          }).onError((error, stackTrace){
            print(error.toString());
          });
      },
      child: Icon(Icons.add),),
    );
  }
}
