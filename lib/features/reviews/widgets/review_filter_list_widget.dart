part of '../review_screen.dart';

class _ReviewFilterListWidget extends StatelessWidget {
  const _ReviewFilterListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                'Tất cả',
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(190, 187, 222, 251),
                  border: Border.all(color: Colors.blue.shade300)),
            ),
            ...starFilters(),
          ],
        ),
      ),
    );
  }
}

List<Widget> starFilters() {
  return List.generate(5, (index) => index + 1)
      .map(
        (item) => Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            children: [
              icons.StarSolid(
                color: const Color(0xffFFC833),
                height: 16,
              ),
              SizedBox(
                width: 5,
              ),
              Text('$item', style: TextStyle(fontSize: 12)),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey.shade600, width: 1)),
        ),
      )
      .toList();
}
