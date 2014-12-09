ArcGenerator
============

Generate frames for arcs to use in WatchKit!

###Usage
```
let params = ArcParams(radius: 100)
let generator = ArcGenerator()
generator.generateArcs(params)
```
Make sure to run the app inside the **Simulator**

###Other Params
Several params are available to customize the generated arc. Set them through the initializer of `ArcParams`
```
 public init(radius: Int,
        lineWidth: Int = 6,
        padding: Int = 10,
        startAngle: Double = 3.0*M_PI/2.0,
        clockwise: Bool = true,
        color: UIColor = UIColor.whiteColor(),
        name: String = "frame",
        frameCount: Int = 360) 
```
