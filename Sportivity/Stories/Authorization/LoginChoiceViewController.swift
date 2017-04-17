//
//  LoginChoiceViewController.swift
//  Sportivity
//
//  Created by Andrzej Frankowski on 17/04/2017.
//  Copyright © 2017 Sportivity. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginChoiceViewController: UIViewController, ViewControllerProtocol {

    /// Tag of the view
    let viewTag : ViewTag = .loginChoice
    /// Main `DisposeBag` of the `ViewController`
    let disposeBag = DisposeBag()
    /// Observable that informs that `Router` should route to the `Route`
    let onRouteTo : Observable<Route> = PublishSubject<Route>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
