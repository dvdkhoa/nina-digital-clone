part of '../search_screen.dart';

class FilterModelBottomSheet extends ConsumerStatefulWidget {
  final Function onFilter;
  final Function onReset;

  const FilterModelBottomSheet(
      {super.key, required this.onFilter, required this.onReset});

  @override
  ConsumerState<FilterModelBottomSheet> createState() =>
      _FilterModelBottomSheetState();
}

class _FilterModelBottomSheetState
    extends ConsumerState<FilterModelBottomSheet> {
  late TextEditingController basePriceEditController;
  late TextEditingController upPriceEditController;

  int? _priceChoice = null;

  @override
  void initState() {
    super.initState();

    final filterValue = ref.read(filterNotifierProvider);

    basePriceEditController =
        TextEditingController(text: filterValue.basePrice?.formattedVNDCustom());
    upPriceEditController =
        TextEditingController(text: filterValue.upPrice?.formattedVNDCustom());
  }

  @override
  void dispose() {
    super.dispose();
    basePriceEditController.dispose();
    upPriceEditController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      child: SingleChildScrollView(
        child: Container(
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
              ProlistWidget(),
              SizedBox(
                height: 10,
              ),
              Text('Hãng'),
              ProcatWidget(),
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
                      controller: basePriceEditController,
                      onChanged: (value){
                        if(!Helper.isNull(value)){
                          value = value.replaceAll('.', '');
                          basePriceEditController.text = int.parse(value).formattedVNDCustom();
                        }
                        setState(() {
                          _priceChoice = null;
                        });
                      },
                      keyboardType: TextInputType.number,
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
                      controller: upPriceEditController,
                      onChanged: (value) {
                        if(!Helper.isNull(value)){
                          value = value.replaceAll('.', '');
                          upPriceEditController.text = int.parse(value).formattedVNDCustom();
                        }
                        setState(() {
                          _priceChoice = null;
                        });
                      },
                      keyboardType: TextInputType.number,
                      style: defaultTextStyle.copyWith(fontSize: 14),
                      decoration: _priceInputDecoration('Đến'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 5.0,
                children: [
                  ...List.generate(filterPrices.length, (index) {
                    final item = filterPrices[index];

                    final selected = _priceChoice == index;

                    return ChoiceChip(
                      label: Text(
                        item['title'].toString(),
                        style: defaultTextStyle.copyWith(
                            color:
                            selected ? Colors.white : Colors.black),
                      ),
                      selected: selected,
                      onSelected: (bool selected) {
                        basePriceEditController.text = selected ? int.parse(item['base_price'].toString()).formattedVNDCustom() : '';
                        upPriceEditController.text = selected ? int.parse(item['up_price'].toString()).formattedVNDCustom() : '';

                        // ref.read(filterNotifierProvider.notifier).onChangeBasePrice(basePriceEditController.text);
                        // ref.read(filterNotifierProvider.notifier).onChangeUpPrice(upPriceEditController.text);

                        setState(() {
                          _priceChoice = selected ? index : null;
                        });
                      },
                      showCheckmark: false,
                      selectedColor: Color(0xff0A70B8),
                      side: selected
                          ? BorderSide.none
                          : const BorderSide(
                        color: Colors.black,
                      ),
                    );
                  },)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('Sắp xếp theo'),
              OrderbyWidget(),
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
                          this.widget.onReset();
                          context.pop();
                        },
                        child: Text(
                          'Reset',
                          style: defaultTextStyle.copyWith(fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffE7E7E7),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          final basePrice = basePriceEditController.text.replaceAll('.', '');
                          final upPrice = upPriceEditController.text.replaceAll('.', '');

                          ref
                              .read(filterNotifierProvider.notifier)
                              .onChangeBasePrice(basePrice);
                          ref
                              .read(filterNotifierProvider.notifier)
                              .onChangeUpPrice(upPrice);

                          ref
                              .read(searchNotifierProvider.notifier)
                              .filterProducts();

                          this.widget.onFilter();
                          context.pop();
                        },
                        child: Text(
                          'Lọc',
                          style: defaultTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff0A70B8),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}


final filterPrices = [
  {
    'title': 'Dưới 1.000.000',
    'base_price': 0,
    'up_price': 1000000,
  },
  {
    'title': '1.000.000 - 2.000.000',
    'base_price': 1000000,
    'up_price': 2000000,
  },
  {
    'title': '2.000.000 - 5.000.000',
    'base_price': 2000000,
    'up_price': 5000000,
  },
  {
    'title': '5.000.000 - 10.000.000',
    'base_price': 5000000,
    'up_price': 10000000,
  },
  {
    'title': '10.000.000 - 15.000.000',
    'base_price': 10000000,
    'up_price': 15000000,
  },
];
