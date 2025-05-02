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
        EMP_DOB           : String;
        EMP_TYPE          : String(50);
        EMP_ROLE          : String(100);
        STATUS            : String(50);
        DESIGNATION       : String(100);
        MANAGER : array of String;
        DATE_OF_JOINING   : String;
        EMP_IMG_FILE_NAME : String;
        EMP_IMG           : LargeBinary @Core.MediaType: 'image/png';
        EMP_IMG_URL       : String;
        EMP_IMG_STR       : LargeString;

       

        EMP_DEGREES       : Association to many DEGREE
                                on EMP_DEGREES.EMP = $self;
        EMP_MODULE        : Association to one MODULES;
        EMP_PRJ           : Association to many PROJECTS
                                on EMP_PRJ.EMP = $self;
        EMP_TASK    : Association to many TASKS
                                on EMP_TASK.EMP = $self;
        EMP_TIME : Association to many TIMESHEETS
                                on EMP_TIME.EMP = $self;

};

entity DEGREE {
    key DEGREE_ID        : Integer;
        INSTITUTION_NAME : String;
        CGPA             : String;
        DEGREE_NAME      : String;
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
        P_TASK            : Association to many TASKS
                                on P_TASK.TASK = $self;
        P_EMP           :   array of String;
}

entity TASKS {
    key T_ID   : UUID;
        T_NAME : String;
        TASK   : Association to one PROJECTS;
        T_START_DATE : String;
        T_END_DATE  :   String;
        EMP : Association to one EMPLOYEES;
        STATUS:String;
        PROGRESS : String;
        PRIORITY : String;


}

entity TIMESHEETS  {
  key ENTRY_ID     : UUID;
      ENTRY_DATE   : String;                         
      HOURS_WORKED : Decimal(4,2);  // Allows values like 2.50, 6.75, etc.                      
          
      PROJECT      : Association to PROJECTS;      
      TASK         : Association to TASKS;         
      REMARKS      : String(255); 
      EMP :     Association to EMPLOYEES;             
}


