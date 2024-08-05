import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:isar/isar.dart';
import 'package:nina_digital/features/news/providers/news_provider.dart';

import '../../shared/common_widgets/custom_scaffold_widget.dart';
import '../../shared/extensions/string_ext.dart';

class NewsDetailScreen extends ConsumerWidget {
  final String id;
  NewsDetailScreen({Key? key, required this.id}) : super(key: key);

  static const String nameRoute = 'news-detail';
  static const String pathRoute = '/news-detail/:id';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailNews = ref.watch(detailNewsProvider(int.parse(id)));

    return CustomScaffoldWidget(
      title: 'Tin tức',
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: detailNews.when(
            data: (data) {
              return HtmlWidget(data.contentvi.decodeHtml());
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
