

import Foundation
struct Order_items : Codable {
    var product_attributes : [orderProductAttributesModel]?
    var gift_cards : [String]?
    var quantity : Int?
    var unit_price_incl_tax : Double?
    var unit_price_excl_tax : Double?
    var price_incl_tax : Double?
    var price_excl_tax : Double?
    var discount_amount_incl_tax : Double?
    var discount_amount_excl_tax : Double?
    var original_product_cost : Double?
    var attribute_description : String?
    var download_count : Int?
    var isDownload_activated : Bool?
    var license_download_id : Int?
    var item_weight : Double?
    var rental_start_date_utc : String?
    var rental_end_date_utc : String?
    var product : Product?
    var product_id : Int?
    var id : Int?

}
struct orderProductAttributesModel : Codable {

    var code : Int?
    var value : String?
    var id : Int?
    
}
