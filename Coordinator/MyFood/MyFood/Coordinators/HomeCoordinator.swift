//
//  HomeCoordinator.swift
//  MyFood
//
//  Created by Grazielli Berti on 10/02/22.
//
import UIKit

final class HomeCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var presenter: UINavigationController
    weak var parentCoordinator: AppCoordinator?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewController = HomeViewController()
        presenter.pushViewController(viewController, animated: true)
    }
    
    func onFinish() {
        parentCoordinator?.childCoordinators
    }
}
