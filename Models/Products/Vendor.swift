
struct Vendor : Encodable, Decodable {
	var name : String?
	var email : String?
	var phone_number : String?
	var description : String?
	var picture_id : Int?
	var coordinates : String?
	var meta_keywords : String?
	var meta_description : String?
	var meta_title : String?
	//var active : Bool?
	//var deleted : Bool?
	var id : Int?
    var se_name : String?
    var localized_names : [localized_names_vendor]?
    var localized_descriptions : [localized_descriptions_vendor]?
    var image : images_vendors?
    
    var name_localized : String {
        get {
            if (((localized_names ?? [localized_names_vendor]()).count)>=1) {
                return localized_names![0].localized_name ?? ""
            }
            return name ?? ""
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
}

struct localized_names_vendor:Encodable, Decodable {
    var language_id : Int?
    var localized_name : String?
}

struct localized_descriptions_vendor:Encodable, Decodable {
    var language_id : Int?
    var localized_description : String?
}
struct images_vendors:Encodable, Decodable {
    var src: String?
    var attachment : String?
}

  
