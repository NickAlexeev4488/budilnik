import 'package:budilnik/MainImports.dart';
// import 'package:intl/intl.dart';

import 'package:budilnik/alarmList/Widgets/BrLine.dart';
import 'package:budilnik/alarmList/Widgets/MySwitch.dart';

class AlarmClockCard extends StatefulWidget {
  TimeOfDay alarmClockTime;
  var alarmClockTask;     // TODO изменить vat на название класса или энума

  AlarmClockCard({super.key, required this.alarmClockTime, required this.alarmClockTask});

  Future<void> setAlarmClockTimeFromTimePicker(BuildContext context) async {
    TimeOfDay? selectedAlarmClockTime = await showTimePicker(
      context: context,
      initialTime: alarmClockTime,
    );
    if (selectedAlarmClockTime != null) {
      alarmClockTime = selectedAlarmClockTime;
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
                  style: const TextStyle(
                    color: ColorFont,
                    fontSize: 60,
                  ),
                ),
                onTap: () {
                  widget.setAlarmClockTimeFromTimePicker(context)
                      .then((value) => setState(() {}) );
                },
              ),
              GestureDetector(
                child: const Icon(
                  Icons.question_mark,
                  size: 60,
                  color: ColorFont,
                ),
              ),
              MySwitch(),
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
