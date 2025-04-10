const cds = require("@sap/cds");

module.exports = (srv => {
    let {Modules, Employees} = srv.entities;

    srv.before("CREATE", Modules, async (req) => {
        let db = await cds.connect.to('db');
        let tx = db.tx(req);
        try {
            let sQuery = `SELECT MAX(MODULE_ID) AS COUNT FROM ${Modules}`;
            let employeeTable = await tx.run(sQuery);
            employeeTable[0].COUNT = employeeTable[0].COUNT + 1;
            req.data.MODULE_ID = employeeTable[0].COUNT;
        } catch (error) {
            console.log(error);
        }
    });

    srv.before("CREATE", Employees, async (req) => {
        let db = await cds.connect.to('db');
        let tx = db.tx(req);
        try {
            let sQuery = `SELECT MAX(EMP_ID) AS COUNT FROM ${Employees}`;
            let employeeTable = await tx.run(sQuery);
            employeeTable[0].COUNT = employeeTable[0].COUNT + 1;
            req.data.MODULE_ID = employeeTable[0].COUNT;
        } catch (error) {
            console.log(error);
        }
    });

});