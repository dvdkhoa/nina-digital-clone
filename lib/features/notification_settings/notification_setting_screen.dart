import 'package:flutter/material.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);

  static const String nameRoute = "notification-settings";
  static const String pathRoute = "/notification-settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông báo'),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: const Column(
          children: [
            _NotificationSettingItemWidget(
              title: 'Thông báo chung',
              isChecked: true,
            ),
            _NotificationSettingItemWidget(
              title: 'Âm thanh',
              isChecked: true,
            ),
            _NotificationSettingItemWidget(
              title: 'Rung',
            ),
            _NotificationSettingItemWidget(
              title: 'Đề nghị đặc biệt',
              isChecked: true,
            ),
            _NotificationSettingItemWidget(
              title: 'Khuyến mãi & giảm giá',
            ),
            _NotificationSettingItemWidget(title: 'Thanh toán'),
            _NotificationSettingItemWidget(title: 'Cập nhật App')
          ],
        )),
      ),
    );
  }
}

class _NotificationSettingItemWidget extends StatelessWidget {
  final String title;
  final bool isChecked;

  const _NotificationSettingItemWidget(
      {super.key, required this.title, this.isChecked = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          SizedBox(
            height: 30,
            width: 40,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Switch.adaptive(
                  inactiveTrackColor: Colors.grey.shade200,
                  inactiveThumbColor: Colors.white,
                  value: isChecked,
                  onChanged: (value) {}),
            ),
          ),
        ],
      ),
    );
  }
}
