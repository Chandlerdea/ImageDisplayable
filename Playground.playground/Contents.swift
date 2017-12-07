//: Playground - noun: a place where people can play

import UIKit
import ImageDisplayable
import PlaygroundSupport

class ViewController: UIViewController, ImageDisplayable {
    
    var imageSession: URLSession = URLSession(configuration: .ephemeral)
    
    lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override var traitCollection: UITraitCollection {
        return UITraitCollection(traitsFrom: [
            UITraitCollection(horizontalSizeClass: .compact),
            UITraitCollection(verticalSizeClass: .regular)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.imageView)
        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url: URL = URL(string: "https://picsum.photos/200")!
        self.download(at: url) { [weak self] (image: UIImage?, error: Error?) in
            self?.imageView.image = image
        }
    }
    

}

let vc = ViewController()
PlaygroundPage.current.liveView = vc.view
