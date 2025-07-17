import cds, { User } from "@sap/cds";
import { Request, Response, NextFunction } from "express";
type Req = Request & { user: typeof User, tenant: string };

export default function custom_auth(req: Req, res: Response, next: NextFunction) {
  // do your custom authentication ...
  cds.context.user = req.user;
  cds.context.tenant = req.tenant;
  next();
}