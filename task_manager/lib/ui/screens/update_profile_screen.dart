import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/model/user_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilites/urls.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicetor.dart';
import 'package:task_manager/ui/widgets/profile_app_bar.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _fnTEController = TextEditingController();
  final TextEditingController _lnTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  XFile? _selectedImage;
  bool _updateProfileInProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    final userData = AuthController.userData!;
    _emailTEController.text = userData.email ?? ' ';
    _fnTEController.text = userData.firstName ?? ' ';
    _lnTEController.text = userData.lastName ?? ' ';
    _mobileTEController.text = userData.mobile ?? ' ';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Update Profile Screen',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  _buildPhotoPickerWidget(),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: 'Email'),
                    enabled: false,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _fnTEController,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _lnTEController,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _mobileTEController,
                    decoration: InputDecoration(hintText: 'Mobile'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: _updateProfileInProgress == false,
                    replacement: CenteredProgressIndicetor(),
                    child: ElevatedButton(
                      onPressed: () {
                        _updateProfile();
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPickerWidget() {
    return GestureDetector(
      onTap: () {
        _pickProfileImage();
      },
      child: Container(
        width: double.maxFinite,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Photo',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16),
              ),
              //child: ,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              _selectedImage?.name ?? 'No image selected',
              maxLines: 1,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> _updateProfile() async {
    _updateProfileInProgress = true;
    String _encodedPhoto = AuthController.userData?.photo ?? ' ';
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text,
      "firstName": _fnTEController.text,
      "lastName": _lnTEController.text,
      "mobile": _mobileTEController.text,
    };
    if (_passwordTEController.text.isNotEmpty) {
      requestBody['password'] = _passwordTEController.text;
    }
    if (_selectedImage != null) {
      File file = File(_selectedImage!.path);
      _encodedPhoto = base64Encode(file.readAsBytesSync());
      requestBody['photo'] = base64Encode(file.readAsBytesSync());
    }
    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.upDateProfile, body: requestBody);
    if (response.isSuccess && response.responseData['status'] == 'success') {
      UserModel userModel = UserModel(
        email: _emailTEController.text,
        photo: _encodedPhoto,
        firstName: _fnTEController.text,
        lastName: _lnTEController.text,
        mobile: _mobileTEController.text,
      );
      AuthController.saveUserData(userModel);
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Profile Updated');
      }
    } else {
      showSnackBarMessage(context,
          response.errorMessage ?? 'Profile Update failed try again!!');
    }
    _updateProfileInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _pickProfileImage() async {
    final imagePicker = ImagePicker();
    final XFile? result =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (result != null) {
      _selectedImage = result;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _fnTEController.dispose();
    _lnTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
