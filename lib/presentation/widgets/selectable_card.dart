import 'package:flutter/cupertino.dart';

class SelectableCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isEnabled;
  const SelectableCard({
    super.key,
    required this.text,
    this.onTap,
    required this.isSelected,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
