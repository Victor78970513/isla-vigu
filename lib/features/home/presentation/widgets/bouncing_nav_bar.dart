import 'package:flutter/material.dart';

class BouncingNavBar extends StatefulWidget {
  final List<Widget> items;
  final Color backgroundColor;
  final ValueChanged<int> onTapChanged;
  final int currentIndex;
  final double movement;
  const BouncingNavBar({
    super.key,
    required this.items,
    required this.backgroundColor,
    required this.onTapChanged,
    this.currentIndex = 0,
    this.movement = 90,
  });

  @override
  State<BouncingNavBar> createState() => _BouncingNavBarState();
}

class _BouncingNavBarState extends State<BouncingNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationNavBarIn;
  late Animation<double> animationNavBarOut;
  late Animation<double> animationCircleItem;
  late Animation<double> animationElevationIn;
  late Animation<double> animationElevationOut;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    //
    animationNavBarIn = CurveTween(
      curve: Interval(
        0.1,
        0.6,
        curve: Curves.decelerate,
      ),
    ).animate(controller);
    //
    animationNavBarOut = CurveTween(
      curve: Interval(
        0.6,
        1.0,
        curve: Curves.bounceOut,
      ),
    ).animate(controller);
    //
    animationCircleItem = CurveTween(
        curve: Interval(
      0.0,
      0.5,
    )).animate(controller);
    //
    animationElevationIn = CurveTween(
        curve: Interval(
      0.3,
      0.5,
      curve: Curves.decelerate,
    )).animate(controller);
    //
    animationElevationOut = CurveTween(
      curve: Interval(
        0.55,
        1.0,
        curve: Curves.bounceOut,
      ),
    ).animate(controller);
    controller.forward(from: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double currentWidht = width;
    double currentElevation = 0.0;
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, snapshot) {
            currentWidht = width -
                (widget.movement * animationNavBarIn.value) +
                (widget.movement * animationNavBarOut.value);
            currentElevation = -widget.movement * animationElevationIn.value +
                (widget.movement - kBottomNavigationBarHeight / 4) *
                    animationElevationOut.value;
            return Center(
              child: Container(
                height: kBottomNavigationBarHeight,
                width: currentWidht,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  border: Border(
                    top: BorderSide(color: Color(0xffF3F4F6)),
                    left: BorderSide(color: Color(0xffF3F4F6)),
                    right: BorderSide(color: Color(0xffF3F4F6)),
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    widget.items.length,
                    (index) {
                      final item = widget.items[index];
                      final child = Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                            top: BorderSide(
                              color: index == _currentIndex
                                  ? Color(0xffF3F4F6)
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: widget.backgroundColor,
                          radius: 30,
                          child: item,
                        ),
                      );
                      if (index == _currentIndex) {
                        return CustomPaint(
                          foregroundPainter: CircleItemPainter(
                            progress: animationCircleItem.value,
                          ),
                          child: Transform.translate(
                            offset: Offset(0, currentElevation),
                            child: child,
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                              widget.onTapChanged(index);
                              controller.forward(from: 0.0);
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: widget.backgroundColor,
                            radius: 30,
                            child: child,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class CircleItemPainter extends CustomPainter {
  final double progress;

  CircleItemPainter({super.repaint, required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = 20 * progress;
    final strokeWidth = 10.0;
    final currentStrokeWidth = strokeWidth * (1 - progress);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = currentStrokeWidth
      ..style = PaintingStyle.stroke;

    if (progress < 1) {
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
