import 'wealth_summary.dart';
import 'wealth_summary_aggregate.dart';

class HomeModel {
	List<WealthSummary>? wealthSummary;
	WealthSummaryAggregate? wealthSummaryAggregate;

	HomeModel({this.wealthSummary, this.wealthSummaryAggregate});

	@override
	String toString() {
		return 'HomeModel(wealthSummary: $wealthSummary, wealthSummaryAggregate: $wealthSummaryAggregate)';
	}

	factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
				wealthSummary: (json['wealthSummary'] as List<dynamic>?)
						?.map((e) => WealthSummary.fromJson(e as Map<String, dynamic>))
						.toList(),
				wealthSummaryAggregate: json['wealthSummary_aggregate'] == null
						? null
						: WealthSummaryAggregate.fromJson(json['wealthSummary_aggregate'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'wealthSummary': wealthSummary?.map((e) => e.toJson()).toList(),
				'wealthSummary_aggregate': wealthSummaryAggregate?.toJson(),
			};
}
