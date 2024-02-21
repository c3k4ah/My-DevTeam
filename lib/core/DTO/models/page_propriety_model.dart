import 'package:flutter/material.dart';

class PagePropriety {
  final String pageName;
  final IconData pageIcon;

  PagePropriety({
    required this.pageName,
    required this.pageIcon,
  });

  factory PagePropriety.fromMap(Map<String, dynamic> meta) {
    return PagePropriety(
      pageName: meta['title'] ?? '',
      pageIcon: meta['icon'] ?? '',
    );
  }
}
