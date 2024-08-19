part of '../branch_screen.dart';

class BranchResultWidget extends ConsumerWidget {
  const BranchResultWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncQuantityBranchesValue =
        ref.watch(quantityBranchNotifierProvider);

    final asyncBranchValue = ref.watch(asyncBranchNotifierProvider);

    return asyncBranchValue.when(
      data: (data) {
        return (data.length == 0)
            ? asyncQuantityBranchesValue.when(
                data: (data) {
                  return Column(
                    children: [
                      ...ListTile.divideTiles(
                          context: context,
                          color: Color(0xffEDEDED),
                          tiles: data
                              .map((quantityBranch) => ListTile(
                                    title: Text(quantityBranch.name.toString() +
                                        ' (${quantityBranch.quantity})'),
                                  ))
                              .toList())
                    ],
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text('${error.toString()}: ${stackTrace.toString()}'),
                ),
                loading: () => Center(
                  child: SpinKitCircle(
                    size: 20,
                    color: Colors.red,
                  ),
                ),
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
                          ...data
                              .map(
                                (branch) => _customListTile(
                                  image:
                                      '${ApiUrl.resourcesURL}/upload/branch/${branch.photo.toString()}',
                                  desc: branch.address.toString(),
                                  phoneNumber: branch.phone.toString(),
                                  link_google_map: branch.googleMap.toString(),
                                ),
                              )
                              .toList()
                        ]),
                  ],
                ),
              );
      },
      error: (error, stackTrace) => Center(
        child: Text('${error.toString()}: ${stackTrace.toString()}'),
      ),
      loading: () => Center(
        child: SpinKitCircle(
          color: Colors.red,
          size: 20,
        ),
      ),
    );
  }
}
