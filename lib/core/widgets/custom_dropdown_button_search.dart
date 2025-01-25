import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/generated/l10n.dart';

class CustomDropdownButtonSearch extends StatelessWidget {
  const CustomDropdownButtonSearch({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.labels,
  });

  final String hint;
  final String? value;
  final List<String> items;
  // final List<DropdownMenuItem<String>> items;
  final void Function(String?) onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labels;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownSearch<String>(
        items: items,
        onChanged: onChanged,
        dropdownBuilder: (_, selectedItem) => Text(
          selectedItem ?? hint,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        popupProps: PopupProps.menu(
          itemBuilder: (_, item, isSelected) => ListTile(
            title: Text(
              item,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            selected: isSelected,
          ),
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(AppColor.primaryColor),
              labelText: S.of(context).search,
              suffixIcon: const Icon(Icons.search),
              hintText: S.of(context).search,
              hintStyle: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: labels,
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(AppColor.primaryColor),
          ),
        ),
      ),
      // child: DropdownButton<String>(
      //   value: value,
      //   hint: Text(hint),
      //   isExpanded: true,
      //   items: items,
      //   onChanged: onChanged,
      //   padding: EdgeInsets.zero,
      // ),
    );
    // return InputDecorator(
    //   decoration: InputDecoration(
    //     contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //     label: Text(labels ?? ''),
    //     suffixIcon: suffixIcon,
    //     prefixIcon: prefixIcon,
    //     hintText: hint,
    //     hintStyle: Theme.of(context).textTheme.bodySmall,
    //     border: buildBorder(),
    //     enabledBorder: buildBorder(),
    //     focusedBorder: buildBorder(AppColor.primaryColor),
    //   ),
    //   child: DropdownButtonHideUnderline(
    //     child: DropdownSearch<String>(
    //       items: items,
    //       onChanged: onChanged,
    //       dropdownBuilder: (_, selectedItem) => Text(
    //         selectedItem ?? hint,
    //         // style: TextStyle(color: Colors.black),
    //       ),
    //       dropdownDecoratorProps: DropDownDecoratorProps(
    //         dropdownSearchDecoration: InputDecoration(
    //           labelText: labels,
    //           // mode: Mode.BOTTOM_SHEET,
    //           // showSearchBox: true,
    //           hintText: hint,
    //           border: buildBorder(),
    //           enabledBorder: buildBorder(),
    //           focusedBorder: buildBorder(AppColor.primaryColor),
    //         ),
    //       ),
    //     ),
    //     // child: DropdownButton<String>(
    //     //   value: value,
    //     //   hint: Text(hint),
    //     //   isExpanded: true,
    //     //   items: items,
    //     //   onChanged: onChanged,
    //     //   padding: EdgeInsets.zero,
    //     // ),
    //   ),
    // );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.grey),
    );
  }
}



//  DropdownSearch<String>(
//                 items: countries.map((country) => country.name).toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedCountry = newValue;
//                     _selectedCity = null;
//                     loadCities(newValue!);
//                   });
//                 },
//                 selectedItem: _selectedCountry,
//                 popupProps: PopupProps.menu(
//                   itemBuilder: (_, item, isSelected) => ListTile(
//                     title: Text(item),
//                   ),
//                   showSearchBox: true,
//                   searchFieldProps: TextFieldProps(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       labelText: 'Search',
//                     ),
//                   ),
//                 ),
//                 dropdownBuilder: (_, selectedItem) => Text(
//                   selectedItem ?? 'اختر الدولة',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 dropdownDecoratorProps: DropDownDecoratorProps(
//                   dropdownSearchDecoration: InputDecoration(
//                     labelText: 'اختر الدولة',
//                     // mode: Mode.BOTTOM_SHEET,
//                     // showSearchBox: true,
//                     hintText: 'اختر الدولة',

//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
              
//               ),
             