import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalennderScreen extends StatefulWidget {
  const EventCalennderScreen({super.key});

  @override
  State<EventCalennderScreen> createState() => _EventCalennderScreenState();
}

class _EventCalennderScreenState extends State<EventCalennderScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customPSBAppBar(
            TextSize20("Event Calendar",
                fontweignt: FontWeight.bold, color: AllColor.white),
            centerTitle: false, onPressed: () {
          Navigator.pop(context);
        }, onPressed1: () {}, onPressed2: () {}),
        body: Column(
          children: [
            Container(
                width: sizeWidth,
                height: 34,
                color: AllColor.lightorangee,
                child: Center(
                  child: madiumText15(AllString.giridharShitaram,
                      color: AllColor.white),
                )),
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime(2022),
              lastDay: DateTime(2025),
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,
              rowHeight: 50,
              daysOfWeekHeight: 30,
              headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                      color: AllColor.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  formatButtonTextStyle: TextStyle(
                      color: AllColor.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  formatButtonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AllColor.primaryColor)),
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: AllColor.primaryColor,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: AllColor.primaryColor,
                  )),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(
                  color: AllColor.red,
                ),
              ),
              calendarStyle: CalendarStyle(
                  weekendTextStyle: TextStyle(
                    color: AllColor.red,
                  ),
                  todayDecoration: BoxDecoration(
                      color: AllColor.primaryColor, shape: BoxShape.circle),
                  selectedDecoration: BoxDecoration(
                      color: AllColor.yellow, shape: BoxShape.circle)),
              onDaySelected: (selectedDay, focusedday) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedday;
                  });
                }
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
            )
          ],
        ));
  }
}
