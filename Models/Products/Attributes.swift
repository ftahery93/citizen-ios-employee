
struct Attributes : Encodable, Decodable {
	var product_attribute_id : Int?
	var product_attribute_name : String?
	var text_prompt : String?
	var is_required : Bool?
	var attribute_control_type_id : Int?
	var display_order : Int?
	var default_value : String?
	var attribute_control_type_name : String?
	var attribute_values : [Attribute_values]?
	var id : Int?
 
    var localized_names : [Localized_names_Products]?
    
    var name_localized : String {
        get {
            
            if (((localized_names ?? [Localized_names_Products]()).count)>=1) {
                 return localized_names![0].localized_name ?? ""
            }
            return product_attribute_name ?? ""
        }
    }
    
    
}
