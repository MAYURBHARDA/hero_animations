import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

//photo hero class
class Photo extends StatelessWidget {
  final String photo;
  final Color? color;
  final VoidCallback? onTap;

  const Photo({super.key, required this.photo, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          photo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  const RadialExpansion({super.key, required this.maxRadius, this.child})
      : clipRectExtent = 2.0 * (maxRadius / math.sqrt2);

  final double maxRadius;
  final double clipRectExtent;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectExtent,
          height: clipRectExtent,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  const RadialExpansionDemo({Key? key}) : super(key: key);
  static double kMinRadius = 32.0; // minimum radius
  static double kMaxRadius = 128.0; // maximum radius

  static Interval opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  // create new Screen
  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      alignment: FractionalOffset.center,
      child: SizedBox(
        width: kMaxRadius * 2.0,
        height: kMaxRadius * 2.0,
        child: Hero(
          createRectTween: _createRectTween,
          tag: imageName,
          child: RadialExpansion(
              maxRadius: kMaxRadius,
              child: Photo(
                  photo: imageName,
                  onTap: () {
                    Navigator.of(context).pop();
                  })),
        ),
      ),
    );
  }

  // create Radial Hero
  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return SizedBox(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
            maxRadius: kMaxRadius,
            child: Photo(
                photo: imageName,
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder<void>(
                      pageBuilder: (context, animation, secondaryAnimation) {
                    return AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: opacityCurve.transform(animation.value),
                            child: _buildPage(context, imageName, description),
                          );
                        });
                  }));
                })),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Radial Hero Animation Demo"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: FractionalOffset.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(context, 'assets/images/chair-alpha.png', 'Chair'),
            _buildHero(
                context,
                'assets/images/binoculars-alpha.png',
                'Binocu'
                    'lar'),
            _buildHero(
                context,
                'assets/images/beachball-alpha.png',
                'BeachBa'
                    'll')
          ],
        ),
      ),
    );
  }
}
