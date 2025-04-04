namespace zProduct.srv.service;

using { zProduct.db.schema as db } from '../db/schema';


service MyService @(path: '/odata') {

    entity Products as projection on db.PRODUCTS;
    entity Modules as projection on db.MODULES;
    entity Employees as projection on db.EMPLOYEES;
    entity Degree as projection on db.DEGREE;
    entity Project as projection on db.PROJECTS;

}

