part of '../branch_screen.dart';

class DistrictSelectWidget extends ConsumerWidget {
  const DistrictSelectWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncDistrictValue = ref.watch(asyncDistrictNotifierProvider);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: asyncDistrictValue.when(data: (data) {
        return DropdownButtonFormField(
          menuMaxHeight: 200,
          value: -1,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontSize: 13),
          items:  [
            DropdownMenuItem(
              child: Text(
                'Quận huyện',
              ),
              value: -1,
            ),
            ...?data?.map((e)=>DropdownMenuItem(
              child: Text(e.name.toString()),
              value: e.id,
            )).toList()
          ],
          onChanged: (value) {
            print('Quận huyện: $value');
            // Loading branches
            ref.read(asyncBranchNotifierProvider.notifier).fetchBranches(districtId: value);
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
      }, error: (error, stackTrace) => Center(child: Text(error.toString()),), loading: () => const Center(child: SpinKitCircle(
        size: 20,
        color: Colors.red,
      ),),),
    );
  }
}
