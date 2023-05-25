import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppliedJobsRecord extends FirestoreRecord {
  AppliedJobsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobApplied" field.
  DocumentReference? _jobApplied;
  DocumentReference? get jobApplied => _jobApplied;
  bool hasJobApplied() => _jobApplied != null;

  // "userApplied" field.
  DocumentReference? _userApplied;
  DocumentReference? get userApplied => _userApplied;
  bool hasUserApplied() => _userApplied != null;

  // "appliedTime" field.
  DateTime? _appliedTime;
  DateTime? get appliedTime => _appliedTime;
  bool hasAppliedTime() => _appliedTime != null;

  // "coverLetter" field.
  String? _coverLetter;
  String get coverLetter => _coverLetter ?? '';
  bool hasCoverLetter() => _coverLetter != null;

  // "image_1" field.
  String? _image1;
  String get image1 => _image1 ?? '';
  bool hasImage1() => _image1 != null;

  // "image_2" field.
  String? _image2;
  String get image2 => _image2 ?? '';
  bool hasImage2() => _image2 != null;

  // "image_3" field.
  String? _image3;
  String get image3 => _image3 ?? '';
  bool hasImage3() => _image3 != null;

  void _initializeFields() {
    _jobApplied = snapshotData['jobApplied'] as DocumentReference?;
    _userApplied = snapshotData['userApplied'] as DocumentReference?;
    _appliedTime = snapshotData['appliedTime'] as DateTime?;
    _coverLetter = snapshotData['coverLetter'] as String?;
    _image1 = snapshotData['image_1'] as String?;
    _image2 = snapshotData['image_2'] as String?;
    _image3 = snapshotData['image_3'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appliedJobs');

  static Stream<AppliedJobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppliedJobsRecord.fromSnapshot(s));

  static Future<AppliedJobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppliedJobsRecord.fromSnapshot(s));

  static AppliedJobsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppliedJobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppliedJobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppliedJobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppliedJobsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createAppliedJobsRecordData({
  DocumentReference? jobApplied,
  DocumentReference? userApplied,
  DateTime? appliedTime,
  String? coverLetter,
  String? image1,
  String? image2,
  String? image3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobApplied': jobApplied,
      'userApplied': userApplied,
      'appliedTime': appliedTime,
      'coverLetter': coverLetter,
      'image_1': image1,
      'image_2': image2,
      'image_3': image3,
    }.withoutNulls,
  );

  return firestoreData;
}
