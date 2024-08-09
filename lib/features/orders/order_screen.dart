import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../checkout/providers/order_provider.dart';
import 'providers/order_status_provider.dart';
import 'widgets/ordering_tab_widget.dart';
import 'widgets/orders_by_type_widget.dart';

class OrderScreen extends ConsumerStatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'order';
  static const String pathRoute = '/order';

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  late TabController _tabController;

  // @override
  // void initState() {
  //    TabController(length: _tabs.length, vsync: this)
  // }

  @override
  Widget build(BuildContext context) {
    final asyncOrderStatusValue = ref.watch(orderStatusProvider);
    final asyncOrderValue = ref.watch(asyncOrderNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn hàng'),
      ),
      body: asyncOrderStatusValue.when(
        data: (dataTab) {
          final tabs = dataTab
              .map(
                (e) => Tab(
                  text: e.namevi,
                ),
              )
              .toList();
          return asyncOrderValue.when(
            data: (dataOrders) {
              return DefaultTabController(
                length: dataTab.length,
                child: Column(
                  children: [
                    TabBar(
                      tabs: tabs,
                      labelPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      unselectedLabelStyle: TextStyle(fontSize: 14),
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        ...dataTab.map(
                          (e) {
                            final list = dataOrders
                                .where((order) => order.orderStatus == e.id)
                                .toList();
                            print('list: ${e.id} ${list.length}');
                            return OrderByTypeWidget(orders: list);
                          },
                        ).toList()
                      ]
                          // [
                          //   OrderByTypeWidget(
                          //     orders: data,
                          //   ),
                          //   OrderingTabWidget(),
                          //   OrderByTypeWidget(
                          //     orders: [],
                          //   ),
                          // ],
                          ),
                    ),
                  ],
                ),
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString() + stackTrace.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(error.toString() + stackTrace.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

// final _tabs = [
//   Tab(
//     text: 'Tất cả',
//   ),
//   Tab(
//     text: 'Mới đặt',
//   ),
//   Tab(
//     text: 'Đang xử lý',
//   ),
//   Tab(
//     text: 'Đang vận chuyển',
//   ),
//   Tab(
//     text: 'Đã giao',
//   ),
//   Tab(
//     text: 'Đã huỷ',
//   ),
// ];
