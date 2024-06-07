import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final int id;
  final int idUser;
  final int idProduct;
  final String codeTransaction;
  final String date;
  final String quantity;
  final int price;
  final int totalPrice;

  const TransactionEntity({
    required this.id,
    required this.idUser,
    required this.idProduct,
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
      idProduct,
      codeTransaction,
      date,
      quantity,
      price,
      totalPrice,
    ];
  }
}
