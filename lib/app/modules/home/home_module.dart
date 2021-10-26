import 'package:fliper/app/modules/home/repositories/home_reporitory.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './pages/home_store.dart';

import './pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind((i) => HomeRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
