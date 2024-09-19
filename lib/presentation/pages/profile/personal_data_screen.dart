import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/custom_dropdown_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  File? _profileImage;

  String? _selectedGender;
  String? _selectedYear;
  String? _selectedMonth;
  String? _selectedDay;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('personalData')),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            children: [
              Text(t.translate('yourPhoto'), style: Theme.of(context).textTheme.titleLarge),
              Text(t.translate('uploadPhotoUnder2MB'), style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 16),

              // Profile image preview and change button
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                      // : const AssetImage('assets/images/empty-wishlist.png') as ImageProvider, // Use a placeholder image if no image is selected
                      child: _profileImage == null ? const Icon(Icons.camera_alt, size: 50) : null,
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: _showImageUploadSheetDialog,
                      child: Text(t.translate('changePhoto')),
                    ),
                  ],
                ),
              ),

              const Divider(height: 48),
              Text(t.translate('personalData'), style: Theme.of(context).textTheme.titleLarge),
              Text(t.translate('manageAllYourPersonalInformation'), style: Theme.of(context).textTheme.bodySmall),
              registerWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Widget registerWidget() {
    var t = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputTextFieldWidget(
                controller: _authController.firstNameController, labelText: t.translate('firstName'), hintText: t.translate('enterFirstName')),
            const SizedBox(height: 20),
            InputTextFieldWidget(
                controller: _authController.lastNameController, labelText: t.translate('lastName'), hintText: t.translate('enterLastName')),
            const SizedBox(height: 20),
            Text(t.translate('date_of_birth'), style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: CustomDropdownButton(
                    itemsKey: 'days_en',
                    onChanged: (value) => _selectedDay = value,
                    hintText: t.translate('day'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.37,
                  child: CustomDropdownButton(
                    itemsKey: 'months_en',
                    onChanged: (value) => _selectedMonth = value,
                    hintText: t.translate('month'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: CustomDropdownButton(
                    itemsKey: 'years',
                    onChanged: (value) => _selectedYear = value,
                    hintText: t.translate('year'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(t.translate('gender'), style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            CustomDropdownButton(
              itemsKey: 'genders',
              onChanged: (value) => _selectedGender = value,
              hintText: t.translate('select'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.translate('processing_data'))),
                  );
                  // Get.offAll(() => VerificationScreen(), arguments: {'email': _authController.emailController.text});

                  // _authController.registerWithEmail();
                }
              },
              child: Text(t.translate('saveChanges')),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageUploadSheetDialog() {
    // Get.back();
    var t = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.36,
          minChildSize: 0.36,
          maxChildSize: 0.36,
          builder: (context, scrollController) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(t.translate('changePhoto'), style: Theme.of(context).textTheme.titleLarge),
                    Text(t.translate('chooseOneOfTheFollowing'),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
                    const SizedBox(height: 5),
                    TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                        ),
                        onPressed: _pickImage,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.camera_alt_rounded, size: 20, color: Colors.black),
                            const SizedBox(width: 8),
                            Text(t.translate('takeAPhoto'), style: const TextStyle(color: Colors.black)),
                          ],
                        )),
                    const SizedBox(height: 5),
                    TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                        ),
                        onPressed: _pickImage,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.image, size: 20, color: Colors.black),
                            const SizedBox(width: 8),
                            Text(t.translate('uploadFromGallery'), style: const TextStyle(color: Colors.black)),
                          ],
                        )),
                    const SizedBox(height: 5),
                    TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                        ),
                        onPressed: () {},
                        child: Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
                          const Icon(Icons.delete, size: 20, color: Color(0XFFD30201)),
                          const SizedBox(width: 8),
                          Text(
                            t.translate('removePhoto'),
                            style: const TextStyle(color: Color(0XFFD30201)),
                          )
                        ])),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
