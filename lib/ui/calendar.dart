import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.black,
        ),
        Column(
          children: [
            Container(
              color: Colors.green,
              height: 100,
            ),
            GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 6.0 / 9.0,
              children: [
                Image.asset('assets/1.jpg'),
                Image.asset('assets/2.jpg'),
                Image.asset('assets/1.jpg'),
                Image.asset('assets/2.jpg'),
                Image.asset('assets/1.jpg'),
                Image.asset('assets/2.jpg'),
                Image.asset('assets/1.jpg'),
                Image.asset('assets/2.jpg'),
                Image.asset('assets/1.jpg'),
                Image.asset('assets/2.jpg'),
                Image.asset('assets/1.jpg'),
                Image.asset('assets/3.jpg'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
