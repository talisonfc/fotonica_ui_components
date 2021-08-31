
import 'package:flutter/material.dart';

extension TimeOfDayFormater on TimeOfDay {

  format(){
    return "$hour:$minute";
  }

}