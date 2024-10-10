class FaqResponse {
  final String message;
  final List<FaqCategory> data;

  FaqResponse({required this.message, required this.data});

  factory FaqResponse.fromJson(Map<String, dynamic> json) {
    return FaqResponse(
      message: json['message'],
      data: List<FaqCategory>.from(
        json['data'].map((item) => FaqCategory.fromJson(item)),
      ),
    );
  }
}

class FaqCategory {
  final String category;
  final List<FaqItem> faqs;

  FaqCategory({required this.category, required this.faqs});

  factory FaqCategory.fromJson(Map<String, dynamic> json) {
    return FaqCategory(
      category: json['category'],
      faqs: List<FaqItem>.from(
        json['faqs'].map((item) => FaqItem.fromJson(item)),
      ),
    );
  }
}

class FaqItem {
  final int id;
  final String question;
  final String answer;
  bool isExpanded;

  FaqItem({
    required this.id,
    required this.question,
    required this.answer,
    this.isExpanded = false, // Local state
  });

  factory FaqItem.fromJson(Map<String, dynamic> json) {
    return FaqItem(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}

class TicketBundle {
  final int id;
  final String title;
  final String description;
  final int raffleCount;
  final int discountPercent;

  TicketBundle({
    required this.id,
    required this.title,
    required this.description,
    required this.raffleCount,
    required this.discountPercent,
  });

  factory TicketBundle.fromJson(Map<String, dynamic> json) {
    return TicketBundle(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      raffleCount: json['raffle_count'],
      discountPercent: json['discount_percent'],
    );
  }
}

class Info {
  final String email;
  final String phone;

  Info({
    required this.email,
    required this.phone,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      email: json['email'],
      phone: json['phone'],
    );
  }
}
