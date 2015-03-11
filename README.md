ArcGenerator
============

Generate frames for arcs to use in WatchKit!
Created for [WatchKit by Tutorials](http://www.raywenderlich.com/store/watchkit-by-tutorials)

Create arcs like these with infinite customizable options:
![Arcs](/../master/Arcs.png?raw=true "Arcs")


###Usage
#### 1. Run ArcGenerator
```
let generator = ArcGenerator()
let animation = ArcAnimation.spinningArcAnimation()
generator.generateArcAnimationFrames(animation)
```
Make sure to run the app inside the **Simulator**

#### 2. Grab Your Images
Find the terminal output:
```
Done generating frames "progress" to path:
/Users/jackwu/Library/Developer/CoreSimulator/Devices/F5757BEE-CD7C-4A21-883B-174DE61DF38E/data/Containers/Data/Application/2534EC1B-ED76-458F-AC27-7C3B1540E777/Documents/progress
```
Copy the path and go to your Terminal.
Type `open` followed by the path to open the folder
```
open /Users/jackwu/Library/Developer/CoreSimulator/Devices/F5757BEE-CD7C-4A21-883B-174DE61DF38E/data/Containers/Data/Application/2534EC1B-ED76-458F-AC27-7C3B1540E777/Documents/progress
```

###Customizing

Comes with 2 default animations

 * `spinningArcAnimation`
 * `progressArcAnimation`

See `ArcAnimation.swift` to see how the default animations are generated and how you can customize it to make new ones.

###Other
To render animation frames from `UIViews`, check out frosty's [FlipBook](https://github.com/frosty/Flipbook).

ArcGenerator is released under the MIT license.
