import 'package:constructo_user/app.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main(){
 initializeDateFormatting().then((_) => runApp(MyApp()));
}
