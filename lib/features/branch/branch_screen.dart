import 'package:flutter/material.dart';

import 'models/mock_model.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'branchs';
  static const String pathRoute = '/branchs';

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  List branches = [];

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
                margin: EdgeInsets.only(left: 25),
                child: Image.asset('assets/images/g22.png')),
            title: Text(
              'Hệ thống chi nhánh',
              style:
                  defaultTextStyle.copyWith(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: Colors.black45,
            pinned: true,
            floating: true,
            stretch: true,
            onStretchTrigger: () async {
              print('stretch');
            },
            expandedHeight: 370,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              title: LayoutBuilder(builder: (context, constraints) {
                var dynamicHeight = constraints.maxHeight;
                return AnimatedOpacity(
                  opacity: (dynamicHeight > 160) ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'HỆ THỐNG CỦA DIGITAL',
                          overflow: TextOverflow.fade,
                          style: defaultTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: switch (dynamicHeight) {
                                250 => 15,
                                200 => 13,
                                _ => dynamicHeight > 250 ? 15 : 12,
                              }),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tính đến hiện tại, chuỗi hệ thống Digital có 20 chi nhánh tại những vị trí đắc địa nhất Tp. Hồ Chí Minh và các tỉnh lân cận. Hãy tìm kiếm đến chi nhanh gần bạn để trải nghiệm chúng tôi',
                          style: defaultTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: switch (dynamicHeight) {
                              250 => 10,
                              200 => 9,
                              _ => dynamicHeight > 250 ? 10 : 8,
                            },
                            height: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }),
              background: Image.asset(
                'assets/images/bg_branch_none.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/icon-navigation.png'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'TÌM KIẾM GẦN BẠN',
                            style: defaultTextStyle.copyWith(
                                fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff0A70B8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField(
                      value: -1,
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: 13),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Tỉnh / Thành phố',
                          ),
                          value: -1,
                        ),
                        ...citys
                            .map((city) => DropdownMenuItem(
                                  child: Text(
                                    city['title'].toString(),
                                  ),
                                  value: city['id'].toString(),
                                ))
                            .toList()
                      ],
                      onChanged: (value) {
                        print('Tỉnh/Thành phố: $value');
                        setState(() {
                          if (value != -1)
                            branches = branchsByCity;
                          else
                            branches = [];
                        });
                      },
                      decoration: const InputDecoration(
                        // filled: true,
                        // fillColor: Color(0xFFF4F4F4),
                        focusedBorder: _normalInputBorder,
                        enabledBorder: _enableInputBorder,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField(
                      value: -1,
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: 13),
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            'Quận huyện',
                          ),
                          value: -1,
                        ),
                      ],
                      onChanged: (value) {
                        print('Quận huyện: $value');
                      },
                      decoration: const InputDecoration(
                        // filled: true,
                        // fillColor: Color(0xFFF4F4F4),
                        focusedBorder: _normalInputBorder,
                        enabledBorder: _enableInputBorder,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  (branches.length == 0)
                      ? Column(
                          children: [
                            ...ListTile.divideTiles(
                                context: context,
                                color: Color(0xffEDEDED),
                                tiles: citys
                                    .map((city) => ListTile(
                                          title: Text(city['title'].toString() +
                                              ' (${city['count'].toString()})'),
                                        ))
                                    .toList())
                          ],
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              ...ListTile.divideTiles(
                                  color: Color(0xffEDEDED),
                                  context: context,
                                  tiles: [
                                    ...branches
                                        .map((branch) => _customListTile(
                                            image: branch['image'],
                                            desc: branch['desc']))
                                        .toList()
                                  ]),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _normalInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent),
    borderRadius: BorderRadius.all(Radius.circular(8)));

const _enableInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff3C3C3C)),
    borderRadius: BorderRadius.all(Radius.circular(8)));

class _customListTile extends StatelessWidget {
  final String image;
  final String desc;

  _customListTile(
      {Key? key, required String this.image, required String this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Row(
            children: [
              Image.asset(
                'assets/images/${image}',
                width: 70,
              ),
              SizedBox(
                width: 18,
              ),
              Expanded(child: Text(desc))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  'Hotline',
                  style: defaultTextStyle.copyWith(
                      fontSize: 13, color: Colors.black),
                ),
                icon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(6))),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  'Chỉ đường',
                  style: defaultTextStyle.copyWith(
                      fontSize: 13, color: Colors.black),
                ),
                icon: Icon(
                  Icons.navigation,
                  color: Colors.black,
                ),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(6))),
              )
            ],
          )
        ]));
  }
}





// Text(
//                       'HỆ THỐNG CỦA DIGITAL',
//                       style: defaultTextStyle.copyWith(
//                           fontSize: 16, color: Colors.white),
//                     ),
//                     Text(
//                       'Tính đến hiện tại, chuỗi hệ thống Digital có 20 chi nhánh tại những vị trí đắc địa nhất Tp. Hồ Chí Minh và các tỉnh lân cận. Hãy tìm kiếm đến chi nhanh gần bạn để trải nghiệm chúng tôi',
//                       style: defaultTextStyle.copyWith(
//                           fontSize: 10, color: Colors.white),
//                     )