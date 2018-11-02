import 'package:blinck_app/service/api/session/session.dart';
import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:blinck_app/service/storage/token/token_shared_storage_service.dart';
import 'package:blinck_app/util/model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
	
	final ISessionService sessionService;
	
	MainScreen({
		@required this.sessionService,
		Key key,
	}) : super(key: key);
	
	@override
	State<MainScreen> createState() => new _MainScreenModel();
}


class _MainScreenModel extends ViewModel<MainScreen, _MainScreenLogic> {
	
	@override
	_MainScreenLogic createLogic() => new _MainScreenLogic();
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			
			appBar: AppBar(
				title: Text("MainScreen"),
			),
			
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						
						Text($.principal)
						
					],
				),
			),
		
		);
	}
	
}


class _MainScreenLogic extends ViewLogic<MainScreen, _MainScreenModel> {
	
	ITokenStorageService _tokenStorage = TokenSharedStorageService.getInstance();
	
	String principal = "";
	
	
	@override
	void initialize() async {
		
		final sessionJwt = await _tokenStorage.currentSessionString();
		final status = await $.sessionService.getUserInfo(sessionJwt);
		
		update(() {
			principal = status.principal;
		});
	}
	
}