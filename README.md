# UICollectionViewTest
In iOS 9.0.x, UICollectionView in a custom UIViewController container will get incorrect top content inset. The value does not honor status bar height and navigation bar height.

For example in the code, I set the `contentInset` of `collectionView` to be `(10, 0, 10, 0)`. In iOS simulator or device with iOS version other than 9.0.x, the `collectionView`'s `contentInset` will be `(74, 0, 10, 0)` when view controller `willLayoutSubviews`. However, in iOS 9.0.x, the contentInset will always be `(10, 0, 10, 0)`

This repository demostrated the issue and provided a temporary fix by manually adding the values.

Please let me know if you have a better solution for this problem. 


Note: The solution only works for iOS 8.0 and later. For iOS 7.1 or earlier version, check solutions of checking system version here: http://nshipster.com/swift-system-version-checking/
