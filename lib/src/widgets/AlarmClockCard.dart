import 'package:budilnik/MainImports.dart';
import 'package:workmanager/workmanager.dart'; // для создания фонового процесса

import 'package:budilnik/src/Widgets/BrLine.dart';

class AlarmClockCard extends StatefulWidget {
  TimeOfDay alarmClockTime;
  int idAlarmClockTask; // TODO изменить vat на название класса или энума
  bool alarmClockState = true;

  String uniqueNameOfAlarmClock = UniqueKey().toString();

  AlarmClockCard({super.key, required this.alarmClockTime, required this.idAlarmClockTask});

  // вызывает окно с выбором времени. Не забудь про setStatus()
  Future<bool> setAlarmClockTimeFromTimePicker(BuildContext context) async {
    TimeOfDay? selectedAlarmClockTime = await showTimePicker(
      context: context,
      initialTime: alarmClockTime,
    );
    if (selectedAlarmClockTime != null) {
      alarmClockTime = selectedAlarmClockTime;
      return true;
    }
    return false;
  }

  // вызывает окно с выбором задачи. Не забудь про setStatus()
  Future<bool> setAlarmClockTaskFromTaskPicker(BuildContext context) async {
    int selectedIdAlarmClockTask = idAlarmClockTask;
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Выберите сложность',
                style: TextStyle(
                  color: ColorFont,
                  fontSize: 25,
                )),
            content: Container(
              height: 200,
              width: 100,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return IconButton(
                      //icon: Icon(Icons.question_mark),
                      //icon: index == selectedIdAlarmClockTask ? const Icon(Icons.question_mark) : allTaskIcons[index],
                      icon: allTaskIcons[index],
                      onPressed: () {
                        selectedIdAlarmClockTask = index;
                      },
                    );
                  }),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    selectedIdAlarmClockTask = -1; // отменить изменения
                    Navigator.of(context).pop();
                  },
                  child: Text('Отмена',
                      style: TextStyle(
                        color: ColorFont,
                        fontSize: 20,
                      ))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Выбрать',
                      style: TextStyle(
                        color: ColorFont,
                        fontSize: 20,
                      ))),
            ],
          );
        });
    if (selectedIdAlarmClockTask != -1) {
      idAlarmClockTask = selectedIdAlarmClockTask;
      return true;
    }
    return false;
  }

  Future<void> updateAlarmClockWorkmanager() async {
    await Workmanager().cancelByUniqueName(uniqueNameOfAlarmClock);
    print("censeled");
    if (alarmClockState) {
      TimeOfDay now = TimeOfDay.now();
      const int minutesPerDay = 60 * 24;
      int diffTime = (alarmClockTime.hour - now.hour) * 60 + (alarmClockTime.minute - now.minute) - 1;
      print("diff: $diffTime");
      diffTime = (diffTime + minutesPerDay) % minutesPerDay + 1;
      Duration duration = Duration(minutes: diffTime);
      print("time: ${duration.toString()}");
      Workmanager().registerPeriodicTask(uniqueNameOfAlarmClock, uniqueNameOfAlarmClock,
          //initialDelay: Duration(seconds: 10),  // TODO
          // frequency: Duration(minutes: 15)     // 15 минут это минимальный период
          initialDelay: duration,
          frequency: Duration(hours: 24),
          inputData: <String, dynamic>{
            "idTask": idAlarmClockTask,
          });
    }
  }

  @override
  State<AlarmClockCard> createState() => _AlarmClockCardState();
}

class _AlarmClockCardState extends State<AlarmClockCard> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Text(
                  widget.alarmClockTime.format(context),
                  style: TextStyle(
                    color: ColorFont,
                    fontSize: 60,
                  ),
                ),
                onTap: () {
                  widget.setAlarmClockTimeFromTimePicker(context).then((flagUpdate) {
                    if (flagUpdate) {
                      setState(() {});
                      widget.updateAlarmClockWorkmanager();
                    }
                  });
                },
              ),
              GestureDetector(
                child: allTaskIcons[widget.idAlarmClockTask],
                // child: const Icon(
                //   // TODO подставить иконку задачи
                //   Icons.question_mark,
                //   size: 60,
                //   color: ColorFont,
                // ),
                onTap: () {
                  widget.setAlarmClockTaskFromTaskPicker(context).then((flagUpdate) {
                    if (flagUpdate) {
                      setState(() {});
                      widget.updateAlarmClockWorkmanager();
                    }
                  });
                },
              ),
              Switch(
                //splashRadius: 500.0,
                activeColor: ColorActiveSwitchThumb,
                activeTrackColor: ColorActiveSwitchTrack,
                inactiveThumbColor: ColorInactiveSwitchThumb,
                inactiveTrackColor: ColorInactiveSwitchTrack,
                value: widget.alarmClockState,
                onChanged: (value) {
                  setState(() => widget.alarmClockState = value);
                  widget.updateAlarmClockWorkmanager();
                },
              ),
            ],
          )),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          width: double.infinity,
          child: CustomPaint(
            painter: BrLine(strokeWidth: 4),
          )),
    ]);
  }
}
