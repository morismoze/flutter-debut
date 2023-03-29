import 'package:flutter/material.dart';

class StyledTextFormField extends StatefulWidget {
  final TextEditingController? textController;
  final ValueChanged? onChanged;
  final ValueChanged? onFieldSubmitted;
  final bool? isObscure;
  final IconData? icon;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? autoFocus;
  final String? hint;
  final String? errorText;

  const StyledTextFormField({
    Key? key,
    this.textController,
    this.onChanged,
    this.onFieldSubmitted,
    this.isObscure,
    this.icon,
    this.inputType,
    this.inputAction,
    this.autoFocus = false,
    this.hint,
    this.errorText,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StyledTextFormFieldState();
}

class _StyledTextFormFieldState extends State<StyledTextFormField> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isObscure ?? false;
  }

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: widget.textController,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        obscureText: _isPasswordVisible,
        keyboardType: widget.inputType,
        textInputAction: widget.inputAction,
        autofocus: widget.autoFocus ?? false,
        obscuringCharacter: '●',
        decoration: InputDecoration(
          hintText: widget.hint,
          errorText: widget.errorText,
          prefixIcon: widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(
                    widget.icon,
                    size: 20,
                  ),
                )
              : null,
          suffixIcon: widget.isObscure != null
              ? IconButton(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(right: 20.0),
                  icon: Icon(
                    !_isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: togglePasswordVisibility,
                )
              : null,
        ),
      ),
    );
  }
}
