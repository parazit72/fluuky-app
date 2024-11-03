class TransactionEntity {
  int? id;
  int? orderId;
  String? code;
  String? merchantReference;
  String? responseCode;
  int? amount;
  String? signature;
  String? currency;
  String? language;
  String? cardBin;
  String? status;
  String? type;
  String? description;
  String? reference;
  int? trees;
  int? tickets;
  String? resourceType;
  String? createdDate;

  TransactionEntity(
      {this.id,
      this.orderId,
      this.code,
      this.merchantReference,
      this.responseCode,
      this.amount,
      this.signature,
      this.currency,
      this.language,
      this.cardBin,
      this.status,
      this.type,
      this.description,
      this.reference,
      this.trees,
      this.tickets,
      this.resourceType,
      this.createdDate});

  TransactionEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    code = json['code'];
    merchantReference = json['merchant_reference'];
    responseCode = json['response_code'];
    amount = json['amount'];
    signature = json['signature'];
    currency = json['currency'];
    language = json['language'];
    cardBin = json['card_bin'];
    status = json['status'];
    type = json['type'];
    description = json['description'];
    reference = json['reference'];
    trees = json['trees'];
    tickets = json['tickets'];
    resourceType = json['resource_type'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['code'] = code;
    data['merchant_reference'] = merchantReference;
    data['response_code'] = responseCode;
    data['amount'] = amount;
    data['signature'] = signature;
    data['currency'] = currency;
    data['language'] = language;
    data['card_bin'] = cardBin;
    data['status'] = status;
    data['type'] = type;
    data['description'] = description;
    data['reference'] = reference;
    data['trees'] = trees;
    data['tickets'] = tickets;
    data['resource_type'] = resourceType;
    data['created_date'] = createdDate;
    return data;
  }
}
