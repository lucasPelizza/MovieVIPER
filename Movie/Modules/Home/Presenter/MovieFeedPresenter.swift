//
//  MovieFeedPresenter.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Foundation
import RxSwift

final class MovieFeedPresenter {
    let interactor: MovieFeedInteractorProtocol
    let router: MovieFeedRouterProtocol
    let itemsSequenceInner = Variable<[MovieCellViewModel]>([])
    
    weak var vc: MovieFeedViewInput! = nil
    
    let disposeBag = DisposeBag()
    
    //I need to improve this because the vc shoud be in the init
    init(interactor: MovieFeedInteractorProtocol, wireframe router: MovieFeedRouterProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

//MARK: - MovieFeedModuleInterface's implementation
extension MovieFeedPresenter: MovieFeedModuleInterface {
    
    func setVC(vc: MovieFeedViewInput) {
        self.vc = vc
    }
    
    func didSelectItemAtIndex(index: Int) {
        let movieCellVM = itemsSequenceInner.value[index]
        //TODO: we should navigate to movie deatil here
    }
    
    var itemsSequence: Observable<[MovieCellViewModel]> {
        return itemsSequenceInner.asObservable()
    }
    
    func displayMovies() {
        let result = self.interactor.getAllMovies()
        displayActivityIndicator()
        self.vc.displayLoadingProgress()
        result.subscribeOn(MainScheduler.instance).subscribe {[unowned self] (event) in
            switch event {
            case .next(let movie):
                let movieVM = MovieCellViewModel(identifier: movie.identifier, title: movie.title)
                self.vc.didReceiveItems(items: [movieVM])
                self.itemsSequenceInner.value += [movieVM]
                break
            case .completed:
                hideActivityIndicator()
                self.vc.hideLoadingProgress()
                break
            case .error(let error):
                hideActivityIndicator()
                self.vc.hideLoadingProgress()
                self.vc.present(error: error)
                break
            }
            }.disposed(by: disposeBag)
    }
}
