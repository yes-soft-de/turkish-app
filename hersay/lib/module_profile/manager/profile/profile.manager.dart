
import 'package:hersay/module_profile/repository/profile/profile.repository.dart';
import 'package:hersay/module_profile/request/profile/profile_request.dart';
import 'package:inject/inject.dart';

@provide
class ProfileManager{
  final ProfileRepository _repository;

  ProfileManager(
      this._repository,
      );

  Future<bool> createProfile(ProfileRequest request)async
            => _repository.createProfile(request);
}