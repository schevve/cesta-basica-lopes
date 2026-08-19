class Payment {
  final int? id;
  final int custumerId;
  final String method;
  final double amount;
  final DateTime date;

  Payment({
    this.id,
    required this.custumerId,
    required this.method,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'custumer_id': custumerId,
      'method': method,
      'amount': amount,
      'date': date.toIso8601String(),
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'] as int?,
      custumerId: map['custumer_id'] as int,
      method: map['method'] as String,
      amount: (map['amount'] as num).toDouble(),
      date: DateTime.parse(map['date'] as String),
    );
  }

  Payment copyWith({
    int? id,
    int? custumerId,
    String? method,
    double? amount,
    DateTime? date,
  }) {
    return Payment(
      id: id ?? this.id,
      custumerId: custumerId ?? this.custumerId,
      method: method ?? this.method,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'Payment{id: $id, custumerId: $custumerId, method: $method, amount: $amount, date: $date}';
  }
}
