//
//  CellImage.swift
//  HelloWorld
//
//  Created by Puneet Rao on 20/05/16.
//  Copyright © 2016 Geeks. All rights reserved.
//

import UIKit

class CellImage: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews()
    {
        self.layer.cornerRadius = self.layer.frame.size.height / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.grayColor().CGColor
    }

}
