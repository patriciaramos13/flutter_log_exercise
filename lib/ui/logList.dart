import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/log.dart';

class LogsPage extends StatelessWidget {
  final List<Log> _logs;
  Function _removeData;

  LogsPage(this._logs, this._removeData);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: LogList(_logs, _removeData),
      ),
    );
  }
}

class LogList extends StatelessWidget {
  final List<Log> _logs;
  final Function _removeData;

  LogList(this._logs, this._removeData);

  @override
  Widget build(BuildContext context) {
    return ListView(children: _buildLogList());
  }

  List<_LogListItem> _buildLogList() {
    return _logs.map((log) => _LogListItem(log, _logs, _removeData)).toList();
  }
}

class _LogListItem extends ListTile {
  _LogListItem(Log log, List _logs, Function _removeData)
      : super(
          title: Text(log.duration.toStringAsFixed(1) + ' - ' + log.project),
          subtitle: Text(log.remarks),
          trailing: FlatButton(
            // color: Colors.white,
            textColor: Colors.black54,
            onPressed: () {
              _removeData(log);
            },
            child: Text(
              '[ Delete ]',
            ),
          ),
        );
}
