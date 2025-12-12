import "package:sqflite/sqflite.dart";

Future<Database> openDB() async {
  return openDatabase(
    "db.sqlite",
    onCreate: (db, version) async {
      if (version <= 1) {
        await db.execute('''
          CREATE TABLE NOTES (
            id         INTEGER PRIMARY KEY AUTOINCREMENT,
            title      TEXT NOT NULL,
            created_at INTEGER NOT NULL
          )
        ''');
      }
    },
    version: 1,
  );
}