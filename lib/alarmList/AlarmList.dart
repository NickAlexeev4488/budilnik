import 'package:budilnik/MainImports.dart';

import 'package:workmanager/workmanager.dart';    // для создания фонового процесса
import 'package:budilnik/alarmList/HandlerWorkmanager.dart';

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

    print("init");
    Workmanager().initialize(
      handlerWorkmanager,
      isInDebugMode: true,
    );
    Workmanager().cancelAll();

    TimeOfDay? now = TimeOfDay.now();
    alarmClockList.add(AlarmClockCard(alarmClockTime: now, idAlarmClockTask: 0));
    alarmClockList.add(AlarmClockCard(alarmClockTime: now, idAlarmClockTask: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackground,
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
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
                )),
          ],
        ),
        backgroundColor: ColorBackground,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: alarmClockList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: alarmClockList[index],
              onLongPress: () {
                setState(() {
                  alarmClockList.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorButton,
        onPressed: () async {
          AlarmClockCard newAlarmClockCard = AlarmClockCard(alarmClockTime: TimeOfDay.now(), idAlarmClockTask: 0);
          bool flagUpdate = await newAlarmClockCard.setAlarmClockTimeFromTimePicker(context);
          if (flagUpdate) {
            flagUpdate = await newAlarmClockCard.setAlarmClockTaskFromTaskPicker(context);
            if (flagUpdate) {
              newAlarmClockCard.updateAlarmClockWorkmanager();
              setState(() {
                alarmClockList.add(newAlarmClockCard);
              });
            }
          }
        },
        child: IconAddAlarmClock,
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
