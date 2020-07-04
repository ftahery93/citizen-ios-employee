
struct State_provinces : Codable {
    var country_id : Int?
    var name : String?
    var abbreviation : String?
    var published : Bool?
    var display_order : Int?
    var id : Int?
    var localized_names: [localized_names_state]?
    
    var name_localized : String {
        get {
            if (((localized_names ?? [localized_names_state]()).count)>=1) {
                return localized_names?[0].localized_name ?? ""
            }
            return name ?? ""
        }
    }
}

struct localized_names_state : Codable {
    var language_id : Int?
    var localized_name : String?
    
}
