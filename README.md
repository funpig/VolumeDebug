# VolumeDebug

如果你在调试App的时候，需要不时的在App里查看日志，但又不方便中断程序的运行，那么你可以试试这个小工具。

写这个小工具的起因是，在开发ARKit相关的App时，ARSession如果中断会出现不可预测的问题。所以Apple在官方的Demo里面，是在UI上悬浮了一个debug View，然后在Setting UI里面控制debug view 的显示与否。这个始终不是特别方便，而且debug view区域也很小，不方便查看大量日志输出。

我的这个小工具，监听了音量键的按键事件，通过按键事件来控制debug view的显示。

####请在真机上测试，模拟器监听不到音量按键事件

if you want watch the log print in App UI when it running, you should try this tools. 

#####Please try it on device, the simulator could NOT get the event of volume key press.

###Usage
Copy all file in Utitity folder to your project. more detail please see the demo.

```
   override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //初始化监听事件
        NotificationManager.shareInstance.initAudioSession()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tickTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { _ in
            let timestamp = Date().timeIntervalSince1970
            
            //打印一条信息到DebugView的顶部
        DebugMananger.shareInstance.showDebugInfo("timestamp: \(timestamp)")
            
            //打印到DebugView的下部
        DebugMananger.shareInstance.showScrollDebugInfo("timestamp: \(timestamp)")
            print("timestamp: \(timestamp)")
        })
    }
```


### Contact Me
email: funpig@hotmail.com

QQ: 550462 (pls comments: github)

### Licence
MIT