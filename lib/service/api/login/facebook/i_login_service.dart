import 'package:meta/meta.dart';
import '../login.dart';
export '../login.dart';

abstract class ILoginService {

	@virtual
	Future<AccessToken> initiateLoginProcess();
	
	const ILoginService();
}

