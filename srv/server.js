/*!
 * SAP UI development toolkit for HTML5 (SAPUI5)
        (c) Copyright 2009-2023 SAP SE. All rights reserved 
 */

/**
 * Bootstraps the unified shell in SANDBOX MODE for standalone DEVELOPMENT or DEMO usage scenarios.
 * The renderer is specified in the global Unified Shell configuration object 'window["sap-ushell-config"]'.
 * The configuration object is based on a JSON file that can be given via URL parameter 'sap-ushell-sandbox-config',
 * or, alternatively, can be given at the default file location '/appconfig/fioriSandboxConfig.json'.
 * Note:
 *   - 'applications' provides a simple way to add application links to the sandbox launchpad
 *   - 'services' lets you add catalogues, groups, and IBN navigation tiles to the sandbox launchpad
 * The fiori2 renderer will render the shell header allowing, for instance, testing of additional
 * application setting buttons.
 * The navigation target resolution service is configured in a way that the empty URL hash is
 * resolved to our own application.
 * The sandbox platform is restricted to development or demo use cases and MUST NOT BE USED
 * FOR PRODUCTIVE SCENARIOS.
 */

const fs = require("node:fs");
const path = require("path");
const cds = require("@sap/cds");
const verifyToken = require("../middleware/authMiddleware");
const bodyParser = require("body-parser");

const getJSONFile = (path) => JSON.parse(fs.readFileSync(path));
const getObject = (obj, path) =>
  path.split("/").reduce((node, key) => node?.[key], obj);

let sandbox;

/**
 * Scans for all 'webapp' folders and manifest files stored in folder 'apps'.
 */
scanForAppFolders = (appFolder) => {
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
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { SELECT } = require("@sap/cds/lib/ql/cds-ql");
const INSERT = require("@sap/cds/lib/ql/INSERT");

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

/**
 * One-time event 'bootstrap', emitted immediately after the express.js app
 * has been created and before any middleware or CDS services are added to it.
 */
cds.once("bootstrap", async (app) => {
  sandbox = app;
});

/**
 * One-time event 'served', emitted when all services have been bootstrapped
 * and were added to the express.js app.
 */
cds.once("served", () => {
  // Sandbox configuration

  sandbox.get("/appconfig/fioriSandboxConfig.json", (req, res) => {
    const flpConfig = {
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
              groups: [],
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

    res.status(200);
    res.send(flpConfig);
  });

  // Sandbox Fiori Launchpad index.html file
  sandbox.get("/launchpad*", (req, res) => {
    res.status(200);
    res.send(`<!DOCTYPE html>
        <html lang="en">
        
        <head>
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>asdasdasd</title>
            <style>
                html,
                body,
                body>div,
                #container,
                #container-uiarea {
                    height: 100%;
                }
            </style>
            <script id="sap-ushell-bootstrap" src="https://ui5.sap.com/test-resources/sap/ushell/bootstrap/sandbox.js"></script>
            <script id="sap-ui-bootstrap" src="https://ui5.sap.com/resources/sap-ui-core.js" data-sap-ui-theme="sap_horizon"
                data-sap-ui-compatVersion="edge" data-sap-ui-async="true" data-sap-ui-preload="async"></script>
            <script id="sap-ushell-renderer">
                sap.ui.getCore().attachInit(() => sap.ushell.Container.createRenderer("fiori2", true).then((content) => content.placeAt("content")))
            </script>
        </head>
        
        <body id="content" class="sapUiBody sapUiSizeCompact"></body>
        
        </html>`);
  });

  sandbox.get("/login", (req, res) => {
    res.writeHead(200, { "content-type": "text/html" });
    fs.createReadStream("auth/login.html").pipe(res);
  });
  sandbox.get("/register", (req, res) => {
    res.writeHead(200, { "content-type": "text/html" });
    fs.createReadStream("auth/register.html").pipe(res);
  });

  sandbox.use(bodyParser.urlencoded({ extended: true }));

  sandbox.post("/register", async (req, res) => {
    try {
      const { username, password } = req.body;
      const hashedPassword = await bcrypt.hash(password, 10);
      console.log(hashedPassword);
      await INSERT.into("UsersModel").entries({
        username,
        password: hashedPassword,
      });
      res.status(201).json({ message: "User registered successfully" });
    } catch (error) {
      res.status(500).json({
        error: "Registration failed",
        errorMessage: JSON.stringify(error),
      });
    }
  });

  // User login
  sandbox.post("/login", async (req, res) => {
    try {
      const { username, password } = req.body;
      const user = await SELECT.one
        .from(`UsersModel`)
        .where({ email: req.body.username });
      console.log("User found:");
      if (!user) {
        return res.status(401).json({ error: "Authentication failed" });
      }
      console.log(user);
      const passwordMatch = await bcrypt.compare(password, user.password);
      if (!passwordMatch) {
        return res.status(401).json({ error: "Authentication failed" });
      }
      const token = jwt.sign({ userId: user._id }, "your-secret-key", {
        expiresIn: "30d",
      });
      res.status(200).json({ token });
    } catch (error) {
      res
        .status(500)
        .json({ error: "Login failed", errorMessage: JSON.stringify(error) });
    }
  });
});

// Delegate bootstrapping to built-in server.js of CDS
module.exports = cds.server;
