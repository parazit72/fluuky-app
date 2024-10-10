import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/transaction_entity.dart';
import 'package:fluuky/domain/repositories/transaction_repository.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final TransactionRepository transactionRepository;

  RxBool isLoading = false.obs;
  var transactions = <TransactionEntity>[].obs;
  var currentTransaction = Rxn<TransactionEntity>();
  var filteredTransactions = <TransactionEntity>[].obs;
  RxString timeFilter = ''.obs;

  TransactionController({required this.transactionRepository});

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  // Fetch all Transaction
  Future<void> fetchTransactions() async {
    try {
      isLoading.value = true;
      final fetchedTransactions = await transactionRepository.getTransactions();
      transactions.assignAll(fetchedTransactions);
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  // Fetch Transactions by date range
  Future<void> fetchTransactionsByDateRange(DateTimeRange dateRange) async {
    try {
      isLoading.value = true;
      final fetchedTransactions = await transactionRepository.getTransactionsByTime(dateRange);
      filteredTransactions.assignAll(fetchedTransactions);
      timeFilter.value = '${dateRange.start.toString().split(' ')[0]} - ${dateRange.end.toString().split(' ')[0]}';
    } catch (e) {
      isLoading.value = false;
      print('Error fetching transactions by date range: $e');
    }
  }

  // Clear date range filter
  void clearDateRangeFilter() {
    filteredTransactions.clear();
    timeFilter.value = '';
  }

  // Fetch a single Transaction by id
  Future<void> fetchTransactionById(int id) async {
    try {
      isLoading.value = true;
      final transaction = await transactionRepository.getTransaction(id);
      currentTransaction.value = transaction;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  // Get the current Transaction by ID
  TransactionEntity? getCurrentTransaction() {
    return currentTransaction.value;
  }

  // Check if a specific transaction exists in the list
  bool transactionExists(int id) {
    return transactions.any((transaction) => transaction.id == id);
  }
}
