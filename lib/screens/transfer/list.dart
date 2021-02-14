import 'package:flutter/material.dart';

import '../../models/transfer.dart';
import 'form.dart';

const _appBarTitle = 'Transfers';
const _buttonTooltip = 'New Transfer';
const _labelValue = 'Value:';
const _labelTargetAccount = 'Target account:';

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  _TransfersListState createState() => _TransfersListState();
}

class _TransfersListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          Transfer transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        tooltip: _buttonTooltip,
        onPressed: () => _addTransfer(context),
      ),
    );
  }

  void _addTransfer(BuildContext context) {
    Navigator.push<Transfer>(
      context,
      MaterialPageRoute(
        builder: (context) => TransferForm(),
      ),
    ).then((receivedTransfer) {
      if (receivedTransfer != null) {
        setState(() {
          widget._transfers.add(receivedTransfer);
        });
      }
    });
  }
}

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  TransferItem(this.transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text('$_labelValue \$${transfer.value}'),
        subtitle: Text('$_labelTargetAccount ${transfer.targetAccount}'),
      ),
    );
  }
}
