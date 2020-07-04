
struct Shopping_carts : Encodable, Decodable {
    var product_attributes : [Product_attributes]?
//    var customer_entered_price : Double?
    var quantity : Int?
//    var rental_start_date_utc : String?
//    var rental_end_date_utc : String?
    var created_on_utc : String?
//    var updated_on_utc : String?
//    var shopping_cart_type : String?
    var product_id : Int?
    var product : Product?
//    var customer_id : Int?
    var customer : Customers?
	var id : Int?
    var formatted_sub_total : String?
    var formatted_item_sub_total : String?
    var sub_total : Float?
    var shopping_cart_type : String?
    var attributes_text : String? {
        get {

            var mString : String = ""
            
            var innerText001 : String = ""
            var innerText002 : String = ""
            
            let currPrAtt : [Product_attributes] = product_attributes ?? [Product_attributes]()
           
            mString = ""
            mString = product?.name_localized ?? ""
            mString = mString + "\n" + (formatted_item_sub_total ?? "")
            
            if (currPrAtt.count >= 1) {
                
                
                for i in 0..<currPrAtt.count {
                    //checkAttributesForTextBox if true, add value, else do as usual
                    
                    if (i==0) {
                        if let data = checkAttributesForTextBox(myattributeId: currPrAtt[i].id ?? 0, productObject: product ?? Product()){
                            innerText002 = data + " : " + (currPrAtt[i].value ?? "")
                        }else{
                            innerText002 = fetchTextOfAttributeBasedOnId(attributeId: Int(currPrAtt[i].value ?? "") ?? 0, productObject : product ?? Product())
                        }
                    } else {
                        
                        if let data = checkAttributesForTextBox(myattributeId: currPrAtt[i].id ?? 0, productObject: product ?? Product()){
                            innerText002 = innerText002 + "\n" + data + " : " + (currPrAtt[i].value ?? "")
                        }else{
                            innerText002 =  innerText002 + "\n" + fetchTextOfAttributeBasedOnId(attributeId: Int(currPrAtt[i].value ?? "") ?? 0, productObject : product ?? Product())
                        }
                    }
                    
                    
             }
               
                mString = mString + "\n" + innerText002
                
            }
            
            return mString
            
        }
        
    }
    
}
