import 'package:flutter/material.dart';
import 'package:vz_app/view/widgets/appbar_widget.dart';
import 'package:vz_app/view/widgets/bottom_appbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(
        scaffoldKey: scaffoldKey,
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
      endDrawer: const Drawer(),
    );
  }
}
