# ACAnimatedTextField

ACAnimatedTextField is a subclass of UITextField which replaces a text placeholder with an image.

## Installation
ACAnimatedTextField is one file, simply drag and drop `ACAnimatedTextField/ACAnimatedTextField.swift` into your project and set the class of a UITextField to ACAnimatedTextField

## Preview
![Preview](misc/preview.gif)

##Customization
3 things are currently able to be customized.

- Image
- Active colour
- Inactive colour

You can either set them via code or in the IB

### Interface Builder
![IBScreenshot](misc/IBScreenshot.png)

### Code
```swift
demoTextField.activeColour = UIColor.redColor()
demoTextField.inactiveColour = UIColor.greenColor()
demoTextField.textFieldImage = UIImage(named: "locked")
```

### License
ACAnimatedTextField is under the MIT license. Please check out LICENSE.md for more information
