import 'package:flutter/foundation.dart';

class AppSecrets {
  late final String supabaseUrl;
  late final String supabaseAnonKey;
  late final String supabasepublishableKey;
  factory AppSecrets() => _instance;
  static final _instance = AppSecrets._();

  AppSecrets._() {
    if (kDebugMode) {
      supabaseUrl = 'https://pdaiaheczgrwszciqvqt.supabase.co';
      supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBkYWlhaGVjemdyd3N6Y2lxdnF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTI1ODQ0NTIsImV4cCI6MjEwODE2MDQ1Mn0.dHLdFGyrlA1j61S_wacqSIwUzdIeaX7uHgp3b69AH7c";
      supabasepublishableKey = "sb_publishable_0q0KT2IeBVhf3NurgA4y2g_XepD-kLU";
    } else {
      supabaseUrl = 'https://pdaiaheczgrwszciqvqt.supabase.co';
      supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBkYWlhaGVjemdyd3N6Y2lxdnF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTI1ODQ0NTIsImV4cCI6MjEwODE2MDQ1Mn0.dHLdFGyrlA1j61S_wacqSIwUzdIeaX7uHgp3b69AH7c";
      supabasepublishableKey = "sb_publishable_0q0KT2IeBVhf3NurgA4y2g_XepD-kLU";
    }
  }
}
