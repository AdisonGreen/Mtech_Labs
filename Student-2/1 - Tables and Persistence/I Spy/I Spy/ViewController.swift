//
//  ViewController.swift
//  I Spy
//
//  Created by Adison Green on 10/7/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
    
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / imagePokemonWorlds.bounds.width
        let heightScale = size.width / imagePokemonWorlds.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateZoomFor(size: view.bounds.size)
    }
    
    @IBOutlet weak var imagePokemonWorlds: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imagePokemonWorlds
    }
}
