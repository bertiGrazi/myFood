//
//  Coordinator.swift
//  MyFood
//
//  Created by Grazielli Berti on 10/02/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var presenter: UINavigationController { get set }
    
    func start()
}
