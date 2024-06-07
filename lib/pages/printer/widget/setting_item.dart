import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:string_validator/string_validator.dart';

class NumberSettingItem extends SettingItem<int> {
  final int? minValue;
  final int? maxValue;
  const NumberSettingItem({
    super.key,
    required super.title,
    required super.value,
    super.onCommit,
    this.minValue,
    this.maxValue,
  }) : super(textInputType: TextInputType.number);

  @override
  int? parser(String? str) {
    if (str == null) return null;
    try {
      return int.parse(str);
    } catch (e) {
      return null;
    }
  }

  @override
  String? validator(String? str) {
    if (str == null) return null;
    if (str.isInt) {
      final r = parser(str);

      if (r == null) {
        return '解析错误';
      }

      final int minInt = minValue ?? -0x80000000;
      final int maxInt = maxValue ?? 0x7fffffff;

      if (r < minInt || r > maxInt) {
        return '超出范围';
      }

      return null;
    } else {
      return '请输入整数';
    }
  }
}

abstract class SettingItem<T> extends StatelessWidget {
  final T value;
  final String title;
  final void Function(T)? onCommit;
  final TextInputType? textInputType;

  const SettingItem({
    super.key,
    required this.title,
    required this.value,
    this.onCommit,
    this.textInputType,
  });

  T? parser(String? str) {
    if (str == null) return null;
    try {
      return str as T;
    } catch (e) {
      return null;
    }
  }

  String? validator(String? str) {
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final str = await prompt(
          context,
          keyboardType: textInputType,
          validator: validator,
          title: Text(title),
          initialValue: value.toString(),
          barrierDismissible: true,
          textOK: const Text('确定'),
          textCancel: const Text('取消'),
          canPop: true,
          isSelectedInitialValue: true
        );

        if (str == null) return;

        if (onCommit == null) return;

        final res = parser(str);

        if (res == null) return;

        onCommit!(res);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(color: HexColor('#dbe4ee'), borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: HexColor('#1a7072')),
            ),
            Row(
              children: [
                Text(value.toString()),
                const SizedBox(width: 10),
                const Icon(Icons.edit, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
