import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'login.g.dart';

class AccessToken {
	final DateTime expires;
	final String userId;
	final String token;
	
	AccessToken({this.token, this.userId, this.expires});
}


@JsonSerializable()
class UserForm {

	@JsonKey(name: 'facebook_id')
	final String fbId;
	
	@JsonKey(name: 'facebook_token')
	final String fbToken;
	
	const UserForm({
		@required this.fbId,
		@required this.fbToken
	});
	
	factory UserForm.fromJson(Map<String, dynamic> json) => _$UserFormFromJson(json);
	Map<String, dynamic> toJson() => _$UserFormToJson(this);
}