//
//  CardInformationView.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import SwiftUI

struct CardInformationView: View {
    var name: String
    var number: String
    var mail: String?
    var iconOne: Image?
    var iconTwo: Image?
    var buttonName: String?
    var onTabButton: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 150)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 2, x: 1, y: 1)
            VStack(alignment: .leading, spacing: 1) {
                Text(name)
                    .foregroundColor(.sherpaBlue)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                HStack {
                    iconOne
                        .foregroundColor(.sherpaBlue)
                    Text(number)
                }
                HStack {
                    iconTwo
                        .foregroundColor(.sherpaBlue)
                    Text(mail ?? "")
                }
                HStack {
                    Spacer()
                    Text(buttonName ?? "")
                        .foregroundColor(.sherpaBlue)
                        .font(.system(size: 14))
                        .padding(.vertical)
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

struct CardInformationView_Previews: PreviewProvider {
    static var previews: some View {
        CardInformationView(name: "Cristian Betancourt",
                            number: "3135163174",
                            mail: "camilobe2011@gmail.com",
                            iconOne: Image(systemName: "phone.fill"),
                            iconTwo: Image(systemName:"envelope.fill"),
                            buttonName: "VER PUBLICACIONES") {
            print("press me")
        }
    }
}
