
import 'package:hersay/module_profile/manager/profile/profile.manager.dart';
import 'package:hersay/module_profile/model/profile/profile_model.dart';
import 'package:hersay/module_profile/request/profile/profile_request.dart';
import 'package:hersay/module_profile/response/profile/profile_response.dart';
import 'package:hersay/module_upload/service/image_upload/image_upload_service.dart';
import 'package:inject/inject.dart';

@provide
class ProfileService{
  final ProfileManager _manager;
  final ImageUploadService _imageUploadService;

  ProfileService(
      this._manager,
      this._imageUploadService,
      );

  Future<ProfileModel> getProfileScreenData()async{
    ProfileResponse response = await _manager.getProfile();
    if(response == null ) return null;

    ProfileModel profileData = new ProfileModel(
         userImage: (response.data.image== 'http://34.121.207.32/upload/')
               ?null
               :response.data.image,
        userName: response.data.userName,
        city: response.data.city??'Lattakia',
        country: response.data.country??'Syria',
        realEstates: ProfileModel.toRealEstatesList(response),
        cars : ProfileModel.toCarsList(response),
        electronicDevices:ProfileModel.toElectronicDevicesList(response)
    );

    return profileData;
  }

  Future<bool> createProfile(String userName) async{
    ProfileRequest request = new ProfileRequest(
      image: '',
      userName: userName,
      location: '',
      story: '',
    );
     return await _manager.createProfile(request);
  }

  Future<bool> updateMyProfile(String userName,String country , String city ,String imagePath) async{
    String uploadedImageUrl = (imagePath != null)
        ? await _imageUploadService.uploadImage(imagePath)
        :'';

    ProfileRequest request = new ProfileRequest(
      image: uploadedImageUrl,
      userName: userName,
      country:country,
      city:city,
      location: '',
      story: '',
    );
    return await _manager.updateMyProfile(request);
  }
}