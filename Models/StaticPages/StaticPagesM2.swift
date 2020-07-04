
struct StaticPagesM2 : Encodable, Decodable {
    var system_name : String?
    var title : String?
    var body : String?
    
    var id : Int?
    
    var localized_names : [Localized_names_static]?
    
    var localized_bodies : [Localized_names_static]?
    
    var country_id : Int?
    
    
    var title_localized : String {
        get {
            if (((localized_names ?? [Localized_names_static]()).count)>=1) {
                return localized_names![0].localized_title ?? ""
            }
            return title ?? ""
        }
    }
    
    var body_localized : String {
        get {
            if (((localized_bodies ?? [Localized_names_static]()).count)>=1) {
                return localized_bodies![0].localized_body ?? ""
            }
            return body ?? ""
        }
    }
    
}
