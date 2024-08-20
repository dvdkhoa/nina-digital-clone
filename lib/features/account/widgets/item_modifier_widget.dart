part of '../acount_screen.dart';

class _ItemModifier extends StatelessWidget {
  final String text;
  final Widget child;
  final Function? onClick;

  _ItemModifier({required this.text, required this.child, this.onClick});

  @override
  Widget build(BuildContext context) {
    final defautTextStyle = DefaultTextStyle.of(context).style;

    return InkWell(
      onTap: () {
        if (onClick != null) onClick!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: defautTextStyle.copyWith(fontFamily: 'UTM-Avo'),
            ),
            child
          ],
        ),
      ),
    );
  }
}
