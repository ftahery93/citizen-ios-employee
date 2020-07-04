
struct Stores : Encodable, Decodable {
	var name : String?
    var url : String?
	// var ssl_enabled : Bool?
	// var secure_url : String?
	// var hosts : String?
	var default_language_id : Int?
	var store_languages : [Store_languages]?
	var display_order : Int?
	var company_name : String?
	var company_address : String?
	var company_phone_number : String?
	// var company_vat : String?
	var primary_currency_id : Int?
	var store_currencies : [Store_currencies]?
	var id : Int?
}
