part of '../search_screen.dart';

class ResultSectionWidget extends ConsumerWidget {
  final bool isFilter;
  const ResultSectionWidget({super.key, required this.isFilter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final keyword = ref.read(filterNotifierProvider.select((value) => value.keyword));

    return Helper.isNull(keyword) && !isFilter
        ? OldSearchListWidget()
        : SearchResultWidget(
      keyword: keyword?.toString() ?? '',
    );
  }
}
