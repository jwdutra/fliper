// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$wealthSummaryAtom = Atom(name: 'HomeStoreBase.wealthSummary');

  @override
  List<WealthSummary>? get wealthSummary {
    _$wealthSummaryAtom.reportRead();
    return super.wealthSummary;
  }

  @override
  set wealthSummary(List<WealthSummary>? value) {
    _$wealthSummaryAtom.reportWrite(value, super.wealthSummary, () {
      super.wealthSummary = value;
    });
  }

  final _$wealthSummaryAggregateAtom =
      Atom(name: 'HomeStoreBase.wealthSummaryAggregate');

  @override
  WealthSummaryAggregate? get wealthSummaryAggregate {
    _$wealthSummaryAggregateAtom.reportRead();
    return super.wealthSummaryAggregate;
  }

  @override
  set wealthSummaryAggregate(WealthSummaryAggregate? value) {
    _$wealthSummaryAggregateAtom
        .reportWrite(value, super.wealthSummaryAggregate, () {
      super.wealthSummaryAggregate = value;
    });
  }

  final _$carregandoAtom = Atom(name: 'HomeStoreBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  @override
  String toString() {
    return '''
wealthSummary: ${wealthSummary},
wealthSummaryAggregate: ${wealthSummaryAggregate},
carregando: ${carregando}
    ''';
  }
}
