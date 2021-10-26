class WealthSummary {
	int? id;
	double? cdi;
	int? gain;
	bool? hasHistory;
	double? profitability;
	int? total;

	WealthSummary({
		this.id, 
		this.cdi, 
		this.gain, 
		this.hasHistory, 
		this.profitability, 
		this.total, 
	});

	@override
	String toString() {
		return 'WealthSummary(id: $id, cdi: $cdi, gain: $gain, hasHistory: $hasHistory, profitability: $profitability, total: $total)';
	}

	factory WealthSummary.fromJson(Map<String, dynamic> json) => WealthSummary(
				id: json['id'] as int?,
				cdi: (json['cdi'] as num?)?.toDouble(),
				gain: json['gain'] as int?,
				hasHistory: json['hasHistory'] as bool?,
				profitability: (json['profitability'] as num?)?.toDouble(),
				total: json['total'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'cdi': cdi,
				'gain': gain,
				'hasHistory': hasHistory,
				'profitability': profitability,
				'total': total,
			};
}
