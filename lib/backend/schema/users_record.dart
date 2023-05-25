import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "positionTitle" field.
  String? _positionTitle;
  String get positionTitle => _positionTitle ?? '';
  bool hasPositionTitle() => _positionTitle != null;

  // "experienceLevel" field.
  String? _experienceLevel;
  String get experienceLevel => _experienceLevel ?? '';
  bool hasExperienceLevel() => _experienceLevel != null;

  // "currentCompany" field.
  String? _currentCompany;
  String get currentCompany => _currentCompany ?? '';
  bool hasCurrentCompany() => _currentCompany != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "likedPosts" field.
  bool? _likedPosts;
  bool get likedPosts => _likedPosts ?? false;
  bool hasLikedPosts() => _likedPosts != null;

  // "profileType" field.
  String? _profileType;
  String get profileType => _profileType ?? '';
  bool hasProfileType() => _profileType != null;

  // "salary" field.
  String? _salary;
  String get salary => _salary ?? '';
  bool hasSalary() => _salary != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "isGuest" field.
  bool? _isGuest;
  bool get isGuest => _isGuest ?? false;
  bool hasIsGuest() => _isGuest != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _password = snapshotData['password'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _bio = snapshotData['bio'] as String?;
    _positionTitle = snapshotData['positionTitle'] as String?;
    _experienceLevel = snapshotData['experienceLevel'] as String?;
    _currentCompany = snapshotData['currentCompany'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _likedPosts = snapshotData['likedPosts'] as bool?;
    _profileType = snapshotData['profileType'] as String?;
    _salary = snapshotData['salary'] as String?;
    _company = snapshotData['company'] as DocumentReference?;
    _isGuest = snapshotData['isGuest'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'display_name': snapshot.data['display_name'],
          'email': snapshot.data['email'],
          'password': snapshot.data['password'],
          'created_time': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_time']),
          ),
          'photo_url': snapshot.data['photo_url'],
          'bio': snapshot.data['bio'],
          'positionTitle': snapshot.data['positionTitle'],
          'experienceLevel': snapshot.data['experienceLevel'],
          'currentCompany': snapshot.data['currentCompany'],
          'uid': snapshot.data['uid'],
          'phone_number': snapshot.data['phone_number'],
          'likedPosts': snapshot.data['likedPosts'],
          'profileType': snapshot.data['profileType'],
          'salary': snapshot.data['salary'],
          'company': safeGet(
            () => toRef(snapshot.data['company']),
          ),
          'isGuest': snapshot.data['isGuest'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  String? email,
  String? password,
  DateTime? createdTime,
  String? photoUrl,
  String? bio,
  String? positionTitle,
  String? experienceLevel,
  String? currentCompany,
  String? uid,
  String? phoneNumber,
  bool? likedPosts,
  String? profileType,
  String? salary,
  DocumentReference? company,
  bool? isGuest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'email': email,
      'password': password,
      'created_time': createdTime,
      'photo_url': photoUrl,
      'bio': bio,
      'positionTitle': positionTitle,
      'experienceLevel': experienceLevel,
      'currentCompany': currentCompany,
      'uid': uid,
      'phone_number': phoneNumber,
      'likedPosts': likedPosts,
      'profileType': profileType,
      'salary': salary,
      'company': company,
      'isGuest': isGuest,
    }.withoutNulls,
  );

  return firestoreData;
}
