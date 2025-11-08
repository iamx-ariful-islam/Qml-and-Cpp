import QtQuick
import QtQuick.Window


Window {
    id:root
    visible:true
    width: 850
    height: 500
    title: qsTr("Qt Quick Loading Animation")


    Rectangle{
        id:dot_1
        x:root.width*.3
        y:root.height/2-25
        width:40
        height:40
        color:"#4285f4"
        radius:100

        SequentialAnimation{
            running: true
            loops: Animation.Infinite

            ScaleAnimator {
                target:dot_1
                from:1
                to:0
                duration:840
            }
            ScaleAnimator{
                target:dot_1
                from:0
                to:1
                duration:840
            }
        }
    }

    Rectangle{
        id:dot_2
        x:root.width*.4
        y:root.height/2-25
        width:40
        height:40
        color:"#34a853"
        radius:100

        SequentialAnimation{
            running: true

            PauseAnimation { duration: 120 }

            SequentialAnimation{

                loops: Animation.Infinite

                ScaleAnimator {
                    target:dot_2
                    from:1
                    to:0
                    duration:840
                }
                ScaleAnimator{
                    target:dot_2
                    from:0
                    to:1
                    duration:840
                }
            }
        }
    }

    Rectangle{
        id:dot_3
        x:root.width*.5
        y:root.height/2-25
        width:40
        height:40
        color:"#fbbc05"
        radius:100

        SequentialAnimation{
            running: true

            PauseAnimation { duration: 240 }

            SequentialAnimation{

                loops: Animation.Infinite

                ScaleAnimator {
                    target:dot_3
                    from:1
                    to:0
                    duration:840
                }
                ScaleAnimator{
                    target:dot_3
                    from:0
                    to:1
                    duration:840
                }
            }
        }
    }

    Rectangle{
        id:dot_4
        x:root.width*.6
        y:root.height/2-25
        width:40
        height:40
        color:"#ea4335"
        radius:100

        SequentialAnimation{
            running: true

            PauseAnimation { duration: 360 }

            SequentialAnimation{

                loops: Animation.Infinite

                ScaleAnimator {
                    target:dot_4
                    from:1
                    to:0
                    duration:840
                }
                ScaleAnimator{
                    target:dot_4
                    from:0
                    to:1
                    duration:840
                }
            }
        }
    }
}
