# Changelog

All notable changes to QuickConstraint project.

## v0.3.1 - [2020-06-13]

Fixed:
* Access modifiers for activated/deactivated properties not accessible outside of framework

## v0.3.0 - [2020-06-13]

Added:
* Margin enum for encapsulating primitive conversion to CGFloat
* Ability to pin views to the corners of parent view: top leading/top trailing/bottom leading/bottom trailing
* Demos folder
* Added `isActive` parameter for `pin` functions
* Added `activated` and `deactivated` properties for easier way to activate/deactivate constraints

## v0.2.1 - [2020-06-06]

Fixed:
* Generating documentation
* Supported platforms in podspec file

## v0.2.0 - [2020-05-08]

Added:
* Carthage support
* tvOS support
* API documentation
* macOS support
* Added documentation files

## v0.1.0 - [2020-04-22]

Added:
* Pinning view directly to the parent view
* Centering view in the parent view
* Simple sizing constraints
* Simple UIStackView initialization
* Pinning opposite constraints: top <-> bottom, leading <->  trailing
