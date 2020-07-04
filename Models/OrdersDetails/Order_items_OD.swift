
struct Order_items_OD : Encodable, Decodable {
     var product_attributes : [Product_attributes]?
    var cards : [Cards_OD]?
	var quantity : Int?
	var unit_price_incl_tax : Float?
	var unit_price_excl_tax : Float?
	var price_incl_tax : Float?
	var price_excl_tax : Float?
	var discount_amount_incl_tax : Float?
	var discount_amount_excl_tax : Float?
	var original_product_cost : Float?
	var attribute_description : String?
	var download_count : Int?
	var isDownload_activated : Bool?
	var license_download_id : Int?
	var item_weight : Float?
	var rental_start_date_utc : String?
	var rental_end_date_utc : String?
	var product : Product_OD?
	var product_id : Int?
	var id : Int?
}
