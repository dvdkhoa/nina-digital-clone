part of '../product_detail_screen.dart';

class _ReviewSectionWidget extends ConsumerWidget with UiMixins {
  final dynamic productId;
  const _ReviewSectionWidget({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncReviewValue  = ref.watch(asyncReviewNotifierProvider(productId));

    return asyncReviewValue.when(data: (data) {
      print('data: ${data.length}');
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Đánh giá',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(ReviewScreen.nameRoute, queryParameters: { "id_product": productId.toString() } );
                  },
                  child: Text(
                    'Xem thêm',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff0A70B8),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                showStar(number: 4, size: 20),
                SizedBox(
                  width: 10,
                ),
                Text('4.5',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '(5 nhận xét)',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
            ),
            Divider(
              height: 20,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _ReviewItemWidget(model: data[index]);
                },
                separatorBuilder: (context, index) => Divider(
                  height: 20,
                ),
                itemCount: data.length > 2 ? 2 : data.length )
          ],
        ),
      );
    }, error: (error, stackTrace) => Center(child: Text(error.toString()),), loading: () => Center(child: CircularProgressIndicator(),),);
  }
}
