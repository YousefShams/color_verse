import 'package:color_verse/app/components/default_bottom_bar.dart';
import 'package:color_verse/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AppRoutes.getScreenFromRoute(AppRoutes.mainScreensRoutes[index])),
      bottomNavigationBar: DefaultBottomNavBar(currentIndex: index,
        onChange: (newIndex) { setState(() { index= newIndex; }); }, ),
    );
  }
}
