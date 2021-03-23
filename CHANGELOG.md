# Changelog

All notable changes to QuickConstraint project.

## v0.7.0 - [2021-03-23]

Changed
* UIStackView initializers now have default values for alignment and distribution

## v0.6.1 - [2021-02-13]

Fixed
* Build for macOS platform

## v0.6.0 - [2021-02-13]

Added
* UICollectionView extension

Changed
* Minimum iOS/tvOS version to 10
* `Margin` struct and returned to using `CGFloat` value

Removed
* Carthage/CocoaPods support

## v0.5.1 - [2021-02-03]

Changed
* `toSafeArea` to `toSafeAreaOf`

## v0.5.0 - [2020-09-21]

Added
* Swift 5.3 support

Changed
* Code organization

## v0.4.2 - [2020-08-22]

Added
* Xcode 12 builds in CI pipeline

Changed
* Rearranged Demo project path
* osx deployment target to 10.14 in podspec

Removed
* Obsolete targets from the project

Fixed
* Shown project version in documentation

## v0.4.1 - [2020-06-14]

Fixed
* `Package.swift` to use version 10.14 for the macOS platform 
* Incorrect QuickConstraint target version (v0.3.2 -> v0.4.1)

## v0.4.0 - [2020-06-13]

Changed
* activated/deactivated properties to functions with discardable results

## v0.3.1 - [2020-06-13]

Fixed
* Access modifiers for activated/deactivated properties not accessible outside of framework

## v0.3.0 - [2020-06-13]

Added
* Margin enum for encapsulating primitive conversion to CGFloat
* Ability to pin views to the corners of parent view: top leading/top trailing/bottom leading/bottom trailing
* Demos folder
* Added `isActive` parameter for `pin` functions
* Added `activated` and `deactivated` properties for easier way to activate/deactivate constraints

## v0.2.1 - [2020-06-06]

Fixed
* Generating documentation
* Supported platforms in podspec file

## v0.2.0 - [2020-05-08]

Added
* Carthage support
* tvOS support
* API documentation
* macOS support
* Added documentation files

## v0.1.0 - [2020-04-22]

Added
* Pinning view directly to the parent view
* Centering view in the parent view
* Simple sizing constraints
* Simple UIStackView initialization
* Pinning opposite constraints: top <-> bottom, leading <->  trailing
