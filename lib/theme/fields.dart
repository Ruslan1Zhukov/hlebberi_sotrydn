import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool? obscureText;

  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    required this.label,
    this.obscureText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? obscureText = true;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xFFD9D9D9),
      ),
      borderRadius: BorderRadius.circular(100),
    );
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: ColorProject.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 34,
          vertical: 21,
        ),
        enabledBorder: border,
        border: border,
        focusedBorder: border,
        disabledBorder: border,
        suffixIcon: (obscureText != null)
            ? IconButton(
                icon: Icon(
                  (obscureText ?? false)
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !(obscureText ?? false);
                  });
                },
              )
            : null,
      ),
    );
  }
}
