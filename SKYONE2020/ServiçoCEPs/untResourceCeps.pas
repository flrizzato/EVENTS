unit untResourceCeps;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes;

type
  [ResourceName('cep')]
  TCepResource1 = class(TDataModule)
  published

    [EndPointRequestSummary('Tests', 'GetItem', 'Retrieves item with specified ID', 'application/json', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses untDmCep;

{$R *.dfm}

procedure TCepResource1.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
  LDM: TdmCep;
  LLogradouro, LBairro, LCidade, LEstado: String;
  LJSONObj: TJSONObject;
begin
  LItem := ARequest.Params.Values['item'];

  if LItem.Trim.Length < 5 then
    AResponse.RaiseBadRequest('Invalid param length');

  LDM := TdmCep.Create(nil);
  try
    if LDM.PesquisarCEP(LItem, LLogradouro, LBairro, LCidade, LEstado) then
    begin
      LJSONObj := TJSONObject.Create;
      LJSONObj.AddPair('logradouro', LLogradouro);
      LJSONObj.AddPair('bairro', LBairro);
      LJSONObj.AddPair('cidade', LCidade);
      LJSONObj.AddPair('estado', LEstado);

      AResponse.Body.SetValue(LJSONObj, True);
    end
    else
      AResponse.RaiseNotFound(LItem + ' not found');
  finally
    LDM.Free;
  end;
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TCepResource1));
end;

initialization
  Register;
end.


