import 'package:flutter/material.dart';

import '../../components/input_field.dart';
import '../../models/transfer.dart';

const _appBarTitle = 'New Transfer';
const _labelInputTargetAccount = 'Target Account';
const _hintInputTargetAccount = '0000-0';
const _labelInputValue = 'Transfer Value';
const _hintInputValue = '0.00';
const _labelButtonSend = 'Send';

class TransferForm extends StatefulWidget {
  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  TextEditingController _targetAccountController = TextEditingController();
  TextEditingController _transferValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
              controller: _targetAccountController,
              icon: Icons.account_balance,
              label: _labelInputTargetAccount,
              hint: _hintInputTargetAccount,
              keyboardType: TextInputType.numberWithOptions(
                signed: true,
              ),
            ),
            InputField(
              controller: _transferValueController,
              icon: Icons.monetization_on_outlined,
              label: _labelInputValue,
              hint: _hintInputValue,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text(_labelButtonSend),
                onPressed: () => _sendTransfer(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendTransfer(BuildContext context) {
    double transferValue = double.tryParse(_transferValueController.text);
    String targetAccount = _targetAccountController.text;

    if (transferValue != null && targetAccount != null) {
      Transfer transfer = Transfer(transferValue, targetAccount);
      Navigator.pop(context, transfer);
    }
  }
}
