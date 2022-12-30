import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_flutter/features/controller/themeChanger.dart';
import 'package:provider_with_mvvm_flutter/features/pages/newpage.dart';

class ThemeChangerPage extends StatefulWidget {
  const ThemeChangerPage({super.key});

  @override
  State<ThemeChangerPage> createState() => _ThemeChangerPageState();
}

class _ThemeChangerPageState extends State<ThemeChangerPage> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Mode"),
            value: ThemeMode.light,
            groupValue: state.themeMode,
            onChanged: (value) {
              print(value);
              state.setTheme(value);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: state.themeMode,
            onChanged: (value) {
              print(value);
              state.setTheme(value);
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewPage()));
            },
            child: Text("data"),
          ),
          // Container(
          //   child: FlutterSwitch(
          //     width: 125.0,
          //     height: 55.0,
          //     valueFontSize: 25.0,
          //     toggleSize: 45.0,
          //     value: false,
          //     borderRadius: 30.0,
          //     padding: 8.0,
          //     showOnOff: state.radiovalue,
          //     onToggle: (val) {
          //       state.checkTheme(val);
          //     },
          //   ),
          // ),
          FlutterSwitch(
            height: 35.0,
            width: 60.0,
            padding: 5.0,
            toggleSize: 20.0,
            borderRadius: 15.0,
            activeColor: Colors.purple,
            value: state.radiovalue,
            onToggle: (value) {
              setState(() {
                state.radiovalue = value;
                state.checkTheme(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
