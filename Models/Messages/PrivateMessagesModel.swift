 
struct PrivateMessagesModel : Codable {
	let private_messages : [Private_messages]?
 }
 
 struct Private_messages : Codable {
    var store_id : Int?
    var from_customer_id : Int?
    var to_customer_id : Int?
    var subject : String?
    var text : String?
    var attachment_files_paths : [String]?
    var is_read : Bool?
    var is_deleted_by_author : Bool?
    var is_deleted_by_recipient : Bool?
    var created_on_utc : String?
    var id : Int?
 }
