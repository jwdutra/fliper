class Sum {
	int? gain;
	int? total;

	Sum({this.gain, this.total});

	@override
	String toString() => 'Sum(gain: $gain, total: $total)';

	factory Sum.fromJson(Map<String, dynamic> json) => Sum(
				gain: json['gain'] as int?,
				total: json['total'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'gain': gain,
				'total': total,
			};
}
