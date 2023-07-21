import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_state.dart';
import 'package:integration_flutter_app/components/profile/repo/profile.dart';
import 'package:integration_flutter_app/components/profile/repo/profile_repository.dart';
import 'package:intl/intl.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  /// Since there are no authentification processes, a testing profile id from Firebase needs to be created
  String testProfileUid = "ublA77LaCRte6Y13bNid";

  final ProfileRepository _profileRepository = ProfileRepository.I;

  Future<void> initialize() async {
    emit(state.copyWith(loading: true));
    getTestProfile();
    emit(state.copyWith(loading: false));
  }

  /// Setup testProfile if none are found in Firebase
  /// only for test purposes
  Future<void> createTestProfileOnStartup() async {
    await _profileRepository.create(
      profile: Profile(
          name: "Rohash",
          origin: "Indien",
          birthday: Timestamp.fromDate(DateTime.utc(2007, 9, 9)),
          job: Profile.fullTime,
          role: Profile.adminRole),
    );
  }

  /// Gets all Information from the testProfile by [testProfileId]
  Future<void> getTestProfile() async {
    emit(state.copyWith(
        profile: await _profileRepository.getProfile(testProfileUid)));
  }

  /// Convert TimeStamp from Firebase to String in Format dd-mm-yy
  String convertDate(DateTime dateTime) {
    final dateFormat = DateFormat("dd-mm-yyyy");
    final String convertedDate = dateFormat.format(dateTime).toString();

    return convertedDate;
  }

  /// Convert int job to corresponding String
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

  /// Convert int role to corresponding String
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
