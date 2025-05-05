import SwiftUI
import Firebase
import FirebaseAuth

struct CustomTextFieldStyle: ViewModifier {
    
    @State var ancho: CGFloat
    @State var alto: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: ancho, height: alto)
            .background(
                RoundedRectangle(cornerRadius: 17)
                    .fill(Color.white)
            )
            .multilineTextAlignment(.center)
            .padding(.vertical, 5)
    }
}