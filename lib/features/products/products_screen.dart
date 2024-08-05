import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/authentication_user/providers/auth_user_provider.dart';
import '../../shared/utils/helper.dart';
import 'providers/product_provider.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  static const String nameRoute = 'products';
  static const String pathRoute = '/products';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final a = ref.watch(authUserProvider.select(
      (value) => value.userLogin,
    ));
    print(a);
    AsyncValue asyncValue = ref.watch(allProductProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Test API'),
      ),
      body: asyncValue.when(
        data: (data) {
          final result = data['data'];
          if (!Helper.isNull(result)) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final item = result[index];
                  return ListTile(
                    title: Text(item['namevi']),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: result.length);
          }
          return const SizedBox.shrink();
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
