// все цвета объявляем сдесь, они ведь общие
// все названия начинаем со слова 'Color' и пишем за что он отвечает, чтобы не запутаться
import 'package:flutter/material.dart';


// Палитра основных цветов используются только внутри этого файла
// Создаём их копию с более понятным названием и использовать уже ёё
const Color ColorMain1 = Color(0xFF2f1c7e);
const Color ColorMain2 = Color(0xFFeceaff);
// все это надо когда начнём переделывать дизайн.

const Color ColorBackground = ColorMain2;   // задний фон приложения
const Color ColorFont = ColorMain1;                 // шрифта

const Color ColorActiveSwitchThumb = ColorMain2;
const Color ColorActiveSwitchTrack = ColorMain1;
const Color ColorInactiveSwitchThumb = ColorMain1;
const Color ColorInactiveSwitchTrack = ColorMain2;

const Color ColorButton = ColorMain1;
const Color ColorPressedButton = ColorMain2;