import 'package:flutter/material.dart';
import 'package:flutter_exercise/ui/logList.dart';
import 'package:flutter_exercise/ui/logData.dart';

class LogForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogFormState(); 
}

class _LogFormState extends State<LogForm> {
	final _projects = ['Hydra','Dragon P2P', 'Dragon'];
	final double _formDistance = 5.0;
	// List<Log> workLogs;
	String _project = 'Hydra';

	TextEditingController durationController = TextEditingController();
	TextEditingController remarksController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		TextStyle textStyle = Theme.of(context).textTheme.title;

		return Scaffold(
		appBar: AppBar(
				title: Text('Work Logger'),
				backgroundColor: Colors.blueAccent,
			),
			body: Container(
				padding: EdgeInsets.all(15.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: <Widget>[
						// New Log Title
						Text(
							'New Log',
							textAlign: TextAlign.left,
							style: TextStyle(fontWeight: FontWeight.bold),
						),
						// Duration TextInput
						Padding(
							padding: EdgeInsets.only(
								top: _formDistance,
								bottom: _formDistance
							),
							child: TextField(
								controller: durationController,
								decoration: InputDecoration(
									labelText: 'Duration',
									hintText: 'e.g 1.0',
									labelStyle: textStyle,
									border: OutlineInputBorder(
										borderRadius: BorderRadius.circular(5.0)
									)
								),
								keyboardType: TextInputType.number,
							)
						),
						// Project Dropdown
						Padding(
							padding: EdgeInsets.only(
								top: _formDistance,
								bottom: _formDistance
							),
							child: DropdownButton<String>(
								items: _projects.map((String value){
									return DropdownMenuItem<String>(
										value: value,
										child: new Text(value),
									);
								}).toList(), 
								value: _project,
									onChanged: (String value) {
									_onDropdownChanged(value);
								},
							)
						),
						// Remarks
						Padding(
							padding: EdgeInsets.only(
								top: _formDistance,
								bottom: _formDistance
							),
							child: TextField(
								controller: remarksController,
								decoration: InputDecoration(
									labelText: 'Remarks',
									labelStyle: textStyle,
									border: OutlineInputBorder(
										borderRadius: BorderRadius.circular(5.0)
									)
								),
							)
						),
						// Submit Button
						RaisedButton(
							color: Theme.of(context).primaryColorDark,
							textColor: Theme.of(context).primaryColorLight,
							padding: EdgeInsets.all(5.0),
							onPressed: () {
								_postLog();
							},
							child: Text(
								'Submit',
								textScaleFactor: 1.5,
							),
						),
						// Divider
						Divider(
							height: 50.0,
							color: Colors.black87,
						),
						LogsPage(),
					],
				),
			)
		);
	}

	void _onDropdownChanged(String value){
		setState(() {
			this._project = value;
		});
	}

  	void _postLog() {
		double _duration = double.parse(durationController.text);
		String _remarks = remarksController.text;

		// Log(
		// 	duration: _duration,
		// 	project: _project,
		// 	remarks: _remarks
		// );
  	}
}