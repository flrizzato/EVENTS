unit uJSONUtil;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Comp.Client;

function MemTableCreateDelta(const AFDMemTable: TFDMemTable): TFDMemTable;

implementation


function MemTableCreateDelta(const AFDMemTable: TFDMemTable): TFDMemTable;

  procedure CopyDataSet(const ASource, ADest: TFDAdaptedDataSet);
  var
    LStream: TStream;
  begin
    LStream := TMemoryStream.Create;
    try
      ASource.SaveToStream(LStream, TFDStorageFormat.sfBinary);
      LStream.Seek(0, TSeekOrigin.soBeginning);
      ADest.LoadFromStream(LStream, TFDStorageFormat.sfBinary);
    finally
      LStream.Free;
    end;
  end;

var
  LStoreItems: TFDStoreItems;
begin
  Result := TFDMemTable.Create(nil);
  Result.ResourceOptions.StoreItems := [siMeta, siDelta];
  LStoreItems := AFDMemTable.ResourceOptions.StoreItems;
  AFDMemTable.DisableControls;
  try
    AFDMemTable.ResourceOptions.StoreItems := [siMeta, siDelta];
    CopyDataSet(AFDMemTable, Result);
  finally
    AFDMemTable.ResourceOptions.StoreItems := LStoreItems;
    AFDMemTable.EnableControls;
  end;
end;

end.
