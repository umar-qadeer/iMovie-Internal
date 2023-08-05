
import UIKit

import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype Destination
    
    func navigate(to destination: Destination)
    func navigateBack()
    func makeView(for destination: Destination) -> AnyView
}
