//
//  CircleButton.swift
//  SwiftUICrypto
//
//  Created by Vansh Dubey on 06/01/26.
//

import SwiftUI


struct CircleButton: View {
    let iconName: String
    let onTap: () -> Void
    
    init(
        iconName: String,
        onTap: @escaping () -> Void = {}
    ){
        self.iconName = iconName
        self.onTap = onTap
    }
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .frame(width: 50,height: 50)
            .foregroundStyle(Color.theme.accentColor)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.backgroundColor)
                    .shadow(radius: 10)
            )
            .padding(5)
            .onTapGesture {
                onTap()
            }
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(iconName: "heart.fill").padding().previewLayout(.sizeThatFits).border(.red)
    }
}
