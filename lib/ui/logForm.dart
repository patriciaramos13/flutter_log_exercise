import 'package:flutter/material.dart';
import 'package:flutter_exercise/ui/logData.dart';
import 'package:flutter_exercise/ui/logList.dart';

class LogForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogFormState(); 
}

class _LogFormState extends State<LogForm> {
	final _projects = ['Hydra','Dragon P2P', 'Dragon'];
	final double _formDistance = 5.0;
	List<Log> workLogs = sampleLogs;
  double totalHours = 0.00;

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
						Padding(
              padding: EdgeInsets.only(
								top: _formDistance,
								bottom: _formDistance
							),
              child: Text(
						  	'New Log',
							  textAlign: TextAlign.left,
							  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
						  ),
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
						Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                onPressed: () {
                  _postLog();
                },
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Submit',
                  textScaleFactor: 1.5,
                ),
              ),
            ),
						// Divider
						Divider(
							height: 50.0,
							color: Colors.black87,
						),
            Text(
							'Logs',
							textAlign: TextAlign.left,
							style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
						),
            Text(
							'Total log for the day ' + this.totalHours.toStringAsFixed(1) + 'hours',
							textAlign: TextAlign.left,
							style: TextStyle(fontSize: 15.0),
						),
						LogsPage(workLogs),
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

    Log log = Log(
      duration: _duration,
      project: _project,
      remarks: _remarks
    );

    workLogs.add(log);
    
    setState(() {
      this.workLogs = workLogs;
      this.totalHours = this.totalHours + _duration;
    });
  }
}