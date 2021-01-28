//
//  ViewController.swift
//  ScrollViewApp
//
//  Created by Юлия on 28.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    private var zoomingView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/db/%D0%9E%D0%B7%D0%B5%D1%80%D0%BE_%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%BE%D0%B5_%D0%A2%D0%BE%D0%BA%D0%BE.jpg"),
           let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            let imageView = UIImageView(image: image)
            zoomingView = imageView
            scrollView.addSubview(imageView)
            
            scrollView.contentSize = image.size // устанавливаем размер контента по размеру фото, чтобы начался скролл
            scrollView.minimumZoomScale = 0.01
            scrollView.maximumZoomScale = 2
        }
    }
    
    
    @IBAction func actionHandler(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: scrollView.setContentOffset(CGPoint.zero, animated: true) // scroll to top
        case 1: break
        case 2: break
        default: break
        }
    }
}

extension ViewController:  UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scroll happend")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return zoomingView //  отдельно созданное проперти для передачи вью в экстеншн
    }
    
}
