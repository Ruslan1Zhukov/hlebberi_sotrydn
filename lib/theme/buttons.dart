import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.isActive = true,
    this.isLoading = false,
  }) : super(key: key);

  final Function() onTap;
  final String label;
  final bool isActive;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFFFC107)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        child: Row(
          children: [
            if (isLoading) const SizedBox(width: 20),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            if (isLoading)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
