import QtQuick
import QtQuick.Controls
import com.company.navblue 1.0

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("QML Cpp Integration")

    Component.onCompleted:
    {
        //progress.value = testing.workload
        startbtn.enabled = true
        stopbtn.enabled = false
        pausebtn.enabled = false
        resumebtn.enabled = false
    }

    Test
    {
        id: testing

        onStart:
        {
            startbtn.enabled = false
            stopbtn.enabled = true
            pausebtn.enabled = true
            resumebtn.enabled = false
            status.text = "Started"
        }

        onStop:
        {
            startbtn.enabled = true
            stopbtn.enabled = false
            pausebtn.enabled = false
            resumebtn.enabled = false
            status.text = "Stopped"
        }

        onPause:
        {
            startbtn.enabled = false
            stopbtn.enabled = true
            pausebtn.enabled = false
            resumebtn.enabled = true
            status.text = "Paused"
        }

        onResume:
        {
            startbtn.enabled = false
            stopbtn.enabled = true
            pausebtn.enabled = true
            resumebtn.enabled = false
            status.text = "Resumed"
        }

        onProgress:
        {
            status.text = "Progress ..." + testing.workload + "%"
            progress.value = (testing.workload * 0.01)
        }
    }

    Column
    {
        id: column
        width: 500
        height: 300
        spacing: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Label
        {
            id: status
            text: "Status"
            color: "red"
            font.pointSize: 15
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ProgressBar
        {
            id: progress
            width: parent.width
            value: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row
        {
            id: row
            x: 150
            width: parent.width
            height : 50
            spacing: 20
            //anchors.horizontalCenter: parent.horizontalCenter

            Button
            {
                id: startbtn
                text: "Start"

                onClicked:
                {
                    testing.started()
                    console.log("Start button clicked")
                }
            }

            Button
            {
                id: pausebtn
                text: "Pause"

                onClicked:
                {
                    testing.paused()
                    console.log("Pause button clicked")
                }
            }

            Button
            {
                id: resumebtn
                text: "Resume"

                onClicked:
                {
                    testing.resumed()
                    console.log("Resume button clicked")
                }
            }

            Button
            {
                id: stopbtn
                text: "Stop"

                onClicked:
                {
                    testing.stopped()
                    console.log("Stop button clicked")
                }
            }
        }
    }
}
