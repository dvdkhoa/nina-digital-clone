part of '../profile_screen.dart';

class GenderWidget extends StatelessWidget {
  final int gender;
  final Function onChangeGender;
  const GenderWidget({super.key, required this.gender, required this.onChangeGender});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField(
        value: gender,
        style: DefaultTextStyle.of(context)
            .style
            .copyWith(fontSize: 13),
        items: const [
          DropdownMenuItem(
            child: Text(
              'Giới tính',
            ),
            value: -1,
          ),
          DropdownMenuItem(
            child: Text(
              'Nữ',
            ),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text(
              'Nam',
            ),
            value: 1,
          ),
        ],
        onChanged: (value) {
          onChangeGender(value);
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color(0xFFF4F4F4),
          errorBorder: _errorInputBorder,
          focusedBorder: _normalInputBorder,
          enabledBorder: _enableInputBorder,
          contentPadding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
        ),
      ),
    );
  }
}
