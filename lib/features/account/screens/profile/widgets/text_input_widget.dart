part of '../profile_screen.dart';

class _TextInputWidget extends StatelessWidget {
  final String? initValue;
  final Widget? icon;
  final Function onChange;
  final TextEditingController? controller;
  final String? hintText;

  _TextInputWidget(
      {this.initValue, this.icon, required this.onChange, this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        initialValue: initValue,
        onChanged: (value) {
          onChange(value);
        },
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 13),
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: this.icon != null ? this.icon : null,
            filled: true,
            fillColor: const Color(0xFFF4F4F4),
            errorBorder: _errorInputBorder,
            focusedBorder: _normalInputBorder,
            enabledBorder: _enableInputBorder,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
      ),
    );
  }
}

const _normalInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent),
    borderRadius: BorderRadius.all(Radius.circular(14)));

const _enableInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(14)));

const _errorInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.redAccent),
  borderRadius: BorderRadius.all(
    Radius.circular(14),
  ),
);
