import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum MENU {
  BRUNCH,
  LUNCH,
  DINNER,
}

extension on MENU {
  String get displayName {
    switch (this) {
      case MENU.BRUNCH:
        return '朝食';
      case MENU.LUNCH:
        return 'ランチ';
      case MENU.DINNER:
        return 'ディナー';
    }
  }
}

class DropButtonHook extends HookWidget {
  const DropButtonHook({super.key});

  @override
  Widget build(BuildContext context) {
    // dropdownの状態をuseReducerで管理
    final selectedMenu = useReducer<MENU?, MENU>((state, action) {
      switch (action) {
        case MENU.BRUNCH:
          return MENU.BRUNCH;
        case MENU.LUNCH:
          return MENU.LUNCH;
        case MENU.DINNER:
          return MENU.DINNER;
      }
    }, initialState: MENU.BRUNCH, initialAction: MENU.BRUNCH);
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropdownButton Hook'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'あなたの選択したメニューは${selectedMenu.state?.displayName}です',
            ),
            // DropdownButtonで選択されたメニューをstateに反映する
            DropdownButton<MENU>(
              value: selectedMenu.state,
              onChanged: (MENU? value) {
                selectedMenu.dispatch(value!);
                print('選択されたメニューは${selectedMenu.state?.displayName}です');
              },
              items: const [
                DropdownMenuItem(
                  value: MENU.BRUNCH,
                  child: Text('朝食'),
                ),
                DropdownMenuItem(
                  value: MENU.LUNCH,
                  child: Text('ランチ'),
                ),
                DropdownMenuItem(
                  value: MENU.DINNER,
                  child: Text('ディナー'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
