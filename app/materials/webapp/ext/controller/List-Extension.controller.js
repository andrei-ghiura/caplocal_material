sap.ui.loader.config({
  paths: {
    "sap/ui/thirdparty/html5-qrcode":
      "/materials/webapp/libs/qrcode/qrcode.min",
  },
  shim: {
    "sap/ui/thirdparty/html5-qrcode": {
      amd: true,
      exports: "Html5QrcodeScanner",
    },
  },
});

sap.ui.define(
  ["sap/ui/core/mvc/ControllerExtension", "sap/ui/thirdparty/html5-qrcode"],
  function (ControllerExtension, Html5Qrcode) {
    "use strict";

    return ControllerExtension.extend(
      "materials.ext.controller.List-Extension",
      {
        override: {
          onInit: function () {
            var oModel = this.base.getExtensionAPI().getModel();
          },
        },
        onScan: function (oEvent) {
          if (!this.oDefaultDialog) {
            this.oDefaultDialog = new sap.m.Dialog({
              title: "Scanează materialul",
              content: new sap.m.Page({
                id: "reader",
              }),
              beginButton: new sap.m.Button({
                type: sap.m.ButtonType.Emphasized,
                text: "OK",
                press: function () {
                  this.oDefaultDialog.close();
                }.bind(this),
              }),
              endButton: new sap.m.Button({
                text: "Close",
                press: function () {
                  this.oDefaultDialog.close();
                }.bind(this),
              }),
            });

            // to get access to the controller's model
			console.log(this)
            var oView = this.base.getExtensionAPI();
            oView.addDependent(this.oDefaultDialog);
          }

          this.oDefaultDialog.open();

          console.log(oEvent);
          console.log(this.base);
          function onScanSuccess(decodedText, decodedResult) {
            // handle the scanned code as you like, for example:
            alert(`Code matched = ${decodedText}`, decodedResult);
          }

          function onScanFailure(error) {
            // handle scan failure, usually better to ignore and keep scanning.
            // for example:
            console.warn(`Code scan error = ${error}`);
          }

          let html5QrcodeScanner = new Html5QrcodeScanner(
            "reader",
            { fps: 10, qrbox: { width: 250, height: 250 } },
            /* verbose= */ false
          );
          html5QrcodeScanner.render(onScanSuccess, onScanFailure);
        },
      }
    );
  }
);
