part of '../review_screen.dart';

class _ReviewSectionWidget extends StatelessWidget {
  const _ReviewSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _ReviewItemWidget();
        },
        separatorBuilder: (context, index) => Divider(
              height: 20,
            ),
        itemCount: 5);
  }
}
