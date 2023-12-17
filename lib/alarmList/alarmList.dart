import 'package:budilnik/MainImports.dart';

import 'package:intl/intl.dart';

import 'package:budilnik/alarmList/Widgets/alarmClockCard.dart';

class alarmList extends StatefulWidget {
  @override
  State<alarmList> createState() => _alarmListState();
}

class _alarmListState extends State<alarmList> {
  List alarmClockList = [];

  @override
  void initState() {
    super.initState();
    alarmClockList.add(alarmClockCard(hour: 11, min: 10));
    alarmClockList.add(alarmClockCard(hour: 12, min: 20));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackground,
      appBar: AppBar(
        title: Text(
          "ALARM LIST",
          style: TextStyle(
            color: ColorFont,
            fontSize: 40,
          ),
        ),
        backgroundColor: ColorBackground,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: alarmClockList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child:alarmClockList[index],
            onLongPress: () {
              setState(() {
                alarmClockList.removeAt(index);
              });
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorButton,
        onPressed: () async {
          int hour = 0;
          int min = 0;

          TimeOfDay? time = TimeOfDay.now();
          final selected = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          time = selected;

          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Добавить будильник'),
              content: TextField(
                onChanged: (String value){

                  //print(value);
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        alarmClockList.add(alarmClockCard(hour: hour, min: min));
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Добавить'))
              ],
            );
          });
        },
        child: Icon(
          Icons.add,
          color: ColorBackground,
        ),
      ),
    );
  }
}

/*Dismissible(
  key: Key("$index"),  UniqueKey
  child: alarmClockList[index],
);*/