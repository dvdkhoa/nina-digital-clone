part of '../branch_screen.dart';

class CitySelectWidget extends ConsumerStatefulWidget {
  const CitySelectWidget({super.key});

  @override
  ConsumerState<CitySelectWidget> createState() => _CitySelectWidgetState();
}

class _CitySelectWidgetState extends ConsumerState<CitySelectWidget> {
  @override
  Widget build(BuildContext context) {
    final asyncCityValue = ref.watch(asyncCityNotifierProvider);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: asyncCityValue.when(
        data: (data) {
          return DropdownButtonFormField(
            menuMaxHeight: 200,
            value: -1,
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 13),
            items: [
              DropdownMenuItem(
                child: Text(
                  'Tỉnh / Thành phố',
                ),
                value: -1,
              ),
              ...?data
                  ?.map((city) => DropdownMenuItem(
                        child: Text(
                          city.name.toString(),
                        ),
                        value: city.id,
                      ))
                  .toList()
            ],
            onChanged: (value) {
              print(value);
              ref.read(asyncDistrictNotifierProvider.notifier).fetchDistrictByCityId(value!);
              // Loading Branches
              ref.read(asyncBranchNotifierProvider.notifier).fetchBranches(cityId: value);
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
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(stackTrace.toString()),
        ),
        loading: () => Center(
          child: SpinKitCircle(
            size: 20,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
