import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateJobModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for shortDescription widget.
  TextEditingController? shortDescriptionController;
  String? Function(BuildContext, String?)? shortDescriptionControllerValidator;
  // State field(s) for requirements widget.
  TextEditingController? requirementsController;
  String? Function(BuildContext, String?)? requirementsControllerValidator;
  // State field(s) for preferredSkills widget.
  TextEditingController? preferredSkillsController;
  String? Function(BuildContext, String?)? preferredSkillsControllerValidator;
  // State field(s) for experienceLevel widget.
  String? experienceLevelValue;
  FormFieldController<String>? experienceLevelValueController;
  // State field(s) for salaryRange widget.
  double? salaryRangeValue;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    shortDescriptionController?.dispose();
    requirementsController?.dispose();
    preferredSkillsController?.dispose();
  }

  /// Additional helper methods are added here.

}
