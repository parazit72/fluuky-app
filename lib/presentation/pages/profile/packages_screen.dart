import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/domain/entities/order_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/bullet_list.dart';
import 'package:fluuky/presentation/widgets/custom_dropdown_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  _PackagesScreenState createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
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
      appBar: AppBarSingleWidget(title: t.translate('Packages')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        children: [
          Text(t.translate('Prebuy Tree-Planting Packages'), style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 2)),
          Text(t.translate('Receive additional credits when you prebuy bundle packages!'),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),

          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/tree-green.svg',
                        colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(t.translate('Planter Package'), style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  t.translate('Prebuy Amount: 5,000 AED'),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/percentage.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    Expanded(child: Text(t.translate('Receive an additional 5% credit (250 AED)'))),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/db.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    Expanded(child: Text(t.translate('Total credit in your FLUUKY account: 5,250 AED'))),
                  ],
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    // Get.toNamed(greenSubscription);
                  },
                  child: Text(t.translate('Buy Now')),
                ),
              ],
            ),
          ),

          // Profile image preview and change button

          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/tree-green.svg',
                        colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(t.translate('Forester Package'), style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  t.translate('Prebuy Amount: 10,000 AED'),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/percentage.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    Expanded(child: Text(t.translate('Receive an additional 10% credit (1000 AED)'))),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/db.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    Expanded(child: Text(t.translate('Total credit in your FLUUKY account: 11,000 AED'))),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/diamond.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    Expanded(child: Text(t.translate('directAccessForesterDsc'))),
                  ],
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    // Get.toNamed(greenSubscription);
                  },
                  child: Text(t.translate('Buy Now')),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.translate("terms_and_conditions"), style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 2)),
                const SizedBox(height: 16),
                BulletList(items: [
                  t.translate("Prebuy credit packages are non-refundable"),
                  t.translate("Credits from the prebuy packages are non-transferable and cannot be exchanged for cash. Credits do not expire."),
                  t.translate(
                      "Direct access to loyalty tiers through prebuy packages lasts for one year from the date of purchase. After one year, tier status will be determined by the regular criteria of the FLUUKY Loyalty Program."),
                ]),
              ],
            ),
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
