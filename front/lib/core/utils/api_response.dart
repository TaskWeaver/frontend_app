import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse<T> {
  final dynamic result;
  final int resultCode;
  final String resultMsg;

  ApiResponse({
    required this.result,
    required this.resultCode,
    required this.resultMsg,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    dynamic result = json['result'];
    if (result is Map<String, dynamic>) {
    } else if (result is List<dynamic>) {}
    return ApiResponse(
      result: result,
      resultCode: json['resultCode'] as int,
      resultMsg: json['resultMsg'] as String,
    );
  }
}
