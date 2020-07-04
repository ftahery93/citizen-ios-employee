
struct LoginModel : Codable {
	var employee : User?
	var access_token : String?
}
struct User : Codable {
    var id : Int?
    var email : String?
}
