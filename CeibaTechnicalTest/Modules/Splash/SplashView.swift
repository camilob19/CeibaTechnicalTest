//
//  SplashView.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 15/01/23.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive : Bool = false
    
    var body: some View {
        if isActive {
            HomeView()
        } else {
            VStack {
                LogoSplash()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct LogoSplash: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            VStack {
                ImageAsset.splashLogo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .padding()
                LoadingBar()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear() {
                self.isLoading = true
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
