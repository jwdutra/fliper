import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

const enviroment = String.fromEnvironment("ENV", defaultValue: '');

void main() async {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
