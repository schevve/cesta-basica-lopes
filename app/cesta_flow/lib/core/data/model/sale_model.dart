class Sale {
  final int id;
  final String productName;
  final double price;
  final int quantity;
  final DateTime date;
  final String description;

  Sale({
    required this.id,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.date,
    required this.description,
  });
}
