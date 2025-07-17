import fs from("node:fs");
import path from("path");

const getJSONFile = (path) => JSON.parse(fs.readFileSync(path));

const getObject = (obj, path) =>
  path.split("/").reduce((node, key) => node?.[key], obj);

const scanForAppFolders = (appFolder) => {
  let appFolders = [];
  fs.readdirSync(appFolder, { withFileTypes: true })
    .filter((dirent) => dirent.isDirectory())
    .map((dirent) => dirent.name)
    .forEach((subFolder, depIdx) => {
      if (subFolder !== "." && subFolder !== "..") {
        const dependencyPath = path.resolve(appFolder, subFolder);
        const webappPath = path.join(dependencyPath, "webapp");
        const manifestPath = path.join(webappPath, "manifest.json");
        if (!fs.existsSync(webappPath)) {
          appFolders = [...appFolders, ...scanForAppFolders(dependencyPath)];
        } else {
          appFolders.push({
            subFolder,
            manifestPath,
          });
        }
      }
    });
  return appFolders;
};
/**
 * Retrieves all app's manfifest settings for entry 'sap.app/crossNavigation/inbounds'.
 */
const getApps = () => {
  const rootDirectory = fs.realpathSync(process.cwd());
  const appDirectory = path.join(rootDirectory, "app");
  const appFolders = scanForAppFolders(appDirectory);
  let apps = {};
  appFolders.forEach((appFolder) => {
    if (fs.existsSync(appFolder.manifestPath)) {
      // console.log(manifestPath);
      const manifestConfig = getJSONFile(appFolder.manifestPath);
      const app = manifestConfig["sap.app"];
      if (app) {
        const inbounds =
          getObject(manifestConfig, "sap.app/crossNavigation/inbounds") || {};
        const intentKeys = Object.keys(inbounds || {});
        const firstIntent = intentKeys?.[0] || null;
        const firstInbound = inbounds[firstIntent];
        const appId = `${firstInbound.semanticObject}-${firstInbound.action}`;
        const title = firstInbound.title || "Undefined";
        const description = firstInbound.subTitle || "Undefined";
        const additionalInformation = `SAPUI5.Component=${app.id}`;
        const applicationType = "URL";
        const url = `../${appFolder.subFolder}/webapp/`;
        apps[appId] = {
          title,
          description,
          additionalInformation,
          applicationType,
          url,
        };
      } else {
        Log(`ERROR: Wrong manifest ${appFolder.manifestPath}`);
      }
    }
  });
  return apps;
};
export const fioriSandboxConfig = {
  defaultRenderer: "fiori2",
  renderers: {
    fiori2: {
      componentData: {
        config: {
          enablePersonalization: true,
          enableUserDefaultParameters: true,
          enableHideGroups: true,
          enableSetTheme: true,
          enableSearch: true,
          disableSignOut: true,
        },
      },
    },
  },
  applications: getApps(),
  services: {
    Personalization: {
      adapter: {
        config: {
          clientStorage: "session",
          enableClientSidePersonalization: true,
        },
      },
    },
    LaunchPage: {
      adapter: {
        config: {
          groups: [
            {
              id: "Material",
              title: "Material",
              isPreset: true,
              isVisible: true,
              isGroupLocked: false,
              tiles: [
                {
                  id: "MaterialsList",
                  tileType: "sap.ushell.ui.tile.StaticTile",
                  properties: {
                    title: "Browse Materials",
                    targetURL: "#Materials-displayAll",
                  },
                },
              ],
            },
            {
              id: "Supplier",
              title: "Supplier",
              isPreset: true,
              isVisible: true,
              isGroupLocked: false,
              tiles: [
                {
                  id: "SupplierList",
                  tileType: "sap.ushell.ui.tile.StaticTile",
                  properties: {
                    title: "Browse Suppliers",
                    targetURL: "/supplier/webapp/index.html",
                  },
                },
              ],
            },
          ],
        },
      },
    },
    NavTargetResolution: {
      config: {
        enableClientSideTargetResolution: true,
      },
    },
    // ClientSideTargetResolution: {
    //   adapter: {
    //     config: {
    //       inbounds: {
    //         MaterialsList: {
    //           semanticObject: "Material",
    //           action: "displayAll",
    //           title: "Browse Materials",
    //           resolutionResult: {
    //             applicationType: "SAPUI5",
    //             additionalInformation: "SAPUI5.Component=materials",
    //             url: "/materials/webapp",
    //           },
    //         },
    //         SupplierList: {
    //           semanticObject: "Supplier",
    //           action: "displayAll",
    //           title: "Browse Suppliers",
    //           resolutionResult: {
    //             applicationType: "SAPUI5",
    //             additionalInformation: "SAPUI5.Component=suppliers",
    //             url: "/supplier/webapp",
    //           },
    //         },
    //       },
    //     },
    //   },
    // },
  },
};

