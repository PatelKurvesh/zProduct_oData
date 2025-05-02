const cds = require("@sap/cds");

module.exports = (srv => {
    let {Modules, Employees, Degree, Project} = srv.entities;

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
            req.data.EMP_ID = employeeTable[0].COUNT;
            req.data.EMP_IMG_URL = `/v2/odata/Employees(${req.data.EMP_ID})/EMP_IMG`;
            req.data.EMP_SIGN_URL = `/v2/odata/Employees(${req.data.EMP_ID})/EMP_SIGN`;
        } catch (error) {
            console.log(error);
        }
    });

    srv.before("CREATE", Project, async (req) => {
        let db = await cds.connect.to('db');
        let tx = db.tx(req);
        try {
            let sQuery = `SELECT MAX(P_ID) AS COUNT FROM ${Project}`;
            let employeeTable = await tx.run(sQuery);
            employeeTable[0].COUNT = employeeTable[0].COUNT + 1;
            req.data.P_ID = employeeTable[0].COUNT;
        } catch (error) {
            console.log(error);
        }
    });

    srv.before("CREATE", Degree, async (req) => {
        let db = await cds.connect.to('db');
        let tx = db.tx(req);
        try {
            let sQuery = `SELECT MAX(DEGREE_ID) AS COUNT FROM ${Degree}`;
            let employeeTable = await tx.run(sQuery);
            employeeTable[0].COUNT = employeeTable[0].COUNT + 1;
            req.data.DEGREE_ID = employeeTable[0].COUNT;
        } catch (error) {
            console.log(error);
        }
    });

});