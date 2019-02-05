import 'package:flutter/material.dart';
import 'package:flutter_exercise/ui/logData.dart';

class LogsPage extends StatelessWidget {
  final List<Log> _logs;

  LogsPage(this._logs);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: LogList(_logs),
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
          children: _buildLogList()
        );
  }

  List<_LogListItem> _buildLogList() {
    return _logs.map((log) => _LogListItem(log, _logs))
                    .toList();
  }
}

class _LogListItem extends ListTile {

  _LogListItem(Log log, List _logs) :
    super(
      title : Text(log.duration.toStringAsFixed(1) + ' - ' + log.project),
      subtitle: Text(log.remarks),
      trailing: FlatButton(
        // color: Colors.white,
        textColor: Colors.black54,
        onPressed: () {
          // remove();
        },
        child: Text(
          '[ Delete ]',
        ),
      ),
    );
}