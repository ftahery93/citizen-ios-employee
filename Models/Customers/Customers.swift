
struct Customers : Encodable, Decodable {
	// var shopping_cart_items : [String]?
    var reward_points_balance : Int?
    var reward_points_amount : String?
    var min_reward_points_balance : Int?
    var min_reward_points_amount : String?
    var billing_address : Addresses?
	var shipping_address : Addresses?
	var addresses : [Addresses]?
	var customer_guid : String?
	var username : String?
	var email : String?
    var first_name : String?
	var last_name : String?
    var phone : String?
    var language_id : String?
	var date_of_birth : String?
	var gender : String?
	var admin_comment : String?
	var is_tax_exempt : Bool?
	var has_shopping_cart_items : Bool?
	var active : Bool?
	var deleted : Bool?
	var is_system_account : Bool?
	var system_name : String?
	var last_ip_address : String?
	var created_on_utc : String?
	var last_login_date_utc : String?
	var last_activity_date_utc : String?
	var registered_in_store_id : Int?
	var subscribed_to_newsletter : Bool?
	var role_ids : [Int]?
	var id : Int?
    var vendor_id : Int?
}
