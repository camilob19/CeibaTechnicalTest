//
//  DetailCardInformationView.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import SwiftUI

struct DetailCardInformationView: View {
    var title: String
    var detail: String
    
    var onTabButton: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 2, x: 1, y: 1)
            VStack(alignment: .leading, spacing: 1) {
                Text(title)
                    .foregroundColor(.sherpaBlue)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                Text(detail)
                    .padding()
            }
            .padding()
        }
    }
}

struct DetailCardInformationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardInformationView(title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderi",
                                  detail: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
    }
}
