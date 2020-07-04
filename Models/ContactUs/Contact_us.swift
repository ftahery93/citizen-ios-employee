
struct Contact_us : Encodable, Decodable {
	var email : String?
	var subject : String?
	var enquiry : String?
	var full_name : String?
	var successfully_sent : Bool?
	var id : Int?
}
