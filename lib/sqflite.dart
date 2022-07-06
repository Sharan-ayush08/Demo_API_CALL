import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        icao TEXT,
        iata TEXT,
        name TEXT,
        // societyname TEXT,
        // ownername TEXT,
        // ownercontact TEXT,
        // resname TEXT,
        // resage TEXT,
        // resgender TEXT,
        // rescontact TEXT,
        // resoccupation TEXT,
        // resrelation TEXT,
        // rescast TEXT,
        // resreligion TEXT,
        // noofresd TEXT,
        // landlen TEXT,
        // landwidth TEXT,
        // landarea TEXT,
        // constusage TEXT,
        // consttype TEXT,
        // constyear TEXT,
        // houselen TEXT,
        // housewidth TEXT,
        // housearea TEXT
        )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'kindacode.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
    String icao,
    iata,
    name,
    // societyname,
    // ownername,
    // ownercontact,
    // resname,
    // resage,
    // resgender,
    // rescontact,
    // resoccupation,
    // resrelation,
    // rescast,
    // resreligion,
    // noofresd,
    // landlen,
    // landwidth,
    // landarea,
    // constusage,
    // consttype,
    // constyear,
    // houselen,
    // housewidth,
    // housearea,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'icao': icao,
      'iata': iata,
      'name': name,
      // 'societyname': societyname,
      // 'ownername': ownername,
      // 'ownercontact': ownercontact,
      // 'resname': resname,
      // 'resage': resage,
      // 'resgender': resgender,
      // 'rescontact': rescontact,
      // 'resoccupation': resoccupation,
      // 'resrelation': resrelation,
      // 'rescast': rescast,
      // 'resreligion': resreligion,
      // 'noofresd': noofresd,
      // 'landlen': landlen,
      // 'landwidth': landwidth,
      // 'landarea': landarea,
      // 'constusage': constusage,
      // 'consttype': consttype,
      // 'constyear': constyear,
      // 'houselen': houselen,
      // 'housewidth': housewidth,
      // 'housearea': housearea,
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }
}
