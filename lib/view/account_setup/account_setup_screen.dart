// import 'package:ecommerce/controller/account_setup_controller.dart';
// import 'package:ecommerce/helpers/app_colors.dart';
// import 'package:ecommerce/helpers/app_padding.dart';
// import 'package:ecommerce/helpers/app_spacing.dart';
// import 'package:ecommerce/widgets/custom_button.dart';
// import 'package:ecommerce/widgets/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AccountSetupScreen extends StatelessWidget {
//   const AccountSetupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final accountSetupController =
//         Provider.of<AccountSetupController>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Fill up your profile"),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: AppPadding.mainPading,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomTextField(
//                     controller: accountSetupController.nameController,
//                     hint: "Full name",
//                     isDense: true,
//                     keyboardType: TextInputType.name,
//                   ),
//                   AppSpacing.kHeight10,
//                   CustomTextField(
//                     controller: accountSetupController.dateController,
//                     hint: "Date of birth",
//                     isDense: true,
//                     readOnly: true,
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         accountSetupController.pickDate(context);
//                       },
//                       icon: const Icon(
//                         Icons.calendar_today,
//                         color: AppColors.suffixIconColor,
//                       ),
//                     ),
//                   ),
//                   AppSpacing.kHeight10,
//                   CustomTextField(
//                     controller: accountSetupController.phoneController,
//                     hint: "Phone number",
//                     isDense: true,
//                     keyboardType: TextInputType.number,
//                   ),
//                   AppSpacing.kHeight10,
//                   DropdownButtonHideUnderline(
//                     child: DropdownButtonFormField<String>(
//                       isDense: true,
//                       decoration: const InputDecoration(
//                         hintText: "Gender",
//                         fillColor: AppColors.transparent,
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: AppColors.borderColor,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: AppColors.borderColor,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: AppColors.borderColor,
//                           ),
//                         ),
//                       ),
//                       value: accountSetupController.dropDownValue,
//                       items: ["Male", "Female"]
//                           .map((e) => DropdownMenuItem<String>(
//                               value: e, child: Text(e)))
//                           .toList(),
//                       onChanged: (value) {
//                         accountSetupController.setDropDownValue(value!);
//                       },
//                     ),
//                   ),
//                   AppSpacing.kHeight30,
//                   CustomButtonWidget(
//                     text: "Continue",
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
