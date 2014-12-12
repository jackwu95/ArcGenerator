ArcGenerator
============

Generate frames for arcs to use in WatchKit!

###Usage
```
let generator = ArcGenerator()
let animation = ArcAnimation.spinningArcAnimation()
generator.generateArcAnimationFrames(animation)
```
Make sure to run the app inside the **Simulator**

Comes with 2 default animations

 * `spinningArcAnimation`
 * `progressArcAnimation`

###Customizing
See `ArcAnimation.swift` to see how the default animations are generated.
