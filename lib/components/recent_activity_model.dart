import 'package:flutter/material.dart';

class Activity {
  final String title;
  final String subtitle;
  final String time;
  final String status;
  final Color statusColor;
  final IconData icon;
  final Color iconColor;

  Activity({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.icon,
    required this.iconColor,
  });
}