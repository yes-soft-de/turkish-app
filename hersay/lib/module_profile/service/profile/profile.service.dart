import 'package:hersay/module_profile/manager/profile/profile.manager.dart';
import 'package:hersay/module_profile/model/profile/profile_model.dart';
import 'package:hersay/module_profile/presistance/profile_shared_preferences.dart';
import 'package:hersay/module_profile/request/profile/profile_request.dart';
import 'package:hersay/module_profile/response/profile/profile_response.dart';
import 'package:hersay/module_upload/service/image_upload/image_upload_service.dart';
import 'package:inject/inject.dart';

@provide
class ProfileService {
  final ProfileManager _manager;
  final ImageUploadService _imageUploadService;
  final ProfileSharedPreferencesHelper _profileSharedPreferencesHelper;

  ProfileService(
    this._manager,
    this._imageUploadService,
    this._profileSharedPreferencesHelper,
  );

  Future<ProfileModel> getProfileScreenData() async {
    ProfileResponse response = await _manager.getProfile();
    if (response == null) return null;

    await _profileSharedPreferencesHelper.setUserImage(response.data.image);
    await _profileSharedPreferencesHelper.setUserName(response.data.userName);
    ProfileModel profileData = new ProfileModel(
      userImage: (response.data.image == 'http://34.121.207.32/upload/')
          ? null
          : response.data.image,
      userName: response.data.userName,
      city: response.data.city ?? '',
      country: response.data.country ?? '',
      realEstates: ProfileModel.toRealEstatesList(response),
      cars: ProfileModel.toCarsList(response),
      electronicDevices: ProfileModel.toElectronicDevicesList(response),
      services: ProfileModel.toServiceList(response),
      categories: ProfileModel.toCategoryList(response),
    );

    return profileData;
  }

  Future<bool> createProfile(String userName) async {
    ProfileRequest request = new ProfileRequest(
      image: '',
      userName: userName,
      location: '',
      story: '',
    );

    return await _manager.createProfile(request);
  }

  Future<bool> updateMyProfile(
      String userName, String country, String city, String imagePath) async {
    String localImage = await _profileSharedPreferencesHelper.getImage();

    String uploadedImageUrl = (imagePath != null)
        ? await _imageUploadService.uploadImage(imagePath)
        : localImage.substring(localImage.indexOf('image/'));

    ProfileRequest request = new ProfileRequest(
      image: uploadedImageUrl,
      userName: userName,
      country: country,
      city: city,
      location: '',
      story: '',
    );
    return await _manager.updateMyProfile(request);
  }
}
