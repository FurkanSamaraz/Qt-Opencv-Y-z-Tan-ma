import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtMultimedia 5.8
import com.amin.classes 1.0

ApplicationWindow
{
    visible: true
    width: 800
    height: 600
    title: qsTr("YuzTan")

    CvDetectFilter
    {
        id: testFilter
        onObjectDetected:
        {
            if((w == 0) || (h == 0))
            {
                smile.visible = false;
            }
            else
            {
                var r = video.mapNormalizedRectToItem(Qt.rect(x, y, w, h));
                smile.x = r.x;
                smile.y = r.y;
                smile.width = r.width;
                smile.height = r.height;
                smile.visible = true;
            }
        }
    }

    Camera
    {
        id: camera
    }

    ShaderEffect
    {
        id: videoShader
        property variant src: video
        property variant source: video
    }

    SwipeView
    {
        id: mainSwipe
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        interactive: false
//*********************************************************************ANASAFYA BÖLÜMÜ************************************************************
        Page
        {
            padding: 5
            GroupBox
            {
                anchors.fill: parent
                padding: 5
                ColumnLayout
                {
                    anchors.fill: parent
                    VideoOutput
                    {
                        id: video
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        source: camera
                        autoOrientation: false

                        filters: [testFilter]

                        Image
                        {
                            id: smile
                            source: "qrc:/indir.png"
                            visible: false
                        }
                    }

                    RowLayout
                    {
                        Layout.alignment: Qt.AlignHCenter
                        Layout.fillWidth: true
                    }
                }
            }
        }
//*********************************************************************YARDIM BÖLÜMÜ************************************************************
        Page
        {
            padding: 5
            GroupBox
            {
                anchors.fill: parent
                padding: 5

                Label
                {
                    anchors.fill: parent
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    wrapMode: Label.Wrap

                    text:  "Linked <a href=\"https://www.linkedin.com/in/furkan-samaraz-176401200/\">https://www.linkedin.com/in/furkan-samaraz-176401200/</a><br>" +
                           "Youtube Sayfam <a href=\"https://www.youtube.com/channel/UCF6tbHFxGOSlVkBq71Amh2w\">https://www.youtube.com/channel/UCF6tbHFxGOSlVkBq71Amh2w</a>"



                    onLinkActivated:
                    {
                        Qt.openUrlExternally(link)
                    }
                }
            }
        }
    }
//*********************************************************************BUTTON BÖLÜMÜ************************************************************
    footer: TabBar
    {
        id: tabBar
        currentIndex: mainSwipe.currentIndex
        TabButton
        {
            text: qsTr("Anasayfa")
        }
        TabButton
        {
            text: qsTr("Yardım")
        }
    }
}
