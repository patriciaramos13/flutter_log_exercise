import 'package:flutter/material.dart';
import 'package:flutter_exercise/ui/logForm.dart';
import 'package:flutter_exercise/ui/logList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Logger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LogForm(),
    );
  }
}

// class Log {
// 	final double duration;
// 	final String project;
// 	final String remarks;

// 	const Log({this.duration, this.project, this.remarks});
// }

// class LogsList extends StatelessWidget {
// 	final List<Log> _logs;

// 	LogsList(this._logs);

// 	@override
// 	Widget build(BuildContext context) {
// 		return ListView(
// 			padding: EdgeInsets.symmetric(vertical: 8.0),
// 			children: _buildWorkList(),
// 		);
//   	}

//   	List<_WorkListItem> _buildWorkList() {
//     	return _logs?.map((log) => _WorkListItem(log))?.toList() ?? [];
//   	}
// }

// class _WorkListItem extends ListTile {
//   	_WorkListItem(Log log) :
//     super(
// 		title : Text(log.duration.toStringAsFixed(2)),
// 		subtitle: Text(log.project),
// 		leading: Text(log.remarks)
//     );
// }