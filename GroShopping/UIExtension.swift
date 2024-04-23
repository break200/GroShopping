//
//  UIExtension.swift
//  GroShopping
//
//  Created by break200 on 4/23/24.
//

import SwiftUI


enum Gilroy: String {
    case regular = "Gilroy-Regular"
    case medium = "Gilroy-Medium"
    case semibold = "Gilroy-SemiBold"
    case bold = "Gilroy-Bold"
}

extension Font {
    static func customfont(_ font: Gilroy, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
    static var topInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top
        }
        return 0.0
    }
    
    static var bottomInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
    
    static var horizontalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right
        }
        return 0.0
    }
    
    static var verticalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
    
}

extension Color {
    
    static var primaryApp: Color {
        return Color(hex: "53B175")
    }
    
    static var primaryText: Color {
        return Color(hex: "030303")
    }
    
    static var secondaryText: Color {
        return Color(hex: "828282")
    }
    
    static var textTitle: Color {
        return Color(hex: "7C7C7C")
    }
    
    static var placeholder: Color {
        return Color(hex: "B1B1B1")
    }
    
    static var darkGray: Color {
        return Color(hex: "4C4F4D")
    }
    
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB(12 -bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}




struct ShowButton: ViewModifier {
    @Binding var isShow: Bool
    
    public func body(content: Content) -> some View {
        
        HStack {
            content
            Button {
                isShow.toggle()
            } label: {
                Image(systemName: !isShow ? "eye.fill" : "eye.slash.fill" )
                    .foregroundColor(.textTitle)
            }

        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner:  UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corers: corner))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corers: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corers, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    
    // Vertical Center
    func vCenter() -> some View {
        self.frame(maxHeight: .infinity, alignment: .center)
    }
    
    // Vertical Top
    func vTop() -> some View {
        self.frame(maxHeight: .infinity, alignment: .top)
    }
    
    // Vertical Bottom
    func vBottom() -> some View {
        self.frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    // Horizontal Center
    func hCenter() -> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }
    
    // Horizontal Leading
    func hLeading() -> some View {
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // Horizontal Trailing
    func hTrailing() -> some View {
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
}

// 패딩
extension View {
    
    func padding(px:CGFloat) -> some View {
        self.padding(px)
    }
    
    func paddingLeadingBo(pi:CGFloat) -> some View {
        self.padding([.leading,.bottom], pi)
    }
    
    func paddingTrailingBo(pi:CGFloat) -> some View {
        self.padding([.trailing,.bottom], pi)
    }
    
    func paddingLeadingTo(pi:CGFloat) -> some View {
        self.padding([.leading,.top], pi)
    }
    
    func paddingTrailingTo(pi:CGFloat) -> some View {
        self.padding([.trailing,.top], pi)
    }
    
    func paddingHorizontal(pi:CGFloat) -> some View {
        self.padding(.horizontal , pi)
    }
    
    func paddingVertical(pi:CGFloat) -> some View {
        self.padding(.vertical , pi)
    }
    
    
    func paddingLeading(pi:CGFloat) -> some View {
        self.padding(.leading , pi)
    }
    
    func paddingTrailing(pi:CGFloat) -> some View {
        self.padding(.trailing , pi)
    }
    
    
    func paddingTop(pi:CGFloat) -> some View {
        self.padding(.top , pi)
    }
    
    func paddingBottom(pi:CGFloat) -> some View {
        self.padding(.bottom , pi)
    }
    
    
    func paddingHVOther(hpi:CGFloat , vpi:CGFloat) -> some View {
        self .padding(.horizontal,hpi).padding(.vertical,vpi)
    }
}

// Text aliment
extension View {
    func textLeading() -> some View {
        self.multilineTextAlignment(.leading)
    }
    
    func textCenter() -> some View {
        self.multilineTextAlignment(.center)
    }
    
    func textTrailing() -> some View {
        self.multilineTextAlignment(.trailing)
    }
    
    func textLeadingLine(number: Int) -> some View {
         self.lineLimit(number).multilineTextAlignment(.leading)
    }
    
    func textCenterLine(number: Int) -> some View {
         self.lineLimit(number).multilineTextAlignment(.center)
    }

    func textTrailingLine(number: Int) -> some View {
         self.lineLimit(number).multilineTextAlignment(.trailing)
    }
}
