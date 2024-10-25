import 'package:flutter/material.dart';
import 'package:moviepedia/utils/colors.dart';

import '../custom_field/custom_field.dart';
class FormFieldMenu extends StatefulWidget {
  final List<String> _items;
  String _prefix;
  TextEditingController? textEditingController;
String? currentValue;
  set prefix(String value) {
    _prefix = value;
  }

  FormFieldMenu({super.key, 
    required items,
  required prefix,
    this.currentValue,
    this.textEditingController,
  }

  ):_items=items,
  _prefix=prefix;

  String get prefix => _prefix;

  List<String> get items=> _items;
@override
  State<FormFieldMenu> createState() => _FormFieldMenuState();
}

class _FormFieldMenuState extends State<FormFieldMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: DropdownButtonFormField<String>(

          value:widget.prefix ,
          onChanged: (newValue){
            setState(() {
              widget._prefix=newValue!;
            });
          },
            items: widget.items.map((String prefix) {
              return DropdownMenuItem<String>(
                value: prefix,
                child: Text(prefix),
              );
            }).toList(),
          borderRadius: BorderRadius.circular(10),
            decoration: const InputDecoration(
              enabledBorder:OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textColor,
                )
              ),
                border: OutlineInputBorder(
              )
            )
          ),
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomField(
              textInputType: TextInputType.phone,
              textEditingController: widget.textEditingController,
              color: AppColors.textColor,
              prefixIcon:const Icon(
                Icons.phone,
                color: AppColors.textColor2,
              ),
              hintcolor: AppColors.textColor,
              textHint: 'Enter your phone',),
          ),
        ),

      ],
    );}
}
