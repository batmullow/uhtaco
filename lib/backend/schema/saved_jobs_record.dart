import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedJobsRecord extends FirestoreRecord {
  SavedJobsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobSaved" field.
  DocumentReference? _jobSaved;
  DocumentReference? get jobSaved => _jobSaved;
  bool hasJobSaved() => _jobSaved != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "savedTime" field.
  DateTime? _savedTime;
  DateTime? get savedTime => _savedTime;
  bool hasSavedTime() => _savedTime != null;

  void _initializeFields() {
    _jobSaved = snapshotData['jobSaved'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _savedTime = snapshotData['savedTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('savedJobs');

  static Stream<SavedJobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavedJobsRecord.fromSnapshot(s));

  static Future<SavedJobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SavedJobsRecord.fromSnapshot(s));

  static SavedJobsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavedJobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavedJobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavedJobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SavedJobsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createSavedJobsRecordData({
  DocumentReference? jobSaved,
  DocumentReference? user,
  DateTime? savedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobSaved': jobSaved,
      'user': user,
      'savedTime': savedTime,
    }.withoutNulls,
  );

  return firestoreData;
}
