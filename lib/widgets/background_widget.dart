import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFd8e8e8),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF08f4dc).withOpacity(0.35),
                backgroundBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: 50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF08f4dc).withOpacity(0.35),
                backgroundBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
