// import 'package:front/core/network_handling/app_dio.dart';
// import 'package:front/core/team/data/api/team_api.dart';
// import 'package:front/core/team/usecases/get_teams_use_case.dart';
// import 'package:front/core/utils/result.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'team_controller.g.dart';
//
// @riverpod
// class TeamController extends _$TeamController {
//
//    TeamController(this._getTeamsUseCase);
//   final GetTeamsUseCase _getTeamsUseCase;
//
//
//   @override
//   dynamic build() {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
//   // Future<Result> _getTeams() async{
//   //   try {
//   //     final result = await _getTeamsUseCase.call();
//   //     print("result : $result");
//   //     return Success(result);
//   //   }on Exception catch(e) {
//   //     print('error : $e');
//   //     return Error(e);
//   //   }
//   // }
//
// }
//
// // class DetailController extends _$DetailController {
// //   @override
// //   FutureOr<DetailState> build({required int id}) {
// //     return _fetchData(id: id);
// //   }
// //
// //   Future<DetailState> _fetchData({required int id}) async {
// //     final post = await ref.watch(getPostDetailProvider(id: id).future);
// //     final user = await ref.watch(getUserDetailProvider(id: post.userId).future);
// //     return DetailState(post: post, user: user, comments: []);
// //   }
// // }
