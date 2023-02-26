//create JobTypefilter + roleTypeFilter,

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item_repository.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_state.dart';
import 'package:integration_flutter_app/components/profile/repo/profile.dart';
import 'package:integration_flutter_app/components/profile/repo/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  String testProfileUid = "HBdC6PCcph0GLHQgQ1Ye";

  final ProfileRepository _profileRepository = ProfileRepository.I;

  Future<void> initialize() async {
    emit(state.copyWith(loading: true));
    createTestProfileOnStartup();
    getTestProfile();
    emit(state.copyWith(loading: false));
  }

  void createTestProfileOnStartup() async {
    await _profileRepository.create(
      profile: Profile(
          name: "Rohash",
          origin: "Indien",
          birthday: Timestamp.fromDate(DateTime.utc(2007, 9, 9)),
          job: Profile.fullTime,
          role: Profile.adminRole),
    );
  }

  Future<void> getTestProfile() async {
    emit(state.copyWith(
        profile: await _profileRepository.getProfile(testProfileUid)));
  }

  String jobTypeFilter(int? job) {
    switch (job) {
      case 0:
        {
          return "Teilzeit";
        }

      case 1:
        {
          return "Vollzeit";
        }

      default:
        {
          return "Kontraktzeit";
        }
    }
  }

  String roleTypeFilter(int? role) {
    switch (role) {
      case 0:
        {
          return "Beobachterrolle";
        }

      case 1:
        {
          return "Benutzerrolle";
        }

      default:
        {
          return "AdminRolle";
        }
    }
  }
}
