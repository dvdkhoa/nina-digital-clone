part of '../review_screen.dart';

class _ReviewSectionWidget extends ConsumerWidget {
  final int productId;
  const _ReviewSectionWidget({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncReviewValue = ref.watch(asyncReviewNotifierProvider(productId));

    final reviews = ref.watch(reviewFilterProvider(productId));

    return asyncReviewValue.when(data: (data) {
      return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _ReviewItemWidget(model: reviews[index],);
          },
          separatorBuilder: (context, index) => Divider(
            height: 20,
          ),
          itemCount: reviews.length);
    }, error: (error, stackTrace) => Center(child: Text(error.toString()),), loading: () => Center(child: CircularProgressIndicator(),),);
  }
}
