//
//  User.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 07.06.2021.
//

import Foundation
import SwiftUI

struct User: Decodable {
    var id: Int?
    var lastName: String = "Medeuyev"
    var firstName: String = "Adilkhan"
    var fathersname: String = ""
    var email: String = "amedeuyev@gmail.com"
    var username: String = "getmemd"
    var password: String = "123456"
    var avatar: URL? = URL(string: "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg")!
    
    static let `default` = User(firstName: "Adil")
}
