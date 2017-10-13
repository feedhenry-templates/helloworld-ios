# helloworld-ios-app

[![circle-ci](https://img.shields.io/circleci/project/github/feedhenry-templates/helloworld-ios/master.svg)](https://circleci.com/gh/feedhenry-templates/helloworld-ios)

> Swift version is available [here](https://github.com/feedhenry-templates/helloworld-ios-swift).

Author: Corinne Krych   
Level: Intermediate   
Technologies: Objective-C, iOS, RHMAP, CocoaPods.   
Summary: A demonstration of how to get started with remote cloud call in RHMAP.   
Community Project: [Feed Henry](http://feedhenry.org)   
Target Product: RHMAP   
Product Versions: RHMAP 3.7.0+   
Source: https://github.com/feedhenry-templates/helloworld-ios   
Prerequisites: fh-ios-sdk: 5.+, Xcode: 9+, iOS SDK: iOS9+, CocoaPods 1.3.0+   

## What is it?

Simple native iOS app to test your remote cloud connection in RHMAP. Its server side companion app: [HelloWorld Cloud App](https://github.com/feedhenry-templates/helloworld-cloud). This template app demos how to intialize a cloud call and make calls to cloud endpoints. The app uses [fh-ios-sdk](https://github.com/feedhenry/fh-ios-sdk).

If you do not have access to a RHMAP instance, you can sign up for a free instance at [https://openshift.feedhenry.com/](https://openshift.feedhenry.com/).

## How do I run it?  

### RHMAP Studio

This application and its cloud services are available as a project template in RHMAP as part of the "Native iOS Hello World Project" template.

### Local Clone (ideal for Open Source Development)

If you wish to contribute to this template, the following information may be helpful; otherwise, RHMAP and its build facilities are the preferred solution.

## Build instructions

1. Clone this project
1. Populate ```helloworld-ios-app/fhconfig.plist``` with your values as explained [on section 2.1.4. Setup](https://access.redhat.com/documentation/en/red-hat-mobile-application-platform-hosted/3/paged/client-sdk/chapter-2-native-ios-objective-c).
1. Run ```pod install``` 
1. Open helloworld-ios-app.xcworkspace
1. Run the project
 
## How does it work?

### Init

In ```helloworld-ios-app/HomeViewController.m``` the FH.init call is done:

```
- (void)viewDidLoad {  
    // Initialized cloud connection
    [FH initWithSuccess:^(FHResponse *response) { // [1] 
        // Do you other calls to the cloud.       // [2]
    } AndFailure:^(FHResponse *response) {
        // Log an error                           // [3]
    }];
}

```

[1] Initialize the cloud connection.   
[2] On successfull callback, you are ready to do other calls.   
[3] Log an eror.   

### Cloud call

In ```helloworld-ios-app/HomeViewController.m``` the FH.init call is done:

```
- (IBAction)cloudCall:(id)sender {
    NSDictionary *args = [NSDictionary dictionaryWithObject:name.text forKey:@"hello"];
    FHCloudRequest *req = (FHCloudRequest *) [FH buildCloudRequest:@"/hello" WithMethod:@"POST" AndHeaders:nil AndArgs:args];      // [1]  
    [req execAsyncWithSuccess:^(FHResponse * res) {       // [2]
        // Response
    } AndFailure:^(FHResponse * res){
        // Errors
    }];
}
```

[1] Create a cloud request specifying endpoint and its arguments.   
[2] Make asynchronous call with its success and error callbacks.   

### iOS9 and non TLS1.2 backend

If your RHMAP is depoyed without TLS1.2 support, open as source  ```helloworld-ios-app/helloworld-ios-app-Info.plist``` uncomment the exception lines:

```
  <!--
  <key>NSAppTransportSecurity</key>
  <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
  </dict>
   -->
```
