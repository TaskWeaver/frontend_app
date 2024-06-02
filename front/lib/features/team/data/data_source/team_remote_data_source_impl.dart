import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front/core/utils/exception.dart';
import 'package:front/features/team/data/data_source/team_remote_data_source.dart';
import 'package:front/features/team/data/models/create_team_request_model.dart';
import 'package:front/features/team/data/models/create_team_response_model.dart';
import 'package:front/features/team/data/models/invite_response_model.dart';
import 'package:front/features/team/data/models/invite_team_model.dart';
import 'package:front/features/team/data/models/team_detail_model.dart';
import 'package:front/features/team/data/models/team_model.dart';

final class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  TeamRemoteDataSourceImpl({required Dio dio}) : dio = dio;
  final Dio dio;

  @override
  Future<void> answerToInvitation(InviteResponse inviteResponse) async {
    try {
      debugPrint(inviteResponse.toString());
      var response = await dio.post(
        '/v1/team/invitation/answer',
        data: inviteResponse.toJson(),
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        return;
      } else {
        throw ServerException();
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<CreateTeamResponse> createTeam(
      CreateTeamRequest createTeamRequest) async {
    try {
      var response = await dio.post(
        '/v1/team',
        data: createTeamRequest.toJson(),
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        return CreateTeamResponse.fromJson(response.data['result']);
      } else {
        throw ServerException();
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<void> deleteMember(int teamId, Map<String, dynamic> memberId) async {
    try {
      await dio.post(
        '/v1/team/$teamId/delete',
        data: memberId,
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<TeamDetailModel> getTeamById(int teamId) async {
    try {
      var response = await dio.get(
        '/v1/team/$teamId',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        return TeamDetailModel.fromJson(response.data['result']);
      } else {
        throw ServerException();
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<TeamModel>> getTeams() async {
    try {
      var response = await dio.get(
        '/v1/teams',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );

      if (response.statusCode == 200 && response.data?['resultCode'] == 200) {
        return (response.data['result'] as List)
            .map((e) => TeamModel.fromJson(e))
            .toList();
      } else {
        throw ServerException();
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<void> invitationNotification() async {
    try {
      await dio.post(
        '/v1/team/invitation/notification',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<void> inviteTeamByEmail(InviteTeam inviteTeam) async {
    try {
      await dio.post(
        '/v1/team/invitation/email',
        data: inviteTeam.toJson(),
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );
    } on DioException {
      rethrow;
    }
  }
}
