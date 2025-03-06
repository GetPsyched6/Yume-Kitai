// Copyright 2025 (c) Roshin Nishad. All rights reserved.
// Use of this source code is governed by the Apache 2.0 License that can be
// found in the LICENSE file.
// Join and Version comment info below provided by the Flutter Team.

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import './db_schema.dart';

class LocalDataService {
  Database? _db;

  Future<Database> getDatabaseInstance() async {
    // Faster check to return singleInstance db if NOT null.
    if (_db != null) return _db!;

    _db = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'yume_database.db'),

      // When the database is first created, create the tables needed for Yume.
      onCreate: (db, version) async {
        // > **[Habits] data**
        // - Creating the habit table. [Contains each unique habit]
        await db.execute(
          DbSchema.habitTables['habit']!,
        );

        // - Creating the habit history table. [Contains the history of each habit on each date]
        await db.execute(
          DbSchema.habitTables['habit_history']!,
        );

        // - Creating the habit frequency table. [Contains info on when the habit repeats]
        await db.execute(
          DbSchema.habitTables['habit_freq']!,
        );

        // - Creating the habit reminder table. [Contains the reminder datetime for a habit]
        await db.execute(
          DbSchema.habitTables['habit_reminder']!,
        );

        // - Creating the habit goal table. [Contains info on the goals for a habit]
        await db.execute(
          DbSchema.habitTables['habit_goal']!,
        );

        // - Creating the habit conditionally active table. [Contains info on whether the habit should be active or not]
        await db.execute(
          DbSchema.habitTables['habit_conditionally_active']!,
        );

        // - Creating the habit streak table. [Contains the streak info for a habit]
        await db.execute(
          DbSchema.habitTables['habit_streak']!,
        );

        // - Creating the habit tag table. [Contains the tags info for a habit]
        await db.execute(
          DbSchema.habitTables['habit_tag']!,
        );

        // * --------------------------------------------------------------

        // > **[Chrono] data**
        // - Creating the chrono label table. [Contains each unique label]
        await db.execute(
          DbSchema.chronoTables['chrono_label']!,
        );

        // - Creating the chrono label history table. [Contains the history of each label]
        await db.execute(
          DbSchema.chronoTables['chrono_label_history']!,
        );

        // - Creating the chrono label reminder table. [Contains the reminder datetime for a label]
        await db.execute(
          DbSchema.chronoTables['chrono_label_reminder']!,
        );

        // - Creating the chrono label goal table. [Contains info on the goals for a label]
        await db.execute(
          DbSchema.chronoTables['chrono_label_goal']!,
        );

        // - Creating the chrono label autostart table. [Contains info on whether/when a label should autostart]
        await db.execute(
          DbSchema.chronoTables['chrono_label_autostart']!,
        );

        //TODO*: Remember to remove these

        await db.execute(
          "INSERT INTO habit (title, group_title, desc, color, icon, is_retired, is_negative, habit_conditionally_active_id, chrono_label_id) VALUES ('Do 15 Leetcode questions', 'Coding', 'Practice coding', 'FFA44195', 'f653', 0, 0, NULL, NULL);",
        );
        // await db.execute(
        //   "INSERT INTO habits (habit_title, habit_freq, habit_desc, habit_color, habit_icon) VALUES ('Run 5km a day', '4 times a week', 'Stay fit and healthy', 'FFC5605F', 'f6b8');",
        // );
        // await db.execute(
        //   "INSERT INTO habits (habit_title, habit_freq, habit_desc, habit_color, habit_icon) VALUES ('Drink Water', 'Everyday', 'At least 8 cups', 'FFC5BB5F', 'f86a');",
        // );
        // await db.execute(
        //   "INSERT INTO habits (habit_title, habit_freq, habit_desc, habit_color, habit_icon) VALUES ('Meditate 10 minutes', 'Daily', 'Relax and focus', 'FF4197A4', 'f0144');",
        // );
      },

      // Enabling foreign keys.
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },

      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    //When [singleInstance] is true (the default), a single database instance is returned
    // for a given path. Subsequent calls to [openDatabase] with the same path will return
    //the same instance, and will discard all other parameters such as callbacks for that invocation.
    return _db!;
  }
}
