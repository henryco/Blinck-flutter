abstract class ITokenStorageService {
	
	Future<bool> saveFacebookToken(String token);
	Future<String> currentFacebookToken();
	
}