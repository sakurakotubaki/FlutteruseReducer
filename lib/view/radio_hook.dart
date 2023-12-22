import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum Action {
  male,
  female,
}

enum Gender {
  male,
  female,
}

extension on Gender {
  String get displayName {
    switch (this) {
      case Gender.male:
        return '男性';
      case Gender.female:
        return '女性';
    }
  }
}

class RadioHook extends HookWidget {
  const RadioHook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ラジオボタンの状態をuseReducerで管理
    final selectedGender = useReducer<Gender?, Action>((state, action) {
      // dispatchでactionを発行してstateを更新する
      switch (action) {
        case Action.male:
          return Gender.male;
        case Action.female:
          return Gender.female;
      }
    }, initialState: Gender.male, initialAction: Action.male);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Hook'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'あなたの性別は${selectedGender.state?.displayName}です',
            ),
            // onChangedで選択された値をdispatchで発行する
            ListTile(
              title: const Text('Male'),
              leading: Radio<Gender>(
                value: Gender.male,
                groupValue: selectedGender.state,
                onChanged: (Gender? value) {
                  selectedGender.dispatch(Action.male);
                  print('選択された性別は${selectedGender.state?.displayName}です');
                },
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio<Gender>(
                value: Gender.female,
                groupValue: selectedGender.state,
                onChanged: (Gender? value) {
                  selectedGender.dispatch(Action.female);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
