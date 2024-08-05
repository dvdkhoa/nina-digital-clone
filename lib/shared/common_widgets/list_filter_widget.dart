import 'package:flutter/material.dart';

class ListFilterWidget extends StatefulWidget {
  final List list;
  final bool multipleSelect;
  const ListFilterWidget(
      {Key? key, required this.list, this.multipleSelect = true})
      : super(key: key);

  @override
  State<ListFilterWidget> createState() => _ListFilterWidgetState();
}

class _ListFilterWidgetState extends State<ListFilterWidget> {
  List _selectedList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = _selectedList.contains(index);
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: FilterChip(
              label: Text(
                widget.list[index]['title'],
                style: DefaultTextStyle.of(context).style.copyWith(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 13),
              ),
              selected: isSelected,
              showCheckmark: false,
              selectedColor: Color(0xff0A70B8),
              side: isSelected
                  ? BorderSide.none
                  : const BorderSide(
                      color: Colors.black,
                    ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              onSelected: (bool value) {
                if (widget.multipleSelect) {
                  setState(() {
                    if (_selectedList.contains(index)) {
                      _selectedList.remove(index);
                    } else {
                      _selectedList.add(index);
                    }
                  });
                } else {
                  setState(() {
                    _selectedList.clear();
                    _selectedList.add(index);
                  });
                }
              },
            ),
          );
        },
        itemCount: widget.list.length,
      ),
    );
  }
}
