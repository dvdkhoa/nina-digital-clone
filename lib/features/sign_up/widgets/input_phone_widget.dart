part of '../sign_up_screen.dart';

class _InputPhoneWidget extends ConsumerWidget with FormMixins {
  const _InputPhoneWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customTextFormField(
      context,
      fillColor: _fillColor,
      borderRadius: _borderRadius,
      hintText: 'Số điện thoại*',
      prefixIcon: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
        child: const Icon(Icons.phone),
      ),
      onChanged: (value) {
        ref.read(formSignUpProvider.notifier).onPhoneChange(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(errorText: 'Không bỏ trống'),
        ],
      ),
    );
  }
}
