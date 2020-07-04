
struct IssuesModel : Codable {
	let pending : [Issue]?
	let approved : [Issue]?
}


struct Issue : Codable {
    let id : Int?
    let image : String?
    let description : String?
    let fullname : String?
    let mobile : String?
    let latitude : String?
    let longitude : String?
    let user_id : Int?
    let employee_id : Int?
    let status : Int?
    let approved_date : String?
    let approved_image : String?
}
