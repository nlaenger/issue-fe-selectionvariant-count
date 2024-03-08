import { Service } from "@sap/cds/apis/services";

export default (srv: Service) => {
  srv.on("CREATE", "A", (req, next) => {});

  srv.on("READ", "UIHelper", async (req, next) => {
    return { IsViewClusterAvailable: true };
  });
};
