import 'aggregate.dart';

class WealthSummaryAggregate {
	Aggregate? aggregate;

	WealthSummaryAggregate({this.aggregate});

	@override
	String toString() => 'WealthSummaryAggregate(aggregate: $aggregate)';

	factory WealthSummaryAggregate.fromJson(Map<String, dynamic> json) {
		return WealthSummaryAggregate(
			aggregate: json['aggregate'] == null
						? null
						: Aggregate.fromJson(json['aggregate'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() => {
				'aggregate': aggregate?.toJson(),
			};
}
