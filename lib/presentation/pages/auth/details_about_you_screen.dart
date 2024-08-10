import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/widgets/custom_dropdown_button.dart';

import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import '../../controllers/auth/auth_controller.dart';

class DetailsAboutYouScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _selectedGender;
  String? _selectedYear;
  String? _selectedMonth;
  String? _selectedDay;

  DetailsAboutYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Register in 4 steps:', style: Theme.of(context).textTheme.bodySmall),
                Text('Step 3/4', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Details About You', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 5),
                Text('You’re almost there!', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.info_outline, size: 20, color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          'Please ensure your DOB and gender match your government-issued ID, this is mandatory for the delivery of prizes for draw winners.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text('Date of Birth', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                      child: CustomDropdownButton(
                        itemsKey: 'days_en',
                        onChanged: (value) => _selectedDay = value,
                        hintText: 'day',
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.37,
                      child: CustomDropdownButton(
                        itemsKey: 'months_en',
                        onChanged: (value) => _selectedMonth = value,
                        hintText: 'month',
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomDropdownButton(
                        itemsKey: 'years',
                        onChanged: (value) => _selectedYear = value,
                        hintText: 'year',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text('Gender', style: Theme.of(context).textTheme.bodySmall),
                CustomDropdownButton(
                  itemsKey: 'genders',
                  onChanged: (value) => _selectedGender = value,
                  hintText: 'Select',
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   _authController.verifyCode();
                    // }
                    Get.toNamed(createdPassword);
                  },
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
