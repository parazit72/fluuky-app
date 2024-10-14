import 'dart:io';
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
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

  Future<void> _pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      _authController.uploadProfileImage(_profileImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserEntity? user = _authController.user.value;
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('personalData')),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
            children: [
              Text(t.translate('yourPhoto'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
              Text(t.translate('uploadPhotoUnder2MB'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
              SizedBox(height: 16.h),

              // Profile image preview and change button
              Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => _showImageUploadSheetDialog(),
                      child: CircleAvatar(
                          radius: 50.w,
                          backgroundColor: FluukyTheme.secondaryColor,
                          child: user != null && user.avatar != null
                              ? ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: user.avatar!,
                                    width: 32.w,
                                    height: 32.w,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(),
                                    errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white),
                                  ),
                                )
                              : Icon(
                                  Icons.camera_alt,
                                  size: 30.w,
                                  color: FluukyTheme.thirdColor,
                                )

                          // :  AssetImage('assets/images/empty-wishlist.png') as ImageProvider, // Use a placeholder image if no image is selected
                          // child: _profileImage == null ? Icon(Icons.camera_alt, size: 50.w) : null,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    TextButton(
                      onPressed: _showImageUploadSheetDialog,
                      child: Text(t.translate('changePhoto')),
                    ),
                  ],
                ),
              ),

              Divider(height: 48.h),
              Text(t.translate('personalData'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
              Text(t.translate('manageAllYourPersonalInformation'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
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
            SizedBox(height: 24.h),
            InputTextFieldWidget(
                controller: _authController.firstNameController, labelText: t.translate('firstName'), hintText: t.translate('enterFirstName')),
            SizedBox(height: 24.h),
            InputTextFieldWidget(
                controller: _authController.lastNameController, labelText: t.translate('lastName'), hintText: t.translate('enterLastName')),
            SizedBox(height: 24.h),
            Text(t.translate('date_of_birth'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90.w,
                  child: CustomDropdownButton(
                    itemsKey: 'days_en',
                    onChanged: (value) => _selectedDay = value,
                    hintText: t.translate('day'),
                  ),
                ),
                SizedBox(
                  width: 130.w,
                  child: CustomDropdownButton(
                    itemsKey: 'months_en',
                    onChanged: (value) => _selectedMonth = value,
                    hintText: t.translate('month'),
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: CustomDropdownButton(
                    itemsKey: 'years',
                    onChanged: (value) => _selectedYear = value,
                    hintText: t.translate('year'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(t.translate('gender'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
            const SizedBox(height: 8),
            CustomDropdownButton(
              itemsKey: 'genders',
              onChanged: (value) => _selectedGender = value,
              hintText: t.translate('Select'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.translate('Processing Data'))),
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
              padding: EdgeInsets.all(20.w),
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
                    SizedBox(height: 20.h),
                    Text(t.translate('changePhoto'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                    Text(t.translate('chooseOneOfTheFollowing'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                    SizedBox(height: 5.h),
                    TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                        ),
                        onPressed: () => _pickImage(ImageSource.camera),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.camera_alt_rounded, size: 20.w, color: Colors.black),
                            SizedBox(width: 8.w),
                            Text(t.translate('takeAPhoto'), style: FluukyTheme.lightTheme.textTheme.labelMedium),
                          ],
                        )),
                    SizedBox(height: 5.w),
                    TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                        ),
                        onPressed: () => _pickImage(ImageSource.gallery),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.image, size: 20.w, color: Colors.black),
                            SizedBox(width: 8.w),
                            Text(t.translate('uploadFromGallery'), style: FluukyTheme.lightTheme.textTheme.labelMedium),
                          ],
                        )),
                    SizedBox(height: 5.w),
                    TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                        ),
                        onPressed: () {},
                        child: Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
                          Icon(Icons.delete, size: 20.w, color: FluukyTheme.redColor),
                          SizedBox(width: 8.w),
                          Text(
                            t.translate('removePhoto'),
                            style: FluukyTheme.lightTheme.textTheme.labelMedium!.copyWith(color: FluukyTheme.redColor),
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
