

import UIKit

@IBDesignable
class UnderlinedTextField: UITextField {
    
    let red = UIColor(red: 234.0/255.0, green: 36.0/255.0, blue: 37.0/255.0, alpha: 1.0)
    
    @IBInspectable var width: CGFloat = 0.0
    @IBInspectable var color: UIColor = UIColor(red: 234.0/255.0, green: 36.0/255.0, blue: 37.0/255.0, alpha: 0.5)
    @IBInspectable var placeholderColor: UIColor = UIColor.white
    @IBInspectable var icon:UIImage?
    @IBInspectable var iconIndent:Int=0
    @IBInspectable var icony:CGFloat=0
    @IBInspectable var indentation:CGFloat=20
    @IBInspectable var borderWidth:CGFloat=0
    @IBInspectable var borderColor:UIColor = UIColor(red: 234.0/255.0, green: 36.0/255.0, blue: 37.0/255.0, alpha: 0.5)
    @IBInspectable var borderStyling:UITextField.BorderStyle = BorderStyle.none
    

    
    
    override func draw(_ rect: CGRect) {
        let underline = CALayer()
        self.borderStyle = .none
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor.cgColor
        underline.borderColor = color.cgColor
        underline.frame = CGRect(x: 0, y: self.frame.size.height - width , width:  self.frame.size.width, height: self.frame.size.height + 10)
        underline.borderWidth = width
        self.layer.addSublayer(underline)
        self.layer.masksToBounds = true
        
        if(self.attributedPlaceholder?.string != nil){
            let placholderString = NSMutableAttributedString(string: self.attributedPlaceholder!.string, attributes: [NSAttributedString.Key.foregroundColor:placeholderColor])
            self.attributedPlaceholder = placholderString
        }
        
        if(icon != nil){
            if(iconIndent>0){
                let imageView = UIImageView(frame: CGRect(x: iconIndent, y: 0, width: 20, height: 20))
                imageView.center.y=self.icony
                imageView.contentMode=UIView.ContentMode.scaleAspectFit
                imageView.image = icon?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
                self.addSubview(imageView)
                print(imageView.frame)
            }
            else{
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                imageView.contentMode=UIView.ContentMode.scaleAspectFit
                imageView.image = icon?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
                self.leftView = imageView
                self.leftViewMode = UITextField.ViewMode.always
                self.addSubview(imageView)
            }
        }
        
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: indentation, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: indentation, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    

}
