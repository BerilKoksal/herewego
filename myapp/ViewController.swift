//
//  ViewController.swift
//  myapp
//
//  Created by mobven on 19.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }

    private func fetchImage() {
        let url = URL(string: "https://i1.sndcdn.com/artworks-CYsqCXTXPYrfv6Ki-orhJ5g-t500x500.jpg")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        task.resume()
    }

    @IBAction func changeButtonClicked(_ sender: Any) {
        imageView.image = UIImage(named: "magnum")
    }
}

