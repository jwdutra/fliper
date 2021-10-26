class Avg {
	double? cdi;
	double? profitability;

	Avg({this.cdi, this.profitability});

	@override
	String toString() => 'Avg(cdi: $cdi, profitability: $profitability)';

	factory Avg.fromJson(Map<String, dynamic> json) => Avg(
				cdi: (json['cdi'] as num?)?.toDouble(),
				profitability: (json['profitability'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'cdi': cdi,
				'profitability': profitability,
			};
}
