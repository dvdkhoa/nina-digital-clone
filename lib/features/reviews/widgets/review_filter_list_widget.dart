part of '../review_screen.dart';

class _ReviewFilterListWidget extends ConsumerStatefulWidget {
  final int productId;
  _ReviewFilterListWidget({Key? key, required this.productId}) : super(key: key);

  @override
  ConsumerState<_ReviewFilterListWidget> createState() =>
      _ReviewFilterListWidgetState();
}

class _ReviewFilterListWidgetState extends ConsumerState<_ReviewFilterListWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selected = 0;
                  ref.read(reviewFilterProvider(widget.productId).notifier).filterProduct(0);
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  'Tất cả',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                decoration: BoxDecoration(
                    color: selected == 0 ? Color.fromARGB(190, 187, 222, 251) : Colors.transparent,
                    border: Border.all(color: selected == 0 ? Colors.blue.shade300 : Colors.grey.shade600)),
              ),
            ),
            ...List.generate(5, (index) => index + 1).map(
              (item) {
                bool isSelected = selected == item;
                return InkWell(
                  onTap: () {
                    setState(() {
                      selected = item;
                      ref.read(reviewFilterProvider(widget.productId).notifier).filterProduct(selected);
                    });
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                        color: isSelected ? Color.fromARGB(190, 187, 222, 251) : Colors.transparent,
                        border:
                            Border.all(color: isSelected ? Colors.blue.shade300 : Colors.grey.shade600, width: 1)),
                  ),
                );
              },
            ).toList()
          ],
        ),
      ),
    );
  }
}
