import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountHook extends HookWidget {
  const CountHook({super.key});

  @override
  Widget build(BuildContext context) {
    // カウンターの状態をuseReducerで管理する
    final count = useReducer((state, action) => state + 1, initialState: 0, initialAction: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Hook'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => count.dispatch(0),// dispatchでactionを発行してstateを更新する
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          '${count.state}',
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
