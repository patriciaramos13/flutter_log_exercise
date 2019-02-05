import 'package:flutter/material.dart';
import 'package:flutter_exercise/ui/logData.dart';

class LogsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: LogList(sampleLogs),
      ),
    );
  }

}

class LogList extends StatelessWidget {

  final List<Log> _logs;

  LogList(this._logs);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: _buildLogList()
        );
  }

  List<_LogListItem> _buildLogList() {
    return _logs.map((contact) => _LogListItem(contact))
                    .toList();
  }

}

class _LogListItem extends ListTile {

  _LogListItem(Log log) :
    super(
      title : Text(log.duration.toStringAsFixed(2)),
      subtitle: Text(log.remarks),
    );

}