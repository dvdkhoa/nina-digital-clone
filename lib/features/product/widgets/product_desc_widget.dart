part of '../product_detail_screen.dart';

class ProductDescWidget extends StatefulWidget {
  final String desc;
  const ProductDescWidget({Key? key, required this.desc}) : super(key: key);

  @override
  _ProductDescWidgetState createState() => _ProductDescWidgetState();
}

class _ProductDescWidgetState extends State<ProductDescWidget> {
  final double _maxHeightContent = 220;
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          child: Container(
            height: (_showMore == false) ? _maxHeightContent : null,
            child: Stack(
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  child: Wrap(
                    children: [
                      HtmlWidget(
                        widget.desc.decodeHtml(),
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Color(
                              0xff5B5B5B,
                            ),
                            height: 1.8),
                      ),
                    ],
                  ),
                ),
                if (_showMore == false)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _showMore = !_showMore;
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (_showMore == false)
                    ? [
                        const Text(
                          'Mô tả sản phẩm',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff5B5B5B)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: const Icon(
                            Icons.vertical_align_bottom,
                            size: 14,
                            color: Color(0xff5B5B5B),
                          ),
                        ),
                      ]
                    : [
                        const Text(
                          'Thu gọn',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff5B5B5B)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: const Icon(
                            Icons.vertical_align_top,
                            size: 14,
                            color: Color(0xff5B5B5B),
                          ),
                        ),
                      ]),
          ),
        )
      ],
    );
  }
}
