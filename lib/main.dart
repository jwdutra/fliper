import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

import 'package:intl/intl.dart';

void main() async {
  Intl.defaultLocale = 'pt_BR';
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
