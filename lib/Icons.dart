// все Иконки объявляем сдесь, они ведь общие
// все названия начинаем со слова 'Icon' и пишем за что он отвечает, чтобы не запутаться
import 'package:flutter/material.dart';
import 'package:budilnik/Colors.dart';

const Icon IconAddAlarmClock = const Icon(
  Icons.add,
  color: ColorBackground,
);

const List allTaskIcons = [
  // поменяйте названия если там у задач другие названия, и возможно нужно их в 1 массив запихнуть
  Icon(
    Icons.one_x_mobiledata,
    color: ColorMain1,      // TODO заменить или убрать цвет
    size: 50,
  ),
  Icon(
    Icons.looks_two_rounded,
    color: ColorMain1,      // TODO заменить или убрать цвет
    size: 50,
  ),
  Icon(
    Icons.three_g_mobiledata,
    color: ColorMain1,      // TODO заменить или убрать цвет
    size: 50,
  ),
];