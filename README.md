# POIs

This project to show list of POIs on Google Map.

`Swift-4.2`, `Xcode 10.0`, `MVVM`

### How to setup:
1. Install `CocoaPods` if needed 
2. Open terminal and run script `pod install`
3. Open `POIs.xcworkspace`
4. Press `⌘` + `R` to run project 

### Project structure
- Model: Contains entities like POI
- Engine:
	- Service: Contains all services api related to network
	- Utility: Contains utility classes like Mapping JSON
	- Extension: Contains categories
- ViewModel: Contains all viewModels for all screens
- View: Contains all views, view controller for all screens
- Storyboard: Contains all storyboards, each screen will have its corresponding storyboard.
- Resource: Assets, icons



### Testing: Unit + UI Test:
Press `⌘` + `U` to test all project  

`sut`: Subject/System Under Test

### Libraries:
- GoogleMaps
- Alamofire: For networking, this library facilitates to make network request


##### Change location to HCM City
1. Press `⌘` + `R` to run project 
2. Select `Debug` > `Simulate Location` > `Location`
<img width="331" alt="screenshot 2018-10-21 at 1 44 04 am" src="https://user-images.githubusercontent.com/6329656/47259371-02810d00-d4d3-11e8-8a7f-047425febcfb.png">

<img width="274" alt="screenshot 2018-10-21 at 1 44 14 am" src="https://user-images.githubusercontent.com/6329656/47259379-10cf2900-d4d3-11e8-8fc4-c7adfc4e5657.png">
