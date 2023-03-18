import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
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

  const TextFieldWidget(
      {Key? key,
      this.textController,
      this.onChanged,
      this.onFieldSubmitted,
      this.isObscure,
      this.icon,
      this.inputType,
      this.inputAction,
      this.autoFocus = false,
      this.hint,
      this.errorText})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
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
    print(_isPasswordVisible);
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
                  ? Icon(
                      widget.icon,
                      color: Colors.grey[400],
                      size: 20,
                    )
                  : null,
              suffixIcon: widget.isObscure != null
                  ? IconButton(
                      icon: Icon(
                          !_isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey[400]),
                      onPressed: togglePasswordVisibility)
                  : null,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              fillColor: const Color.fromARGB(18, 39, 110, 241),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3461FF), width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(14)))),
        ));
  }
}
