
struct City : Codable {
	var stateProvince_id : Int?
	var name : String?
	var abbreviation : String?
	var published : Bool?
	var display_order : Int?
	var id : Int?
    var localized_names: [localized_names_city]?
    
    var name_localized : String {
        get {
            if (((localized_names ?? [localized_names_city]()).count)>=1) {
                return localized_names?[0].localized_name ?? ""
            }
            return name ?? ""
        }
    }
}
struct localized_names_city : Codable {
    var language_id : Int?
    var localized_name : String?
       
}
