//
//  CenterModifier.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 25/1/24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

extension View
{
    func navigationStyleModification() -> some View
    {
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else
        {
            return AnyView(self.navigationViewStyle(DefaultNavigationViewStyle()))
        }
    }
}
