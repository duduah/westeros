//
//  WikiViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 15/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    // MARK: - Properties
    var model: House
    
    // Mark: - Initialization
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        // Título para vistas de navigation/tabbar...
        title = "\(model.name) wiki"
    }
    
    // chapuza metida por compilador
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.isHidden = false
        loadingView.startAnimating()
        webView.navigationDelegate = self
        syncModelWithView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(houseDidChange),
                                       name: NSNotification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME),
                                       object: nil) // porque se puede llamar desde distintos sitios. Si hubiese un objeto, probablemente se podría usar un delegate en lugar de las notificaciones.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Nos damos de baja en las notificaciones
        // No nos damos de baja en un dinit porque se podría pulsar otra casa a la derecha
        // cuando tenemos este vc en pantalla, por lo que seguiría en memoria, no se haría un pop en
        // el navigation, por lo que el dinit no se ejecutaría hasta ese pop.
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        title = model.name
        webView.load(URLRequest(url: model.wikiURL))
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification) {
        // Extraer el userInfo de la notificacion
        guard let info = notification.userInfo else {
            return
        }
        
        // Sacar la casa del usuario
        let house = info[HOUSE_KEY] as? House
        
        // Actualizar el modelo
        model = house!
        
        // Sincronizar la vista
        syncModelWithView()
    }
}

extension WikiViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.stopAnimating()
        loadingView.isHidden = true
        loadingView.hidesWhenStopped = true
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let type = navigationAction.navigationType
        switch type {
        case .linkActivated, .formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
}
