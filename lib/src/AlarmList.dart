import 'package:budilnik/MainImports.dart';
import 'package:budilnik/src/homepage.dart';
import 'package:workmanager/workmanager.dart'; // для создания фонового процесса
import 'package:budilnik/src/HandlerWorkmanager.dart';

import 'package:budilnik/src/Widgets/BrLine.dart';
import 'package:budilnik/src/Widgets/AlarmClockCard.dart';

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
                )),
          ],
        ),
        backgroundColor: ColorBackground,
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: alarmClockList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: alarmClockList[index],
                  onLongPress: () async {
                    await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Удалить будильник?',
                            style: TextStyle(
                              color: ColorFont,
                              fontSize: 25,
                            )),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Отмена',
                                  style: TextStyle(
                                    color: ColorFont,
                                    fontSize: 20,
                                  ))),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  alarmClockList.removeAt(index);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('Удалить',
                                  style: TextStyle(
                                    color: ColorFont,
                                    fontSize: 20,
                                  ))),
                        ],
                      );
                    });
                  },
                );
              }),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          alignment: Alignment.bottomLeft,
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: Icon(
              Icons.home,
              size: 65,
              color: ColorMain1,
            ),
          ),
        ),
      ]),
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
