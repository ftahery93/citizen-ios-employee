
struct Attribute_values : Encodable, Decodable {
	var type_id : Int?
	var associated_product_id : Int?
	var name : String?
	var color_squares_rgb : String?
//	var image_squares_image : String?
	var price_adjustment : Float?
	var weight_adjustment : Float?
	var cost : Float?
	var quantity : Int?
	var is_pre_selected : Bool?
	var display_order : Int?
	var product_image_id : Int?
	var type : String?
	var id : Int?
    
    var price_after_adjustment : String?
    
    var localized_names : [Localized_names_Products]?
    
    var name_localized : String {
        get {
            if (((localized_names ?? [Localized_names_Products]()).count)>=1) {
                return localized_names![0].localized_name ?? ""
            }
            return name ?? ""
        }
        
        
       
    }
    
    var localized_name_withPrice : String {
     
        get {
            var m00NN : String = ""
            m00NN = name_localized
            if(price_adjustment != nil){
                if (!(m00NN.containsIgnoringCase(find: "---"))) {
                    m00NN = "\(m00NN) [ \(price_after_adjustment!) ]"
                }
            }
            return m00NN
        }
        
    }
}
