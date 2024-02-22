class ReviewModel {
  int reviewId;
  String reviewerName;
  String reviewNote;
  int reviewRate;
  int itemId;
  DateTime reviewDate;

  ReviewModel({
    required this.reviewId,
    required this.reviewerName,
    required this.reviewNote,
    required this.reviewRate,
    required this.itemId,
    required this.reviewDate,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewId: json['review_id'],
      reviewerName: json['reviewer_name'],
      reviewNote: json['review_note'],
      reviewRate: json['review_rate'],
      itemId: json['item_id'] ?? 0,
      reviewDate: DateTime.parse(json['review_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'review_id': reviewId,
      'reviewer_name': reviewerName,
      'review_note': reviewNote,
      'review_rate': reviewRate,
      'item_id': itemId,
      'review_date': reviewDate.toIso8601String(),
    };
  }
}
