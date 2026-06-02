unit WebModuleUnit1;

interface

uses
  System.SysUtils,
  System.Classes,
  Web.HTTPApp,
  Web.Stencils,
  System.Generics.Collections, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type

  TCustomer = class
  private
    FName: string;
    FLastName: string;
  public
    property Name: string read FName write FName;
    property LastName: string read FLastName write FLastName;
  end;

  TProduct = class
  private
    FName: string;
  public
    property Name: string read FName write FName;
  end;

  TOrderItem = class
    FProduct: TProduct;
    FQuantity: double;
    FUnitPrice: currency;
  public
    constructor Create;
    destructor Destroy;
    property Product: TProduct read FProduct;
    property Quantity: double read FQuantity write FQuantity;
    property UnitPrice: currency read FUnitPrice write FUnitPrice;
  end;

  TOrder = class
    FNumber: integer;
    FCustomer: TCustomer;
    FOrderItems: TList<TOrderItem>;
  private
    function CalculateOrderTotal: currency;
  public
    constructor Create;
    destructor Destroy;
    property Number: integer read FNumber write FNumber;
    property Customer: TCustomer read FCustomer;
    property OrderItems: TList<TOrderItem> read FOrderItems;
    property Total: currency read CalculateOrderTotal;
  end;

  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    const
      HTMLTemplate = '''
      <html>
      <head>
        <title>WebStencils</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@@picocss/pico@@2/css/pico.min.css">
      </head>
      <body>
        <main class="container">
          <h1>Nested Properties</h1>
          <article>
          <header>
            <strong>Order: @Order.Number</strong>
            <div>Customer: @Order.Customer.LastName, @Order.Customer.Name</div>
          </header>
          @foreach(var Item in Order.OrderItems) {
            <li>product: @Item.Product.Name - units: @Item.Quantity - price: @Item.UnitPrice</li>
          }
          <footer>Order Total: @Order.Total</footer>
          </article>
        </main>
      </body>
      </html>
      ''';
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  var WSProcessor := TWebStencilsProcessor.Create(self);
  var LOrderItem1 := TOrderItem.Create;
  var LOrderItem2 := TOrderItem.Create;
  var LOrderItem3 := TOrderItem.Create;
  var LOrder := TOrder.Create;
  try
    Lorder.Number := 5435;
    LOrder.Customer.Name := 'Antonio';
    LOrder.Customer.LastName := 'Zapater';
    LOrderItem1.Product.Name := 'Chocolate cake';
    LOrderItem1.Quantity := 2;
    LOrderItem1.UnitPrice := 23.54;
    LOrderItem2.Product.Name := 'Nugat bar';
    LOrderItem2.Quantity := 2;
    LOrderItem2.UnitPrice := 3.11;
    LOrderItem3.Product.Name := 'Custard tart';
    LOrderItem3.Quantity := 2;
    LOrderItem3.UnitPrice := 9.23;
    LOrder.OrderItems.AddRange([LOrderItem1, LOrderItem2, LOrderItem3]);
    WSProcessor.AddVar('Order', LOrder, False);
    Response.Content := WSProcessor.ContentFromString(HTMLTemplate);
    Handled := True;
  finally
    LOrder.Free;
    LOrderItem1.Free;
    LOrderItem2.Free;
    LOrderItem3.Free;
    WSProcessor.Free;
  end;
end;


{ TOrder }

function TOrder.CalculateOrderTotal: currency;
begin
  Result := 0;
  for var item in OrderItems do
  begin
    Result := Result + item.Quantity * item.UnitPrice;
  end;
end;

constructor TOrder.Create;
begin
  inherited;
  FCustomer := TCustomer.Create;
  FOrderItems := TList<TOrderItem>.Create;
end;

destructor TOrder.Destroy;
begin
  FOrderItems.Free;
  FCustomer.Free;
  inherited;
end;

{ TOrderItem }

constructor TOrderItem.Create;
begin
  FProduct := TProduct.Create;
end;

destructor TOrderItem.Destroy;
begin
  FProduct.Free;
end;

end.
