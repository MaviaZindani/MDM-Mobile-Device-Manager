import 'package:flutter/material.dart';

class AnimatedDrawerItem extends StatefulWidget {
  final int index;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  AnimatedDrawerItem({
    required this.icon,
    required this.title,
    required this.index,
    required this.onTap,
  });

  @override
  _AnimatedDrawerItemState createState() => _AnimatedDrawerItemState();
}

class _AnimatedDrawerItemState extends State<AnimatedDrawerItem> {
  double _offsetX = -200.0; // Initially off-screen left
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = true;
    });
    Future.delayed(Duration(milliseconds: 290), (){
      widget.onTap();
      Scaffold.of(context).closeDrawer();
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      setState(() {
        _offsetX = 0; // Slide in from left
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            left: _isSelected ? -50 : -600, // Slide white container in on tap
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(30)),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(_offsetX, 0, 0),
            child: ListTile(
              leading: Icon(widget.icon,
                  color: _isSelected ? Colors.black : Colors.white),
              title: Text(
                widget.title,
                style:
                    TextStyle(color: _isSelected ? Colors.black : Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}