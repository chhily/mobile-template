import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBorderRadius {
  static BorderRadius circularBorderRadius = BorderRadius.circular(14);
  static BorderRadius verticalBorderRadius = const BorderRadius.vertical(
    top: Radius.circular(14),
    bottom: Radius.circular(14),
  );
  static BorderRadius horizontalBorderRadius = const BorderRadius.horizontal(
    left: Radius.circular(14),
    right: Radius.circular(14),
  );
}

class AppFormatter {
  static priceFormatter(num price) {
    final numberFormat = NumberFormat('#,###,###.##');
    return numberFormat.format(price);
  }
}
