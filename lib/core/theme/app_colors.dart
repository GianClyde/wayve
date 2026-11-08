// app_colors.dart
import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const Color primary500 = Color(
    0xFF0E7490,
  ); // Ocean Deep (Primary actions, app bars)
  static const Color primary200 = Color(
    0xFF06B6D4,
  ); // Coastal Teal (Routes, live location pings)
  static const Color accent = Color(
    0xFFFF6B6B,
  ); // Coral Sunrise (FABs, badges, likes)

  // Neutral Light
  static const Color neutralLightBg = Color(0xFFF8FAFC); // Mist White
  static const Color neutralLightSurface = Color(
    0xFFFFFFFF,
  ); // Card & container surfaces
  static const Color neutralLightText = Color(
    0xFF0F172A,
  ); // Deep Navy headings/body
  static const Color neutralLightSubtext = Color(
    0xFF64748B,
  ); // Slate secondary text

  // Neutral Dark
  static const Color neutralDarkBg = Color(0xFF0B1320); // Midnight Deep
  static const Color neutralDarkSurface = Color(
    0xFF1E293B,
  ); // Slate Dark surface
  static const Color neutralDarkText = Color(
    0xFFF8FAFC,
  ); // Light Navy contrast text
  static const Color neutralDarkSubtext = Color(0xFF94A3B8); // Muted Slate

  // Semantic Signals
  static const Color success = Color(
    0xFF10B981,
  ); // Mint Horizon (Settled balances, active status)
  static const Color warning = Color(
    0xFFF59E0B,
  ); // Amber Dusk (Pending balances, alerts)
  static const Color error = Color(
    0xFFEF4444,
  ); // Crimson (Failed states, overdue balances)
  static const Color info = Color(
    0xFF06B6D4,
  ); // Coastal Teal (System notices, tips)
}
