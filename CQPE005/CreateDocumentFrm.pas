unit CreateDocumentFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxTextEdit, cxDBEdit, cxControls, cxContainer, cxEdit, cxLabel, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmCreateDocument = class(TForm)
    cxLabel4: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel8: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    Bevel1: TBevel;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    btnCancel: TcxButton;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreateDocument: TfrmCreateDocument;

implementation

{$R *.dfm}

procedure TfrmCreateDocument.btnCancelClick(Sender: TObject);
begin
 close;
end;

end.
