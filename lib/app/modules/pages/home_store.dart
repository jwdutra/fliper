import 'package:fliper/app/modules/home/models/wealth_summary.dart';
import 'package:fliper/app/modules/home/models/wealth_summary_aggregate.dart';
import 'package:fliper/app/modules/home/repositories/home_reporitory.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository _homeRepository = Modular.get<HomeRepository>();

  @observable
  late List<WealthSummary>? wealthSummary = [];

  @observable
  late WealthSummaryAggregate? wealthSummaryAggregate =
      WealthSummaryAggregate();

  @observable
  bool carregando = true;

  beforeInit() {
    buscaDadosHome();
  }

  init() {}

  Future buscaDadosHome() async {
    carregando = true;
    var data = await _homeRepository.dadosHome();

    wealthSummary = data.wealthSummary!;
    wealthSummaryAggregate = data.wealthSummaryAggregate!;
    carregando = false;
  }
}
