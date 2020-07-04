
struct Results : Codable {
	var address_components : [Address_components]?
	var formatted_address : String?
	var geometry : Geometry?
	var place_id : String?
	var plus_code : Plus_code?
	var types : [String]?

}
