part of '../product_detail_screen.dart';

class _ReviewSectionWidget extends StatelessWidget with UiMixins {
  const _ReviewSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  context.pushNamed(ReviewScreen.nameRoute);
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
                return _ReviewItemWidget();
              },
              separatorBuilder: (context, index) => Divider(
                    height: 20,
                  ),
              itemCount: 5)
        ],
      ),
    );
  }
}
