import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/payload.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bootpay 결제'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '결제 금액',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _startPayment();
              },
              child: Text('결제하기'),
            ),
          ],
        ),
      ),
    );
  }

  void _startPayment() {
    double amount = double.tryParse(_amountController.text) ?? 0;

    if (amount < 100) { // 최소 금액 100원 체크
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('결제할 금액을 설정해주세요. (100원 이상)')),
      );
      return;
    }

    // Bootpay 인스턴스 생성
    final bootpay = Bootpay();

    // 결제 요청
    Payload payload = Payload()
      ..androidApplicationId = '66630410b365ba05bc1b00d5' // 여기에 발급받은 Application ID 입력
      ..price = amount
      ..orderId = 'order_id_${DateTime.now().millisecondsSinceEpoch}'
      ..pg = 'kcp'
      ..method = 'card'
      ..orderName = '상품 이름';

    bootpay.requestPayment(
      context: context,
      payload: payload,
      showCloseButton: false,
      onCancel: (String data) {
        print('------- onCancel: $data');
      },
      onError: (String data) {
        print('------- onError: $data');
      },
      onClose: () {
        print('------- onClose');
        Future.delayed(Duration(seconds: 0)).then((value) {
          if (mounted) {
            bootpay.dismiss(context); // 명시적으로 부트페이 뷰 종료 호출
          }
        });
      },
      onConfirm: (String data) {
        print('------- onConfirm: $data');
        return true;
      },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }
}
