import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  Color c1 = Colors.white;
  Color c2 = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TweenAnimation',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            // Using TweenAnimationBuilder
            TweenAnimationBuilder(
                tween: ColorTween(begin: c1, end: c2),
                duration: Duration(seconds: 1),
              builder: (_, Color, __) {
                return ColorFiltered(
                  child: Image.asset(
                    'assets/images/bird.png',
                    height: 180,
                  ),
                  colorFilter: ColorFilter.mode(Colors.yellowAccent, BlendMode.modulate),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),

            // button
            RaisedButton(
              onPressed: () {
                setState(() {
                  c1 = c1 == Colors.white ? Colors.yellow : Colors.white;
                  c2 = c2 == Colors.yellow ? Colors.white : Colors.yellow;
                });
              },
              child: Text('Change Color'),
            )
          ],
        ),
      ),
    );
  }
}
