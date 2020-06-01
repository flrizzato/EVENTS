object RsemployeeResource1: TRsemployeeResource1
  OldCreateOrder = False
  Height = 300
  Width = 600
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\20.0\Sampl' +
        'es\data\employee.gdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Port=3050'
      'DriverID=IB')
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 38
    Top = 16
  end
  object qryEMPLOYEE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from EMPLOYEE')
    Left = 130
    Top = 16
  end
  object dsrEMPLOYEE: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryEMPLOYEE
    KeyFields = 'EMP_NO'
    ValueFields = 
      'DEPT_NO;EMP_NO;FIRST_NAME;FULL_NAME;HIRE_DATE;JOB_CODE;JOB_COUNT' +
      'RY;JOB_GRADE;LAST_NAME;PHONE_EXT;SALARY'
    Left = 130
    Top = 72
  end
  object qryCUSTOMER: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from CUSTOMER')
    Left = 226
    Top = 16
  end
  object dsrCUSTOMER: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryCUSTOMER
    KeyFields = 'CUST_NO'
    ValueFields = 
      'ADDRESS_LINE1;ADDRESS_LINE2;CITY;CONTACT_FIRST;CONTACT_LAST;COUN' +
      'TRY;CUST_NO;CUSTOMER;ON_HOLD;PHONE_NO;POSTAL_CODE;STATE_PROVINCE'
    Left = 226
    Top = 72
  end
end
