
# react-native-ff-toast

## Getting started

`$ npm install react-native-ff-toast --save`

### Mostly automatic installation

`$ react-native link react-native-ff-toast`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-ff-toast` and add `RNFfToast.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNFfToast.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNFfToastPackage;` to the imports at the top of the file
  - Add `new RNFfToastPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-ff-toast'
  	project(':react-native-ff-toast').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-ff-toast/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-ff-toast')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNFfToast.sln` in `node_modules/react-native-ff-toast/windows/RNFfToast.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Ff.Toast.RNFfToast;` to the usings at the top of the file
  - Add `new RNFfToastPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNFfToast from 'react-native-ff-toast';

// TODO: What to do with the module?
RNFfToast;
```
  