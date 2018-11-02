import 'package:blinck_app/service/api/api.dart';
import 'package:meta/meta.dart';

import '../login.dart';
export '../login.dart';

abstract class ILoginService {
	
	const ILoginService();
	
	/// Returns JWT string
	@virtual
	Future<String> loginUser(LoginForm form);
	
}