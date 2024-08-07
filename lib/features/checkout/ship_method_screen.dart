import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../shared/common_widgets/item_checked_widget.dart';
import 'models/mock_model.dart';
import 'models/ship_method.dart';
import 'widgets/ship_method_item_widget.dart';

class ShipMethodScreen extends StatefulWidget {
  final ShipMethod? shipMethod;
  const ShipMethodScreen({Key? key, this.shipMethod}) : super(key: key);

  static const String nameRoute = 'ship-method';
  static const String pathRoute = 'ship-method';

  @override
  State<ShipMethodScreen> createState() => _ShipMethodScreenState();
}

class _ShipMethodScreenState extends State<ShipMethodScreen> {
  ShipMethod? _shipMedthodState;

  @override
  void initState() {
    _shipMedthodState = widget.shipMethod;
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Scaffold(
      appBar: AppBar(
        title: Text('Phương thức vận chuyển'),
      ),
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: shipsDump
                .map(
                  (ship) => InkWell(
                    onTap: () {
                      setState(() {
                        _shipMedthodState = ship;
                      });
                    },
                    child: ShipMethodItemWidget(
                      title: ship.title,
                      desc: ship.desc,
                      price: ship.feeTitle,
                      isChecked: _shipMedthodState?.id == ship.id,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(color: Colors.white, boxShadow: []),
        child: ElevatedButton(
          child: Text(
            'Apply',
            style: defaultTextStyle.copyWith(fontSize: 15, color: Colors.white),
          ),
          onPressed: () {
            context.pop(_shipMedthodState);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A70B8)),
        ),
      ),
    );
  }
}
