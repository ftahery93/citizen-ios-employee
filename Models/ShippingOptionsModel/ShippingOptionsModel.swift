 
struct ShippingOptionsModel : Codable {
	let shipping_options : [Shipping_options]?
 }

 struct Shipping_options : Codable {
    var shipping_rate_computation_method_system_name : String?
    var rate : Double?
    var name : String?
    var description : String?
    var id : Int?
 }
