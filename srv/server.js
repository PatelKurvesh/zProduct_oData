const cds = require("@sap/cds");
const cors = require('cors');
const cov2ap = require("@sap/cds-odata-v2-adapter-proxy");
cds.on("bootstrap", function (app) {
    app.get("/Modules", async (req, res) => {
        console.log("Custom /Modules route hit");
        res.send("Modules route working");
    });
    app.use([cors(), cov2ap()]);
});
module.exports = cds.server;
