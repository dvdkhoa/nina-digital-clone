import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nina_digital/features/news/models/news_model.dart';
import 'package:nina_digital/features/news/providers/news_provider.dart';
import '../../shared/constants/api_url.dart';
import 'news_detail_screen.dart';

// final DateFormat formatter = DateFormat('dd/MM/yyyy');

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  static const String nameRoute = 'news';
  static const String pathRoute = '/news';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncNewsData = ref.watch(asyncNewsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
            margin: EdgeInsets.only(left: 25),
            child: Image.asset('assets/images/g22.png')),
        title: Text('Tin tức'),
        actions: [
          IconButton(
              onPressed: () {
                print('search');
              },
              icon: SvgPicture.asset('assets/icons/search.svg'))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(asyncNewsNotifierProvider.notifier).refreshNews();
        },
        child: SingleChildScrollView(
          child: asyncNewsData.when(
            data: (data) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    FadeInImage.assetNetwork(
                      image:
                          '${ApiUrl.resourcesURL}/upload/news/${data[0].photo}',
                      placeholder: 'assets/images/placeholder.jpg',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      data[0].namevi,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data[0].descvi,
                      style: TextStyle(
                          fontSize: 12, color: Color(0xff5B5B5B), height: 1.6),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: _subNewsList(context, data),
                      ),
                    )
                  ],
                ),
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString() + stackTrace.toString()),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _subNewsList(BuildContext context, List<NewsModel> news) {
  final dateFormat = DateFormat('dd/MM/yyyy');
  final List<Widget> list = [];
  for (int i = 1; i < news.length; i++) {
    final item = InkWell(
      onTap: () {
        context.pushNamed(NewsDetailScreen.nameRoute,
            pathParameters: {'id': news[i].id.toString()});
      },
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            FadeInImage.assetNetwork(
              width: 120,
              image: '${ApiUrl.resourcesURL}/upload/news/${news[i].photo}',
              placeholder: 'assets/images/placeholder.jpg',
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news[i].namevi.toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Ngày đăng: ${dateFormat.format(DateTime(news[i].dateCreated))}',
                    style: TextStyle(fontSize: 12, color: Color(0xff5B5B5B)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    list.add(item);
    list.add(const Divider(
      height: 25,
    ));
  }
  list.removeLast();
  return list;
}
