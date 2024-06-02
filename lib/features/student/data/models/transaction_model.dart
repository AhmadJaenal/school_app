import 'package:school_app/features/student/domain/entities/transaction.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required super.id,
    required super.idUser,
    required super.idProduct,
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
      idProduct: json['id_product'],
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
      "id_product": idProduct,
      "code_transaction": codeTransaction,
      "date": date,
      "quantity": quantity,
      "price": price,
      "total_price": totalPrice,
    };
  }

  static List<TransactionModel> fromJsonList(List data) {
    if (data.isEmpty) return [];
    return data
        .map((singleDataTransaction) =>
            TransactionModel.fromjson(singleDataTransaction))
        .toList();
  }
}
