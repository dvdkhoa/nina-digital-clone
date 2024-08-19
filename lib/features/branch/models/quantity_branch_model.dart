class QuantityBranchModel {
  final String? name;
  final int? quantity;

  QuantityBranchModel({
    this.name,
    this.quantity,
  });

  QuantityBranchModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        quantity = json['quantity'] as int?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'quantity' : quantity
  };
}