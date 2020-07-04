
struct Billing_address_OD : Encodable, Decodable {
    var title : String?
	var first_name : String?
	var last_name : String?
	var email : String?
	var company : String?
	var country_id : Int?
	var country : String?
	var state_province_id : Int?
	var city : String?
	var address1 : String?
	var address2 : String?
	var zip_postal_code : String?
	var phone_number : String?
	var fax_number : String?
	var customer_attributes : String?
	var created_on_utc : String?
	var province : String?
	var id : Int?
}
