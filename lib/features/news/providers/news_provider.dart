import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/features/news/models/news_model.dart';
import 'package:nina_digital/features/news/repositories/news_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_provider.g.dart';

@Riverpod(keepAlive: false)
class AsyncNewsNotifier extends _$AsyncNewsNotifier {
  @override
  FutureOr<List<NewsModel>> build() async {
    return _fetchNews();
  }

  refreshNews() async {
    state = await AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return _fetchNews();
    });
  }

  Future<List<NewsModel>> _fetchNews() async {
    final newsRepository = NewsRepository(ref.watch(dioProvider));

    final res = await newsRepository.fetchNews('tin-tuc');

    final list = res['data'] as List;

    final news = list.map((item) => NewsModel.fromJson(item)).toList();

    return news;
  }
}

// final allNews = FutureProvider.autoDispose<List<NewsModel>>((ref) async {
//   final newsRepository = NewsRepository(ref.watch(dioProvider));

//   final res = await newsRepository.fetchNews('tin-tuc');

//   final list = res['data'] as List;

//   final news = list.map((item) => NewsModel.fromJson(item)).toList();

//   return news;
// });

final detailNewsProvider =
    FutureProvider.autoDispose.family<NewsModel, int>((ref, id) async {
  final newsRepository = NewsRepository(ref.watch(dioProvider));

  final res = await newsRepository.getDetailNews(id);

  return NewsModel.fromJson(res['data']);
});
