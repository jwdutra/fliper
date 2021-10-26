import 'avg.dart';
import 'sum.dart';

class Aggregate {
	Avg? avg;
	Sum? sum;

	Aggregate({this.avg, this.sum});

	@override
	String toString() => 'Aggregate(avg: $avg, sum: $sum)';

	factory Aggregate.fromJson(Map<String, dynamic> json) => Aggregate(
				avg: json['avg'] == null
						? null
						: Avg.fromJson(json['avg'] as Map<String, dynamic>),
				sum: json['sum'] == null
						? null
						: Sum.fromJson(json['sum'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'avg': avg?.toJson(),
				'sum': sum?.toJson(),
			};
}
