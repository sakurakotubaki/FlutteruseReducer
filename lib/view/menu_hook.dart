import 'package:flutter/material.dart';
import 'package:hooks_cookbook/view/count_hook.dart';
import 'package:hooks_cookbook/view/dropdown_hook.dart';
import 'package:hooks_cookbook/view/radio_hook.dart';

/// [extensionで画面遷移のWidgetを作成する関数を作成]
extension BuildContextE on BuildContext {
  Future<void> to(Widget view) async {
    await Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) {
          return view;
        },
      ),
    );
  }
}

class MenuHook extends StatelessWidget {
  const MenuHook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Hook'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.to(const DropButtonHook());
              },
              child: const Text('DropdownButton Hook'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {
              context.to(const RadioHook());
            }, child: const Text('Radio Hook')),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {
              context.to(const CountHook());
            }, child: const Text('Count Hook'))
          ],
        ),
    ),);
  }
}
