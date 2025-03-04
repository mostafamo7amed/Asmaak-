import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class CustomDropdownList extends StatefulWidget {
  const CustomDropdownList({
    super.key,
    required this.onChanged,
    required this.list,
  });

  final ValueChanged<String> onChanged;
  final List<String> list;

  @override
  State<CustomDropdownList> createState() => _CustomGenderWidgetState();
}

class _CustomGenderWidgetState extends State<CustomDropdownList> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    if( widget.list.isNotEmpty){
      selectedItem = widget.list[0];
    }

    return DropdownButtonFormField2<String>(
      value: selectedItem,
      decoration: InputDecoration(
        filled: true,
        focusColor: AppColor.backgroundColor,
        fillColor: AppColor.backgroundColor,
        contentPadding: const EdgeInsets.only(top: 16, bottom: 16, right: 12),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: false,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        errorBorder: buildOutlineInputBorder(),
      ),
      items: widget.list
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: Styles.regular16.copyWith(color: AppColor.blackColor),
                ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedItem = value.toString();
          widget.onChanged(selectedItem!);
        });
      },
      iconStyleData: IconStyleData(
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColor.lightGrayColor,
            size: 30,
          ),
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColor.lightGrayColor,
        width: 1,
      ));
}
