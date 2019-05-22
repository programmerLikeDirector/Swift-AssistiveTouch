# Swift-AssistiveTouch
仿iPhone AssistiveTouch视图效果

![demo](https://github.com/programmerLikeDirector/Swift-AssistiveTouch/blob/master/FloatViewDemo.gif)


一行代码接入：
```
override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let floatView = FloatViewTool.sharedTool
        floatView.creatFloatView(OnTarget: self) {
            NSLog("点击btn", "")
        }
        
    }
```
