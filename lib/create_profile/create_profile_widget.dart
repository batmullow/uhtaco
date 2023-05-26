import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_profile_model.dart';
export 'create_profile_model.dart';

class CreateProfileWidget extends StatefulWidget {
  const CreateProfileWidget({Key? key}) : super(key: key);

  @override
  _CreateProfileWidgetState createState() => _CreateProfileWidgetState();
}

class _CreateProfileWidgetState extends State<CreateProfileWidget> {
  late CreateProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProfileModel());

    _model.yourNameController ??= TextEditingController();
    _model.cityController ??= TextEditingController();
    _model.myBioController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Create your Profile',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 22.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        setState(() => _model.isDataUploading1 = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        try {
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();
                        } finally {
                          _model.isDataUploading1 = false;
                        }
                        if (selectedUploadedFiles.length ==
                            selectedMedia.length) {
                          setState(() {
                            _model.uploadedLocalFile1 =
                                selectedUploadedFiles.first;
                          });
                        } else {
                          setState(() {});
                          return;
                        }
                      }
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFDBE2E7),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                        child: Container(
                          width: 90.0,
                          height: 90.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: _model.uploadedFileUrl2,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading2 = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];
                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading2 = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile2 =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl2 = downloadUrls.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }
                  },
                  text: 'Upload Image',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context)
                        .titleMedium
                        .override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
              child: TextFormField(
                controller: _model.yourNameController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  labelStyle: FlutterFlowTheme.of(context).bodySmall,
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: null,
                validator:
                    _model.yourNameControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
              child: TextFormField(
                controller: _model.cityController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Your City',
                  labelStyle: FlutterFlowTheme.of(context).bodySmall,
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: null,
                validator: _model.cityControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
              child: TextFormField(
                controller: _model.myBioController,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).bodySmall,
                  hintText: 'Your bio',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                textAlign: TextAlign.start,
                maxLines: 3,
                validator: _model.myBioControllerValidator.asValidator(context),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final usersUpdateData = createUsersRecordData(
                      displayName: _model.yourNameController.text,
                      photoUrl: _model.uploadedFileUrl2,
                      bio: _model.myBioController.text,
                    );
                    await currentUserReference!.update(usersUpdateData);

                    context.pushNamed('HomePage');
                  },
                  text: 'Save Changes',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context)
                        .titleMedium
                        .override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
