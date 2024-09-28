// ignore_for_file: public_member_api_docs, sort_constructors_first
class Rating {
  double rate;
  int count;
  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
