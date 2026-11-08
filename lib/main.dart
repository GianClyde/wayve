import 'package:flutter/material.dart';
import 'package:wayve/core/di/injection.dart';
import 'package:wayve/core/wayve.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const WayveApp());
}
