import 'package:meta/meta.dart';

class Status {
	final String principal;
	final bool active;
	
	const Status({
		@required this.principal,
		@required this.active
	});
	
	factory Status.fromJson(Map<String, dynamic> json) {
		return Status(
			principal: json['principal'],
			active: json['active']
		);
	}
	
}


abstract class ISessionService {
	
	const ISessionService();
	
	@virtual
	Future<Status> getUserInfo(String sessionJwt);
	
}