import 'package:flutter/material.dart';

class ColorsStatus extends Color {
  ColorsStatus(super.value);

  static const Map<String, Color> _statuscolor = {
    'pending': Colors.yellow,
    'approved': Colors.green,
    'rejected': Colors.red,
  };

  static Color getColor(String status) {
    return _statuscolor[status.toLowerCase()] ??
        Colors.grey; // Return grey if status is not found
  }
}
