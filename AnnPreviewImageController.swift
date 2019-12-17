import UIKit

class AnnPreviewImageController: UIViewController {
    
    @IBOutlet weak var imageViewPreview: UIImageView!
    
    var currentPhoto: UIImage!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageViewPreview.image = currentPhoto
    }
    
}
