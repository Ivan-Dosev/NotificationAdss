//
//  ContentView.swift
//  NotificationAdss
//
//  Created by Ivan Dimitrov on 7.10.20.
//

import SwiftUI
import GoogleMobileAds


struct ContentView: View {
    
    @State var showingPopup = false
    let bgColor = Color(hex: "e0fbfc")
    let popupColor = Color(hex: "3d5a80")
    var rewardAd:Rewarded
    init(){
            self.rewardAd = Rewarded()
       }
    
    var body: some View {
        
        let hideAll = {
            self.showingPopup = false
        }
        return ZStack {
            bgColor
            VStack(spacing: 15) {
                ExampleButton(showing: $showingPopup, title: "Popup", hideAll: hideAll)
            }
        }
        .edgesIgnoringSafeArea(.all)
            
        .popup(isPresented: $showingPopup, type: .`default`, closeOnTap: false) {
            self.createPopup()
        }
    }
    func createPopup() -> some View {
        VStack(spacing: 10) {
            Image("okay")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 100, height: 100)

            Text("Tutorial")
                .foregroundColor(.white)
                .fontWeight(.bold)

            Text("In this example floats are set to disappear after 2 seconds. Tap the toasts to dismiss or just open some other popup - previous one will be dismissed. This popup will only be closed if you tap the button.")
                .font(.system(size: 12))
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))

            Spacer()

            Button(action: {
//                self.showingPopup = false
                self.rewardAd.showAd(rewardFunction: {
                         print("Give Reward")
                })
                
            }) {
                Text("Got it")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(20.0)
        }
        .padding(EdgeInsets(top: 70, leading: 20, bottom: 40, trailing: 20))
        .frame(width: 300, height: 400)
        .background(self.popupColor)
        .cornerRadius(10.0)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
    }
}
struct ExampleButton : View {

    @Binding var showing: Bool
    var title: String
    var hideAll: ()->()

    var body: some View {
        Button(action: {
            self.showing.toggle()
        }) {
            Text(title)
                .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}
