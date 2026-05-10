import 'package:flutter/material.dart';

class AppColors {
  // ── Brand palette — matched exactly to shireen-bakers.com ────────────────
  static const primary     = Color(0xFF757575); // Charcoal grey (SHIREEN text, buttons)
  static const accent      = Color(0xFFE6BC15); // Vibrant gold  (BAKERS text, S icon)
  static const primaryDark = Color(0xFF505050); // Darker charcoal

  // ── Backgrounds ──────────────────────────────────────────────────────────
  static const surfaceColor = Color(0xFFFAF4D3); // Warm cream (page bg)
  static const cardBg       = Color(0xFFFFFFFF); // Pure white (cards)
  static const darkBg       = Color(0xFF2A2A2A); // Dark sections

  // ── Text ─────────────────────────────────────────────────────────────────
  static const textDark  = Color(0xFF0F0F0F); // Near-black (nav links, body)
  static const textLight = Color(0xFF757575); // Charcoal grey (secondary text)
  static const textWhite = Color(0xFFFFFFFF); // White text on dark bg

  // ── Borders & Dividers ───────────────────────────────────────────────────
  static const border  = Color(0xFFE0D5A3); // Cream-tinted border
  static const divider = Color(0xFFE0E0E0); // Light grey divider

  // ── Status ───────────────────────────────────────────────────────────────
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFF9800);
  static const error   = Color(0xFFF44336);
  static const info    = Color(0xFF2196F3);
}
