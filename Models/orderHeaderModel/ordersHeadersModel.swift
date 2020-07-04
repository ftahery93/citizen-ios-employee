 
 struct ordersHeadersModel : Codable {
    let orders_headers : [ordersHeaders]?
 }

struct ordersHeaders : Codable {
	var year : Int?
	var orders_total : Double?
	var formatted_orders_total : String?
	var reward_earned_total : Int?
	var formatted_reward_earned_total : String?
	var id : Int?
}
