import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/models/mock_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'notification';
  static const String pathRoute = '/notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông báo',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: 20),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notifications[index]['date'].toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 15),
                  ),
                  Column(
                    children: notifications.map((item) {
                      final list = notifications[index]['list'] as List;
                      return ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: list.map((item) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(
                                      0,
                                      1,
                                    ),
                                  ),
                                ]),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(
                                list[index]['title'],
                                style: TextStyle(fontSize: 15),
                              ),
                              subtitle: Text(
                                list[index]['desc'],
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff686868)),
                              ),
                              leading: Container(
                                height: 60,
                                width: 60,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffEAF5FD)),
                                child: SvgPicture.asset(
                                    'assets/icons/${list[index]['icon']}'),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }).toList(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
