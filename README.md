# ImageDisplayable
A small library for downloading images, using `URLSession`

## Installation

### Requirements
* Swift 4

### Carthage

Add the following line to your Cartfile:

```github "Chandlerdea/ImageDisplayable"```

### Manual

You can just drop `ImageDisplayable.xcodeproj` into your project and then add DateTransformer.framework to your app’s embedded frameworks.

## Use

`ImageDisplayable` is a protocol. To conform, you only need the following property:

```var imageSession: URLSession { get set }```

Once an object has that property, it can call the `download(at:, completion:)` function, because it has a default implementation.

Clone the project and open the Playground to see an example of the framework in use.

## Support

If you find any bugs, or have any critiques, please open a PR and I will fix them as soon as I can. And if you feel the need to add some more tests, you're more than welcome!
