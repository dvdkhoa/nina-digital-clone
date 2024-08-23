part of '../sign_up_screen.dart';

class _InputRepasswordWidget extends ConsumerStatefulWidget {
  const _InputRepasswordWidget({super.key});

  @override
  ConsumerState createState() => __InputRepasswordWidgetState();
}

class __InputRepasswordWidgetState extends ConsumerState<_InputRepasswordWidget>
    with FormMixins {
  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    final pass =
        ref.watch(formSignUpProvider.select((value) => value.password)) ?? '';
    return customTextFormField(
      context,
      fillColor: _fillColor,
      borderRadius: _borderRadius,
      hintText: 'Nhập lại mật khẩu*',
      prefixIcon: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
        child: const Icon(Icons.lock_clock_outlined),
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            _hideText = !_hideText;
          });
        },
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
          child: (_hideText == false)
              ? const Icon(
                  Icons.visibility_off_outlined,
                )
              : const Icon(
                  Icons.visibility_outlined,
                ),
        ),
      ),
      obscureText: _hideText,
      onChanged: (value) {
        ref.read(formSignUpProvider.notifier).onRePasswordChange(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(errorText: 'Không bỏ trống'),
          FormBuilderValidators.minLength(6,
              errorText: 'Mật khẩu tối thiểu 6 ký tự'),
          (value) {
            if (value != pass) return 'Nhập lại mật khẩu không đúng';
            return null;
          }
        ],
      ),
    );
  }
}
