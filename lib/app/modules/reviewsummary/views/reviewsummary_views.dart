import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/reviewsummary_controller.dart';

class ReviewsummaryView extends GetView<ReviewsummaryController> {
  const ReviewsummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Summary'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          _buildServiceInfo(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Booking Date', controller.bookingDate),
                    _buildInfoRow('Customer', controller.customerName),
                    const SizedBox(height: 20),
                    _buildAmountSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildAmountSection() {
    return Column(
      children: [
        _buildInfoRow('Amount', '\$${controller.amount}'),
        _buildInfoRow('Tax & Fees', '\$${controller.taxAndFees}'),
        const Divider(),
        _buildInfoRow('Total', '\$${controller.total}'),
      ],
    );
  }

  Widget _buildServiceInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/repair1.jpg', // Pastikan path disesuaikan dengan file gambar
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.serviceName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text(controller.serviceProvider),
                  const SizedBox(width: 8),
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text(controller.serviceRating),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
