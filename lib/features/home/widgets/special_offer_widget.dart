import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/home/providers/slide_provider.dart';
import '../../../shared/constants/api_url.dart';
import '../screens/slider_sreen.dart';
import 'section_layout_widget.dart';
import '../models/mock_model.dart';

class SpecialOfferWidget extends ConsumerWidget {
  const SpecialOfferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(allSlides);

    return SectionLayoutWidget(
      title: 'Special Offers',
      child: asyncValue.when(
        data: (data) {
          return CarouselSlider(
            options: CarouselOptions(viewportFraction: 1),
            items: data.map((slide) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        '${ApiUrl.resourcesURL}/upload/photo/${slide.photo}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onButtonClick: () {
        context.goNamed(SliderSeen.nameRoute);
      },
    );
  }
}
