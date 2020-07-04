
struct Product_OD : Encodable, Decodable {
	var visible_individually : Bool?
	var name : String?
	var localized_names : [Localized_names_Products]?
	var short_description : String?
	var localized_short_descriptions : [Localized_short_descriptions]?
	var full_description : String?
	var localized_full_descriptions : [Localized_full_descriptions]?
	var show_on_home_page : Bool?
	var meta_meta_keywordswords : String?
	var meta_description : String?
	var meta_title : String?
	var allow_customer_reviews : Bool?
	var approved_rating_sum : Int?
	var not_approved_rating_sum : Int?
	var approved_total_reviews : Int?
	var not_approved_total_reviews : Int?
	var sku : String?
	var manufacturer_part_number : String?
	var gtin : String?
	var is_card : Bool?
	var require_other_products : Bool?
	var automatically_add_required_products : Bool?
	var is_download : Bool?
	var unlimited_downloads : Bool?
	var max_number_of_downloads : Int?
	var download_expiration_days : String?
	var has_sample_download : Bool?
	var has_user_agreement : Bool?
	var is_recurring : Bool?
	var recurring_cycle_length : Int?
	var recurring_total_cycles : Int?
	var is_rental : Bool?
	var rental_price_length : Int?
	var is_ship_enabled : Bool?
	var is_free_shipping : Bool?
	var ship_separately : Bool?
	var additional_shipping_charge : Float?
	var is_tax_exempt : Bool?
	var is_telecommunications_or_broadcasting_or_electronic_services : Bool?
	var use_multiple_warehouses : Bool?
	var manage_inventory_method_id : Int?
	var stock_quantity : Int?
	var display_stock_availability : Bool?
	var display_stock_quantity : Bool?
	var min_stock_quantity : Int?
	var sold_quantity : Int?
	var stock_availability : String?
	var notify_admin_for_quantity_below : Int?
	var allow_back_in_stock_subscriptions : Bool?
	var order_minimum_quantity : Int?
	var order_maximum_quantity : Int?
	var allowed_quantities : String?
	var allow_adding_only_existing_attribute_combinations : Bool?
	var disable_buy_button : Bool?
	var disable_wishlist_button : Bool?
	var available_for_pre_order : Bool?
	var pre_order_availability_start_date_time_utc : String?
	var call_for_price : Bool?
	var price : Float?
	var formatted_price : String?
	var old_price : Float?
	var formatted_old_price : String?
	var prices_percentage : Float?
	var product_cost : Float?
	var special_price : String?
	var special_price_start_date_time_utc : String?
	var special_price_end_date_time_utc : String?
	var customer_enters_price : Bool?
	var minimum_customer_entered_price : Float?
	var maximum_customer_entered_price : Float?
	var baseprice_enabled : Bool?
	var baseprice_amount : Float?
	var baseprice_base_amount : Float?
	var has_tier_prices : Bool?
	var has_discounts_applied : Bool?
	var weight : Float?
	var length : Float?
	var width : Float?
	var height : Float?
	var available_start_date_time_utc : String?
	var available_end_date_time_utc : String?
	var show_timer : Bool?
	var display_order : Int?
	var published : Bool?
	var deleted : Bool?
	var created_on_utc : String?
	var updated_on_utc : String?
	var product_type : String?
	var parent_grouped_product_id : Int?
	var role_ids : [String]?
	var discount_ids : [String]?
	var store_ids : [String]?
	//var manufacturer_ids : [String]?
	var images : [ImagesProducts]?
	// var attributes : [String]?
	var product_attribute_combinations : [String]?
	var product_specification_attributes : [String]?
	var associated_product_ids : [String]?
	var tags : [String]?
	var vendor_id : Int?
    var vendor : Vendor?
	var se_name : String?
	var id : Int?
    
    
    var name_localized : String {
        get {
            if (((localized_names ?? [Localized_names_Products]()).count)>=1) {
                return localized_names![0].localized_name ?? ""
            }
            return name ?? ""
        }
    }
    
    var short_description_localized : String {
        get {
            if (((localized_short_descriptions ?? [Localized_short_descriptions]()).count)>=1) {
                return localized_short_descriptions![0].localized_short_description ?? ""
            }
            return short_description ?? ""
        }
    }
    
    var full_description_localized : String {
        get {
            if (((localized_full_descriptions ?? [Localized_full_descriptions]()).count)>=1) {
                return localized_full_descriptions![0].localized_full_description ?? ""
            }
            return full_description ?? ""
        }
    }
    
    var imageSrc : String {
        get {
             if (((images ?? [ImagesProducts]()).count) >= 1) {
//             if (images != nil) {
            
                return images![0].src ?? ""
            }
            
            return ""
        }
    }
    
    var deliveryDate : String?{
        get {
            return created_on_utc
        }
    }
}
