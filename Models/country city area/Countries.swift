
struct Countries : Codable {
	var name : String?
	var allows_billing : Bool?
	var allows_shipping : Bool?
	var two_letter_iso_code : String?
	var three_letter_iso_code : String?
	var numeric_iso_code : Int?
	var subject_to_vat : Bool?
	var published : Bool?
	var display_order : Int?
	var limited_to_stores : Bool?
	var id : Int?
    var localized_names: [localized_names_countries]?
    
    var name_localized : String {
        get {
            if (((localized_names ?? [localized_names_countries]()).count)>=1) {
                return localized_names?[0].localized_name ?? ""
            }
            return name ?? ""
        }
    }
}

struct localized_names_countries : Codable {
    var language_id : Int?
    var localized_name : String?
       
} 
