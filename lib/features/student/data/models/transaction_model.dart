import 'package:school_app/features/student/domain/entities/transaction.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required super.id,
    required super.idUser,
    required super.productName,
    required super.category,
    required super.codeTransaction,
    required super.date,
    required super.quantity,
    required super.price,
    required super.totalPrice,
  }) : super();

  factory TransactionModel.fromjson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      idUser: json['id_user'],
      productName: json['product_name'],
      category: json['category'],
      codeTransaction: json['code_transaction'],
      date: json['date'],
      quantity: json['quantity'],
      price: json['price'],
      totalPrice: json['total_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "id_user": idUser,
      "product_name": productName,
      "category": category,
      "code_transaction": codeTransaction,
      "date": date,
      "quantity": quantity,
      "price": price,
      "total_price": totalPrice,
    };
  }
}
