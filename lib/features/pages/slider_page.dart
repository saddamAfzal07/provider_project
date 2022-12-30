import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_flutter/features/controller/slider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    print("Build call");
    final state = Provider.of<SliderClass>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sider page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderClass>(
            builder: (context, value, child) {
              return Slider(
                max: 1,
                min: 0,
                value: value.value,
                onChanged: (val) {
                  value.callSlider(val);
                },
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.green.withOpacity(
                    state.value,
                  ),
                  alignment: Alignment.center,
                  child: const Text("Container1"),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.red.withOpacity(
                    state.value,
                  ),
                  alignment: Alignment.center,
                  child: const Text("Container2"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
