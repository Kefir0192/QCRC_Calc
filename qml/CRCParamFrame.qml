import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1
import "./controls"



Frame {

    topPadding: 5


    ColumnLayout {
        id: layout_col

        anchors.fill: parent


        RowLayout {
            id: layout

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            spacing: 6


            ComboBox {
                id: crc_name_comboBox

                implicitWidth: 150
                Layout.minimumWidth: 200

                model: uCRC.crc_names

                currentIndex: uCRC.index

                onCurrentIndexChanged: uCRC.index = currentIndex
            }


            Label {
                text: "Bits (1..64):"

                rightPadding: 0
                leftPadding: 16

                verticalAlignment: Text.AlignVCenter
            }


            SpinBox2d {
                id: crc_bits_spinBox

                to: 64
                from: 1
                value: 1

                Layout.maximumWidth: 120
                Layout.preferredWidth: 150
                Layout.minimumWidth: 150
            }


            CheckBox {
                id: crc_RefIn_checkBox

                text: qsTr("RefIn")
            }


            CheckBox {
                id: crc_RefOut_checkBox

                text: qsTr("RefOut")

                onCheckedChanged: layout3.visible = !layout3.visible;
            }


            Button {

                anchors.right: parent.right
                anchors.rightMargin: -60

                implicitWidth: 150

                rotation: 45

                text: qsTr("Fork me")

                onPressed: Qt.openUrlExternally("https://github.com/KoynovStas/QCRC_Calc");
            }
        }


        RowLayout {
            id: layout2

            anchors.top: layout.top
            anchors.left: parent.left
            anchors.right: parent.right

            spacing: 10

            anchors.topMargin: 50


            MyTextEdit {
                label.text: "Poly(Hex):"
//                Layout.fillWidth: true
            }

            MyTextEdit {
                label.text: "Init(Hex):"
//                Layout.fillWidth: true
            }

            MyTextEdit {
                label.text: "XorOut(Hex):"
//                Layout.fillWidth: true
            }

        }



        RowLayout {
            id: layout3

            anchors.top: layout2.top
            anchors.left: parent.left
            anchors.right: parent.right

            spacing: 10

            anchors.topMargin: 35


            MyTextEdit {
                label.text: "Check(Hex):"

                textField.readOnly: true
                textField.text: "0xFFFFFF"
                textField.color: "gray"
            }

            MyTextEdit {
                label.text: "Mask(Hex):"

                textField.readOnly: true
                textField.text: "0xFFFFFF"
                textField.color: "gray"
            }

            MyTextEdit {
                label.text: "TopBit(Hex):"

                textField.readOnly: true
                textField.text: "0xFFFFFF"
                textField.color: "gray"
            }
        }
    }


}