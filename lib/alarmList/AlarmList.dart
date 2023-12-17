import 'package:budilnik/MainImports.dart';
import 'package:intl/intl.dart';

import 'package:budilnik/alarmList/Widgets/BrLine.dart';
import 'package:budilnik/alarmList/Widgets/AlarmClockCard.dart';

class alarmList extends StatefulWidget {
  @override
  State<alarmList> createState() => _alarmListState();
}

class _alarmListState extends State<alarmList> {
  List alarmClockList = [];

  @override
  void initState() {
    super.initState();
    TimeOfDay? now = TimeOfDay.now();
    alarmClockList.add(AlarmClockCard(alarmClockTime: now));
    alarmClockList.add(AlarmClockCard(alarmClockTime: now));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackground,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "ALARM LIST",
              style: TextStyle(
                color: ColorFont,
                fontSize: 40,
              ),
            ),
            Container(
                width: double.infinity,
                child: CustomPaint(
                  painter: BrLine(strokeWidth: 3),
                )
            ),
          ],
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
          AlarmClockCard newAlarmClockCard = AlarmClockCard(alarmClockTime: TimeOfDay.now());
          await newAlarmClockCard.setAlarmClockTimeFromTimePicker(context);
          setState(() {
            alarmClockList.add(newAlarmClockCard);
          });
        },
        child: const Icon(
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

/*          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: const Text('Добавить будильник'),
              content: TextField(
                onChanged: (String value){

                  //print(value);
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   alarmClockList.add(AlarmClockCard(hour: hour, min: min));
                      // });
                      Navigator.of(context).pop();
                    },
                    child: Text('Добавить'))
              ],
            );
          });*/
