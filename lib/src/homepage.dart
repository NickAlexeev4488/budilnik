// ignore_for_file: library_private_types_in_public_api
import 'dart:async';
import 'package:budilnik/MainImports.dart';
import 'package:budilnik/src/AlarmList.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorMain2,
      body: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 100.0),
          child: const Image(
            image: AssetImage('images/alarmer.jpg'),
          ),
          height: 100,
        ),
        Container(
            margin: const EdgeInsets.only(top: 50.0),
            alignment: Alignment.center,
            width: 300,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
                  color: ColorMain1,
                  width: 6,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: RealTimeClock()),
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 15.0, top: 273.0),
              alignment: Alignment.bottomLeft,
              child: Switch(
                //splashRadius: 500.0,
                activeColor: ColorActiveSwitchThumb,
                activeTrackColor: ColorActiveSwitchTrack,
                inactiveThumbColor: ColorInactiveSwitchThumb,
                inactiveTrackColor: ColorInactiveSwitchTrack,
                value: isPressed,
                onChanged: (value) {
                  setState(() => isPressed = !isPressed);
                  var temp = ColorMain1;
                  ColorMain1 = ColorMain2;
                  ColorMain2 = temp;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 230.0, top: 270.0),
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => alarmList()));
                },
                icon: Icon(
                  Icons.list,
                  size: 70,
                  color: ColorMain1,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class RealTimeClock extends StatefulWidget {
  @override
  _RealTimeClockState createState() => _RealTimeClockState();
}

class _RealTimeClockState extends State<RealTimeClock> {
  late String currentTime;

  @override
  void initState() {
    super.initState();

    // Set the initial time
    updateTime();

    // Set up a timer to update the time every second
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      updateTime();
    });
  }

  void updateTime() {
    // Get the current time
    DateTime now = DateTime.now().add(const Duration(hours: 3));
    var formattedTime = DateFormat('HH:mm').format(now);

    // Format the time as a string
    setState(() {
      currentTime = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      currentTime,
      style: TextStyle(
        color: ColorMain1,
        fontSize: 64.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
