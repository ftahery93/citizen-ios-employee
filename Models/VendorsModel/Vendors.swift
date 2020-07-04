
struct Vendors : Codable {
	var name : String?
	var localized_names : [Localized_names]?
	var email : String?
	var phone_number : String?
	var description : String?
	var localized_descriptions : [Localized_descriptions]?
	var picture_id : Int?
	var coordinates : String?
	var meta_meta_keywordswords : String?
	var meta_description : String?
	var meta_title : String?
	var active : Bool?
	var deleted : Bool?
	var image : Image?
	var se_name : String?
	var id : Int?
    var show_as_prime : Bool?
    var imageSrc : String {
        get {
            guard let vImg : String = image?.src else {
                return ""
            }
            return vImg
        }
    }
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
            if (((localized_descriptions ?? [Localized_descriptions]()).count)>=1) {
                return localized_descriptions![0].localized_description ?? ""
            }
            return description ?? ""
        }
    }
     
}
