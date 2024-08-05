import 'package:flutter/material.dart';
import 'package:nina_digital/features/forgot_password/widgets/forgot_option_widget.dart';

class ForgotOptionListWidget extends StatefulWidget {
  const ForgotOptionListWidget({Key? key}) : super(key: key);

  @override
  State<ForgotOptionListWidget> createState() => _ForgotOptionListWidgetState();
}

class _ForgotOptionListWidgetState extends State<ForgotOptionListWidget> {
  int _selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ForgotOptionWidget(
            icon: 'sms.svg',
            title: 'SMS',
            desc: '+84 987***321',
            isChecked: _selectedOption == 0,
            onClick: () {
              setState(() {
                _selectedOption = 0;
              });
            },
          ),
          ForgotOptionWidget(
            icon: 'email.svg',
            title: 'Email',
            desc: 'huu*******@gmail.com',
            isChecked: _selectedOption == 1,
            onClick: () {
              setState(() {
                _selectedOption = 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
