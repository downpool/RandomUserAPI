//
//  ProfileImgView.swift
//  RandomUserAPI
//
//  Created by 최동현 on 2023/05/06.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImgView: View {
    
    let imageURL: URL
    var body: some View {
        
        URLImage(imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 50, height: 60)
        .clipShape(Circle())
            .overlay(Circle().stroke(Color.init(.yellow), lineWidth: 2))
    }
}

struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://gulvalschool.org.uk/wp-content/uploads/2020/07/5356755_062119-cc-ss-summer-sun-img.jpg")!
        ProfileImgView(imageURL: url)
    }
}
