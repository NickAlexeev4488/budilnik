// все цвета объявляем сдесь, они ведь общие
// все названия начинаем со слова 'Color' и пишем за что он отвечает, чтобы не запутаться
import 'package:flutter/material.dart';

// Палитра основных цветов используются только внутри этого файла
// Создаём их копию с более понятным названием и использовать уже ёё
const Color ColorMain1 = Color(0xFF2f1c7e);
const Color ColorMain2 = Color(0xFFeceaff);
// все это надо когда начнём переделывать дизайн.

const Color ColorBackground = ColorMain2;             // задний фон приложения
const Color ColorFont = ColorMain1;                   // шрифта

const Color ColorActiveSwitchThumb = ColorMain2;      // кружочка на активном switch-е
const Color ColorActiveSwitchTrack = ColorMain1;      // трека(который под кружочком) на активном switch-е
const Color ColorInactiveSwitchThumb = ColorMain1;    // кружочка на неактивном switch-е
const Color ColorInactiveSwitchTrack = ColorMain2;    // трека(который под кружочком) на неактивном switch-е

const Color ColorButton = ColorMain1;                 // ненажатой кнопки
const Color ColorPressedButton = ColorMain2;          // кнопки при нажатии   TODO

const Color ColorBrLine = ColorMain1;                 // горизонтальной черты