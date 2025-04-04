namespace zProduct.db.schema;

using {managed} from '@sap/cds/common';

entity PRODUCTS {
    key ID    : Int32;
        NAME  : String;
        PRICE : String;
        QTY   : String;
        STOCK : String;
};


entity MODULES : managed {
    key MODULE_ID   : Int32;
        MODULE_NAME : String;
        MODULE_CODE : String;
        MODULE_TYPE : String;

};

entity EMPLOYEES {
    key EMP_ID            : Integer;
        EMP_NAME          : String(100);
        EMP_EMAIL         : String(100);
        EMP_MOBILE        : String;
        EMP_DOB           : Date;
        EMP_TYPE          : String(50);
        EMP_CODE          : String(50);
        EMP_SALARY        : String;
        EMP_ROLE          : String(100);
        STATUS            : String(50);
        DESIGNATION       : String(100);
        REPORTING_MANAGER : array of String;
        DATE_OF_JOINING   : String;
        EMP_DEGREES       : Association to many DEGREE
                                on EMP_DEGREES.EMP = $self;
        EMP_MODULE        : Association to one MODULES;
        EMP_PRJ           : Association to many PROJECTS
                                on EMP_PRJ.EMP = $self;

};

entity DEGREE {
    key DEGREE_ID        : Integer;
        INSTITUTION_NAME : String;
        CGPA             : String;
        GRADUATION_DATE  : String;
        EMP              : Association to one EMPLOYEES;

};

entity PROJECTS {
    key P_ID              : Integer;
        EMP               : Association to one EMPLOYEES;
        P_CODE            : String(50);
        P_NAME            : String(100);
        P_START_DATE      : String;
        P_END_DATE        : String;
        REPORTING_MANAGER : String(255);
        STATUS            : String(50);
}
