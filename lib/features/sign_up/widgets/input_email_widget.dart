part of '../sign_up_screen.dart';

class _InputEmailWidget extends ConsumerWidget with FormMixins {
  const _InputEmailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customTextFormField(
      context,
      fillColor: _fillColor,
      borderRadius: _borderRadius,
      hintText: 'Email*',
      prefixIcon: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
        child: const Icon(Icons.mail_outline),
      ),
      onChanged: (value) {
        ref.read(formSignUpProvider.notifier).onEmailChange(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(errorText: 'Không bỏ trống'),
          FormBuilderValidators.email(errorText: 'Email không đúng định dạng'),
        ],
      ),
    );
  }
}
