part of '../search_screen.dart';

Future<dynamic> _showFilterModal(
    BuildContext context, TextStyle defaultTextStyle) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Text(
                'Bộ lọc',
                style: defaultTextStyle.copyWith(fontSize: 20),
              ),
            ),
            Divider(
              height: 10,
            ),
            Text('Danh mục'),
            ListFilterWidget(
              list: categories,
              multipleSelect: false,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Hãng'),
            ListFilterWidget(
              list: brands,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Khoảng giá'),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: defaultTextStyle.copyWith(fontSize: 14),
                    decoration: _priceInputDecoration('Từ'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('-'),
                ),
                Expanded(
                  child: TextField(
                    style: defaultTextStyle.copyWith(fontSize: 14),
                    decoration: _priceInputDecoration('Đến'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('Sắp xếp theo'),
            ListFilterWidget(
              list: orderBy,
              multipleSelect: false,
            ),
            /* -------------- */
            Divider(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'Reset',
                        style: defaultTextStyle.copyWith(fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffE7E7E7),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print('Filter...');
                        context.pop();
                      },
                      child: Text(
                        'Lọc',
                        style: defaultTextStyle.copyWith(
                            fontSize: 15, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0A70B8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
