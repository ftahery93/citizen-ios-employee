
struct OrdersModel : Encodable, Decodable {
    var store_id : Int?
    var pick_up_in_store : Bool?
    var payment_method_system_name : String?
    var payment_Method_Code : String?
    var use_reward_points : Bool?
    var customer_currency_code : String?
    var currency_rate : Double?
    var customer_tax_display_type_id : Int?
    var vat_number : String?
    var order_subtotal_incl_tax : Double?
    var order_subtotal_excl_tax : Double?
    var order_sub_total_discount_incl_tax : Double?
    var order_sub_total_discount_excl_tax : Double?
    var order_shipping_incl_tax : Double?
    var order_shipping_excl_tax : Double?
    var payment_method_additional_fee_incl_tax : Double?
    var payment_method_additional_fee_excl_tax : Double?
    var tax_rates : String?
    var order_tax : Double?
    var order_discount : Double?
    var order_total : Double?
    var refunded_amount : Double?
    var reward_points_were_added : String?
    var checkout_attribute_description : String?
    var custom_order_number : String?
    var customer_language_id : Int?
    var affiliate_id : Int?
    var customer_ip : String?
    var authorization_transaction_id : Int?
    var authorization_transaction_code : String?
    var authorization_transaction_result : String?
    var capture_transaction_id : Int?
    var capture_transaction_result : String?
    var subscription_transaction_id : Int?
    var paid_date_utc : String?
    var shipping_method : String?
    var shipping_rate_computation_method_system_name : String?
//    var deleted : Int?
    var created_on_utc : String?
    var customer_id : Int?
    var billing_address : Addresses?
    var billing_address_id : Int?
    var shipping_address_id : Int?
    var order_items : [Order_items]?
    var order_status : String?
    var payment_status : String?
    var shipping_status : String?
    var formatted_status : String?
    var pending_on_utc : String?
    var processing_on_utc : String?
    var shipping_on_utc : String?
    var delivery_on_utc : String?
    var customer_tax_display_type : String?
    var id : Int?
    
}

