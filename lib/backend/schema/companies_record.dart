import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesRecord extends FirestoreRecord {
  CompaniesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "companyLogo" field.
  String? _companyLogo;
  String get companyLogo => _companyLogo ?? '';
  bool hasCompanyLogo() => _companyLogo != null;

  // "companyHero" field.
  String? _companyHero;
  String get companyHero => _companyHero ?? '';
  bool hasCompanyHero() => _companyHero != null;

  // "companyDescription" field.
  String? _companyDescription;
  String get companyDescription => _companyDescription ?? '';
  bool hasCompanyDescription() => _companyDescription != null;

  // "companyLocation" field.
  LatLng? _companyLocation;
  LatLng? get companyLocation => _companyLocation;
  bool hasCompanyLocation() => _companyLocation != null;

  // "companyCity" field.
  String? _companyCity;
  String get companyCity => _companyCity ?? '';
  bool hasCompanyCity() => _companyCity != null;

  // "companyWebSite" field.
  String? _companyWebSite;
  String get companyWebSite => _companyWebSite ?? '';
  bool hasCompanyWebSite() => _companyWebSite != null;

  // "companySize" field.
  String? _companySize;
  String get companySize => _companySize ?? '';
  bool hasCompanySize() => _companySize != null;

  // "employees" field.
  DocumentReference? _employees;
  DocumentReference? get employees => _employees;
  bool hasEmployees() => _employees != null;

  void _initializeFields() {
    _companyName = snapshotData['companyName'] as String?;
    _companyLogo = snapshotData['companyLogo'] as String?;
    _companyHero = snapshotData['companyHero'] as String?;
    _companyDescription = snapshotData['companyDescription'] as String?;
    _companyLocation = snapshotData['companyLocation'] as LatLng?;
    _companyCity = snapshotData['companyCity'] as String?;
    _companyWebSite = snapshotData['companyWebSite'] as String?;
    _companySize = snapshotData['companySize'] as String?;
    _employees = snapshotData['employees'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesRecord.fromSnapshot(s));

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompaniesRecord.fromSnapshot(s));

  static CompaniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCompaniesRecordData({
  String? companyName,
  String? companyLogo,
  String? companyHero,
  String? companyDescription,
  LatLng? companyLocation,
  String? companyCity,
  String? companyWebSite,
  String? companySize,
  DocumentReference? employees,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'companyName': companyName,
      'companyLogo': companyLogo,
      'companyHero': companyHero,
      'companyDescription': companyDescription,
      'companyLocation': companyLocation,
      'companyCity': companyCity,
      'companyWebSite': companyWebSite,
      'companySize': companySize,
      'employees': employees,
    }.withoutNulls,
  );

  return firestoreData;
}
