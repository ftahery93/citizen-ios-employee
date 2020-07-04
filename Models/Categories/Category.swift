
struct Category : Encodable, Decodable {
	var name : String?
    
    var top_products : [Products]?
    
	var localized_names : [Localized_names]?
	var description : String?
	var parent_category_id : Int?
	var show_on_home_page : Bool?
	var image : ImageModel?
	var se_name : String?
	var id : Int?
    
    var name_localized : String {
        get {
            if (((localized_names ?? [Localized_names]()).count)>=1) {
                return localized_names![0].localized_name ?? ""
            }
            return name ?? ""
        }
    }
    
    var description_localized : String {
        get {
            if (((localized_names ?? [Localized_names]()).count)>=1) {
                return localized_names![0].localized_description ?? ""
            }
            return description ?? ""
        }
    }
    
    var imageSrc : String {
        get {
            guard let vImg : String = image?.src else {
                return ""
            }
            return vImg
        }
    }
    var isSelected : Bool?
    var has_sub_categories : Bool?
}
