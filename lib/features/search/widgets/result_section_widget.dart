part of '../search_screen.dart';

class ResultSectionWidget extends ConsumerWidget {
  final bool isFilter;
  final TextEditingController searchController;
  const ResultSectionWidget({super.key, required this.isFilter, required this.searchController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final keyword = ref.watch(filterNotifierProvider.select((value) => value.keyword));

    print('result: $keyword');

    return Helper.isNull(keyword) && !isFilter
        ? OldSearchListWidget(searchController: searchController,)
        : SearchResultWidget(
      keyword: keyword?.toString() ?? '',
    );
  }
}
