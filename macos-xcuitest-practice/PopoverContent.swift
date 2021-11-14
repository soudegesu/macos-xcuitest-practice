//
//  PopoverContent.swift
//  macos-xcuitest-practice
//
//  Created by Takaaki Suzuki on 2021/11/14.
//

import SwiftUI

struct PopoverContent: View {
    var body: some View {
      VStack {
        Text("Popover")
          .accessibilityIdentifier("PopoverText")
      }
    }
}

struct PopoverContent_Previews: PreviewProvider {
    static var previews: some View {
        PopoverContent()
    }
}
