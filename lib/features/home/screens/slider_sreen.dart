import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nina_digital/features/home/providers/slide_provider.dart';

import '../../../shared/constants/api_url.dart';
import '../models/mock_model.dart';

class SliderSeen extends ConsumerWidget {
  const SliderSeen({Key? key}) : super(key: key);

  static const String nameRoute = 'sliders';
  static const String pathRoute = 'sliders';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(allSlides);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Special Offers',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: asyncValue.when(data: (data) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                      '${ApiUrl.resourcesURL}/upload/photo/${data[index].photo}'),
                ));
          },
          itemCount: data.length,
        );
      }, error: (Object error, StackTrace stackTrace) {
        return Center(
          child: Text(error.toString() + stackTrace.toString()),
        );
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
