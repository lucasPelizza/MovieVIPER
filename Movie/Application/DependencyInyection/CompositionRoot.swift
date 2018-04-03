//
//  CompositionRoot.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/29/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import Dip

extension DependencyContainer {
    
    static func configure() -> DependencyContainer {
        return DependencyContainer { container in
            
            // MARK: - Singletons
            container.register(.singleton) { NetworkManager() as NetworkProtocol }
            
            // MARK: - MoviesFeed
            container.register{ try MovieFeedInteractor(network: container.resolve() as NetworkProtocol) as MovieFeedInteractorProtocol }
            container.register{ MovieFeedRouter() as MovieFeedRouterProtocol }
            container.register{ try MovieFeedPresenter(interactor: container.resolve() as MovieFeedInteractorProtocol, wireframe: container.resolve() as MovieFeedRouterProtocol) as MovieFeedModuleInterface }
            
            container.register(tag: ViewsTag.MovieFeedViewController) { MovieFeedViewController() }
                .resolvingProperties { container, controller in
                    let presenter = try container.resolve() as MovieFeedModuleInterface
                    presenter.setVC(vc: controller)
                    controller.presenter = presenter
            }
            
            DependencyContainer.uiContainers = [container]
        }
    }
}
