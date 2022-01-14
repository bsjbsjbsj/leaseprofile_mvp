import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '홍길동님의 바디프로필 일정',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '스튜디오 촬영까지 35일 남았어요!',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 30),
          Card(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '01.26',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'D-20',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '태닝',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '07:00 ~ 08:00',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '준비사항 : 하루 전 금식, 신분증',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '01.31',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'D-35',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '스튜디오 촬영',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '12:00 ~ 16:00',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '준비사항 : 하루 전 충분한 휴식, 의상, 소품',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
