class Sale {
  final int? id;
  final int custumerId;
  final String productName;
  final double price;
  final int quantity;
  final DateTime date;
  final String description;

  Sale({
    this.id,
    required this.custumerId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'custumer_id': custumerId,
      'product_name': productName,
      'price': price,
      'quantity': quantity,
      'date': date.toIso8601String(),
      'description': description,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Sale.fromMap(Map<String, dynamic> map) {
    return Sale(
      id: map['id'] as int?,
      custumerId: map['custumer_id'] as int,
      productName: map['product_name'] as String,
      price: (map['price'] as num).toDouble(),
      quantity: (map['quantity'] as num).toInt(),
      date: DateTime.parse(map['date'] as String),
      description: map['description'] as String,
    );
  }

  Sale copyWith({
    int? id,
    int? custumerId,
    String? productName,
    double? price,
    int? quantity,
    DateTime? date,
    String? description,
  }) {
    return Sale(
      id: id ?? this.id,
      custumerId: custumerId ?? this.custumerId,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Sale{id: $id, custumerId: $custumerId, productName: $productName, price: $price, quantity: $quantity, date: $date, description: $description}';
  }
}
