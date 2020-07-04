
struct Addresses : Codable {

    var first_name : String?
    var last_name : String?
    var email : String?
    var company : String?
    var country_id : Int?
    var country : String?
    var parent_state_province_id : Int?
    var state_province_id : Int?
    var city : String?
    var block : String?
    var building : String?
    var paci : String?
    var avenue : String?
    var floor : String?
    var flat : String?
    var address1 : String?
    var address2 : String?
    var zip_postal_code : String?
    var phone_number : String?
    var fax_number : String?
    var created_on_utc : String?
    var parent_province : String?
    var province : String?
    var is_default : Bool?
    var id : Int?
    

    var summary : String {
        get{
            return "\(first_name ?? "") \(parent_province ?? "") \(province ?? "") \(address1 ?? "") \(address2 ?? "") \(email ?? "") \(phone_number ?? "")"
        }
    }
    var summary2 : String {
        get{
            return "\(parent_province ?? "") \(province ?? "") \(address1 ?? "") \(address2 ?? "") \(email ?? "") \(phone_number ?? "")"
        }
    }
}
