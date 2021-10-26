import 'dart:developer';

import 'package:fliper/app/app_config.dart';
import 'package:fliper/app/modules/home/models/wealth_summary.dart';
import 'package:fliper/app/modules/home/models/wealth_summary_aggregate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fliper/app/modules/home/models/home_model.dart';

import 'package:graphql/client.dart';

@Injectable()
class HomeRepository extends Disposable {
  Future<HomeModel> dadosHome() async {
    final HttpLink httpLink = HttpLink(
      AppConfigs.urlBackend,
      defaultHeaders: {
        'x-hasura-admin-secret': AppConfigs.authBackend,
      },
    );

    var client = GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: httpLink,
    );

    String query = """{
      wealthSummary {
        id
        cdi
        gain
        hasHistory
        profitability
        total
      }
      wealthSummary_aggregate {
        aggregate {
          avg {
            cdi
            profitability
          }
          sum {
            gain
            total
          }
        }
      }
    }""";

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: <String, dynamic>{},
    );

    final QueryResult response = await client.query(options);

    HomeModel homeModel = new HomeModel();
    List<WealthSummary> wealthSummary = [];

    for (var v in response.data!['wealthSummary']) {
      wealthSummary.add(WealthSummary.fromJson(v));
    }

    homeModel.wealthSummary = wealthSummary;
    homeModel.wealthSummaryAggregate = WealthSummaryAggregate.fromJson(
        response.data!['wealthSummary_aggregate']);

    inspect(homeModel);

    return homeModel;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
