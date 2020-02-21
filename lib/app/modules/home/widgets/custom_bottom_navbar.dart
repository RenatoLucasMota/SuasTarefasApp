import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  CustomBottomNavBar({Key key, this.onTap, this.currentIndex}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int _itemIndex = widget.currentIndex == null ? 0: widget.currentIndex;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipPath(
          clipper: _BottomAppBarClipper(
            geometry: Scaffold.geometryOf(context),
            notchMargin: 15,
            shape: CircularNotchedRectangle(),
          ),
          child: Container(
            height: 60,
            color: Color.fromARGB(255, 54, 54, 54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ButtomCustomAppBarItem(
                icon: Feather.home,
                index: 0,
                currentIndex: _itemIndex,
                onTap: () {
                  setState(() {
                    _itemIndex = 0;
                    widget.onTap(_itemIndex);
                  });
                },
              ),
              ButtomCustomAppBarItem(
                icon: Feather.check_square,
                index: 1,
                currentIndex: _itemIndex,
                onTap: () {
                  setState(() {
                    _itemIndex = 1;
                    widget.onTap(_itemIndex);
                  });
                },
              ),
              SizedBox(
                width: 60,
              ),
              ButtomCustomAppBarItem(
                icon: Feather.search,
                index: 2,
                currentIndex: _itemIndex,
                onTap: () {
                  setState(() {
                    _itemIndex = 2;
                    widget.onTap(_itemIndex);
                  });
                },
              ),
              ButtomCustomAppBarItem(
                icon: Feather.calendar,
                index: 3,
                currentIndex: _itemIndex,
                onTap: () {
                  setState(() {
                    _itemIndex = 3;
                    widget.onTap(_itemIndex);
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtomCustomAppBarItem extends StatelessWidget {
  final int index;
  final GestureTapCallback onTap;
  final IconData icon;
  final int currentIndex;
  ButtomCustomAppBarItem(
      {this.index, this.onTap, this.icon, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    Color _blue = Color.fromARGB(255, 78, 166, 231);
    Color _grey = Colors.grey[400];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        child: Icon(icon, color: index == currentIndex ? _blue : _grey),
      ),
    );
  }
}

class _BottomAppBarClipper extends CustomClipper<Path> {
  const _BottomAppBarClipper({
    @required this.geometry,
    @required this.shape,
    @required this.notchMargin,
  })  : assert(geometry != null),
        assert(shape != null),
        assert(notchMargin != null),
        super(reclip: geometry);

  final ValueListenable<ScaffoldGeometry> geometry;
  final NotchedShape shape;
  final double notchMargin;

  @override
  Path getClip(Size size) {
    final Rect button = geometry.value.floatingActionButtonArea?.translate(
      0.0,
      geometry.value.bottomNavigationBarTop * -1.0,
    );
    return shape.getOuterPath(Offset.zero & size, button?.inflate(notchMargin));
  }

  @override
  bool shouldReclip(_BottomAppBarClipper oldClipper) {
    return oldClipper.geometry != geometry ||
        oldClipper.shape != shape ||
        oldClipper.notchMargin != notchMargin;
  }
}
