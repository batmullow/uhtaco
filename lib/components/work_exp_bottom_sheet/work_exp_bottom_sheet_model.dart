import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkExpBottomSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PostitionTitle widget.
  TextEditingController? postitionTitleController;
  String? Function(BuildContext, String?)? postitionTitleControllerValidator;
  // State field(s) for Company widget.
  TextEditingController? companyController;
  String? Function(BuildContext, String?)? companyControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    postitionTitleController?.dispose();
    companyController?.dispose();
    textController3?.dispose();
  }

  /// Additional helper methods are added here.

}
