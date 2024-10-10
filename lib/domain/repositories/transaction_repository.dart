import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getTransactions();
  Future<List<TransactionEntity>> getTransactionsByTime(DateTimeRange timeRange);
  Future<TransactionEntity> getTransaction(int id);
}
