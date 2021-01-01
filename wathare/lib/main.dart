import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wathare/provider/recents.dart';
import 'package:wathare/screens/classes_screen.dart';
import 'package:wathare/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(
                  value: Recents(),
                ),
              ],
              child: MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: ClassesScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
