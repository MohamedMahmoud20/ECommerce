// ignore_for_file: non_constant_identifier_names, file_names, avoid_print
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQFLITE{

  static Database? db ;

  Future<Database?>  get _db async{
    if(db==null){
      db= await IntialDb();
      return db;
    }
    else {
      return db;
    }
  }


  IntialDb() async{
    String dbpath= await getDatabasesPath();
    String path= join(dbpath , "Todo.db");
    var MyDb= openDatabase(path,onCreate: _OnCreate, version: 3, onUpgrade: _onUpgrade);
    return MyDb;
  }
  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async{
    print("UPGRADE============================");
  }

  Future _OnCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE "Todo" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "name" TEXT NOT NULL,
    "des" TEXT,
    "Image" TEXT,
    "price" double
    )
 ''');
    print("Created Table =====================================");
  }

  Select (String sql) async{
    Database? mydb = await _db;
    var response=await mydb?.rawQuery(sql);
    return response;
  }

  Insert (String sql) async{
    Database? mydb = await _db;
    int? response= await mydb?.rawInsert(sql);
    return response;
  }

  Delete (String sql) async{
    Database? mydb = await _db;
    int? response= await mydb?.rawDelete(sql);
    return response;

  }

  Update (String sql) async{
    Database? mydb = await _db;
    int? response= await mydb?.rawUpdate(sql);
    return response;
  }

  Deletell() async{
    String dbpath= await getDatabasesPath();
    String path= join(dbpath , "Todo.db");
    await deleteDatabase(path);
  }
}