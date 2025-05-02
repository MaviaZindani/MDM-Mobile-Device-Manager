import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:appoint_it/utils/screen_helper.dart';
import 'package:appoint_it/generic_widgets/drawer/custom_drawer.dart';
import 'package:appoint_it/controller_view/main_screen_controller.dart';
import 'package:appoint_it/screens/main_screen/widgets/float_button.dart';
import 'package:appoint_it/screens/main_screen/widgets/home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenController mainScreenController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    mainScreenController = Get.put(MainScreenController());
    mainScreenController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = ScreenHelper.getScreenWidth(context);
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.start,
      appBar: AppBar(),
      drawerEdgeDragWidth: width * 0.5,
      drawer: CustomDrawer(),
      body: HomeScreen(),
      backgroundColor: Color(0xffF8EAFF),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.schedule_rounded, color: Colors.purple),
                onPressed: () {},
              ),
              SizedBox(width: 20), // Space for FAB
              IconButton(
                icon: Icon(Icons.keyboard_alt_rounded, color: Colors.purple),
                onPressed: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
