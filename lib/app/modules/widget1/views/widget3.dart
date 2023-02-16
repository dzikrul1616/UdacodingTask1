import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Widget3 extends StatefulWidget {
  const Widget3({Key? key}) : super(key: key);

  @override
  State<Widget3> createState() => _Widget3State();
}

class _Widget3State extends State<Widget3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          LayoutBuilder(builder: (context, constraint) {
            List items = [
              {
                "label": "Flutter",
                "value": "Flutter",
              },
              {
                "label": "Java",
                "value": "Java",
                "checked": true,
              },
              {
                "label": "C#",
                "value": "C#",
              }
            ];
            return FormField(
              initialValue: false,
              enabled: true,
              builder: (FormFieldState<bool> field) {
                return InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    errorText: field.errorText,
                    border: InputBorder.none,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      var item = items[index];

                      return CheckboxListTile(
                        title: Text("${item["label"]}"),
                        value: item["checked"] ?? false,
                        onChanged: (value) {
                          field.didChange(true);
                        },
                      );
                    },
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
