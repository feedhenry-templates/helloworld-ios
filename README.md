# helloworld-ios-app 

> Objective-c version of HelloWorld app is available in [master branch](https://github.com/feedhenry-templates/helloworld-ios).

Author: Corinne Krych   
Level: Intermediate  
Technologies: Swift, iOS, RHMAP, CocoaPods.
Summary: A demonstration of how to get started with remote cloud call in RHMAP.
Community Project : [Feed Henry](http://feedhenry.org)
Target Product: RHMAP  
Product Versions: RHMAP 3.7.0+   
Source: https://github.com/feedhenry-templates/helloworld-ios  
Prerequisites: fh-ios-sdk : 3.+, Xcode : 7.2+, iOS SDK : iOS7+, CocoaPods  0.39+

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

2. Populate ```iOS-Template-App/fhconfig.plist``` with your values as explained [here](http://docs.feedhenry.com/v3/dev_tools/sdks/ios.html#ios-configure).

3. Run ```pod install``` 

4. Open Helloworld-app-iOS.xcworkspace

5. Run the project
 
## How does it work?

### Init

In ```iOS-Template-App/HomeViewController.swift``` the FH.init call is done:
```
- (void)viewDidLoad {  
    override func viewDidLoad() {
        // Initialized cloud connection
        let successCallback:(AnyObject!) -> Void = {response in // [2]
            print("initialized OK")
            self.button.hidden = false
        }
        let errorCallback: (AnyObject!) -> Void = {response in  // [3]
            if let response = response as? FHResponse {
                print("FH init failed. Error = \(response.rawResponseAsString)")
                self.result.text = "Please fill in fhconfig.plist file."
            }
        }
        FH.initWithSuccess(successCallback, andFailure: errorCallback)  // [1]
    }
}

```
[1] Initialize the cloud connection.

[2] On successfull callback, you are ready to do other calls.

[3] Log an eror.

### Cloud call

In ```iOS-Template-App/HomeViewController.m``` the FH.init call is done:
```
@IBAction func cloudCall(sender: AnyObject) {
    let args = ["hello": name.text ?? "world"]    // [1]
    let successCallback:(AnyObject!) -> Void = {response in
         if let response = response as? FHResponse {
            if let parsedRes = response.parsedResponse as? [String:String] {
                self.result.text = parsedRes["msg"]
            }
        }
    }
    let errorCallback: (AnyObject!) -> Void = {response in
        if let response = response as? FHResponse {
            print("initialize fail, \(response.rawResponseAsString)")
            self.button.hidden = true
        }
    }
    FH.performCloudRequest("hello", withMethod: "POST", 
       andHeaders: nil, andArgs: args, andSuccess: successCallback, andFailure: errorCallback)  // [2]
    }
```
[1] Create a dictionary of arguments.

[2] Make asynchronous call with its success and error callbacks.

### iOS9 and non TLS1.2 backend

If your RHMAP is depoyed without TLS1.2 support, open as source  ```blank-ios-app/blank-ios-app-Info.plist.plist``` uncomment the exception lines:

```
  <!--
  <key>NSAppTransportSecurity</key>
  <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
  </dict>
   -->
```