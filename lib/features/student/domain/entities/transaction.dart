import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final int id;
  final int idUser;
  final String productName;
  final String category;
  final String codeTransaction;
  final String date;
  final String quantity;
  final int price;
  final int totalPrice;

  const TransactionEntity({
    required this.id,
    required this.idUser,
    required this.productName,
    required this.category,
    required this.codeTransaction,
    required this.date,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  @override
  List<Object?> get props {
    return [
      id,
      idUser,
      productName,
      category,
      codeTransaction,
      date,
      quantity,
      price,
      totalPrice,
    ];
  }
}
