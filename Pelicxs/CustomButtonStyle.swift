import SwiftUI
import Firebase
import FirebaseAuth

struct CustomButtonStyle: ButtonStyle {
    
    var size:CGFloat
    var foregroundStyle:Color
    var background:Color
    var widthButton:CGFloat
    var heightButton:CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size))
            .fontWeight(.heavy)
            .foregroundStyle(foregroundStyle)
            .frame(width: widthButton, height: heightButton)
            .background(background)
            .cornerRadius(15)
            
    }
}