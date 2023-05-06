import 'package:flutter/material.dart';
import 'package:h_bus/data/models/1user_model.dart';
import 'package:h_bus/presentation/screens/1Splash_Screen/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:h_bus/presentation/screens/2register_Screen/register_view.dart';
import 'package:h_bus/presentation/screens/3wait_screen/wait_view.dart';
import 'package:h_bus/presentation/screens/4Bus_Screen/bus_view.dart';
import 'package:h_bus/shared/components/constants.dart';
import 'package:h_bus/shared/network/local/cache_helper.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Hive.initFlutter();
  Widget widget;
  Hive.registerAdapter(UsersModelAdapter());
  await Hive.openBox<UsersModel>(kUsersBox);

  var userstate = CacheHelper.getData(key: 'state');
  print(userstate.toString());

  List<UsersModel>? notes;
  var notesBox = await Hive.box<UsersModel>(kUsersBox);
  notes = notesBox.values.toList();
  print(notes.length);

  if (userstate == true) {
    widget = Bus_View(
      usersModel: notes[0],
    );
  } else if (notes.length > 0) {
    widget = Wait_View(
      usersModel: notes[0],
    );
  } else {
    widget = register_view();
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({
    required this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(
        startWidget: startWidget,
      ),
      // home: Wait_View()
    );
  }
}
