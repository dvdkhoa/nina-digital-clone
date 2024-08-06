import 'package:flutter/material.dart';

import 'models/mock_model.dart';
import 'widgets/ordering_tab_widget.dart';
import 'widgets/orders_by_type_widget.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'order';
  static const String pathRoute = '/order';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late TabController _tabController;

  // @override
  // void initState() {
  //    TabController(length: _tabs.length, vsync: this)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Đơn hàng'),
        ),
        body: DefaultTabController(
          length: _tabs.length,
          child: Column(
            children: [
              TabBar(
                tabs: _tabs,
                labelPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                unselectedLabelStyle: TextStyle(fontSize: 14),
                isScrollable: true,
                tabAlignment: TabAlignment.start,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    OrderByTypeWidget(
                      orders: totalOrders,
                    ),
                    OrderingTabWidget(),
                    OrderByTypeWidget(
                      orders: [],
                    ),
                    OrderByTypeWidget(
                      orders: beingTransportedOrders,
                    ),
                    OrderByTypeWidget(
                      orders: [],
                    ),
                    OrderByTypeWidget(
                      orders: [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

final _tabs = [
  Tab(
    text: 'Tất cả',
  ),
  Tab(
    text: 'Mới đặt',
  ),
  Tab(
    text: 'Đang xử lý',
  ),
  Tab(
    text: 'Đang vận chuyển',
  ),
  Tab(
    text: 'Đã giao',
  ),
  Tab(
    text: 'Đã huỷ',
  ),
];
