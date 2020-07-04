
struct Payment_methods_list : Codable {
	var PaymentMethodCode : String?
	var name : String?
	var ImageUrl : String?
	var localized_names : [Localized_names_payments]?
	var id : Int?
    var system_name : String?
}
