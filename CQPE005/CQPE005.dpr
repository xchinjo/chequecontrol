library CQPE005;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  WideStrings,
  FMTBcd,
  StdCtrls,
  Provider,sockcon,
  DB,
  SqlExpr,
  ADODB,
  UIT_GLOBAL_LIB in '..\LIB\UIT_GLOBAL_LIB.PAS',
  BaseFrm in '..\BaseFrom\BaseFrm.pas' {frmBase},
  JvPanel,
  MainProgramFrm in 'MainProgramFrm.pas' {frmMainProgram},
  CreateDocumentFrm in 'CreateDocumentFrm.pas' {frmCreateDocument};

var
  DllApplication : TApplication = Nil;

{$R *.res}

function Execute(_MainApp: TApplication;_Type: TShowWindowType; _Parameter: String): TForm; stdcall;
//var _DBConn:TADOConnection;
begin

  //_DBConn:=TADOConnection.Create(Application);
  //_DBConn.Close;
  //_DBConn.ConnectionString:='Provider=SQLOLEDB.1;Password=123456;Persist Security Info=True;User ID=sa;Initial Catalog=LLSPDTA;Data Source=.';
  //_DBConn.Connected:=true;

  Result := TfrmMainProgram.Create(_MainApp); //TfrmAppInfo.Create(_MainApp);
  //if (_Type = swModal) then
  begin
    Result.FormStyle := fsNormal;
    Result.WindowState := wsNormal;
//    TfrmMainProgram(Result).ADODataSet.Connection := _DBConn;
    Result.ShowModal();
    FreeAndNil(Result);
  end;// else
  //begin
  //  Result.FormStyle := fsMDIChild;
  //  TfrmMainProgram(Result).ADODataSet.Connection := _DBConn;
  //  Result.Show();
  //end;
end;


procedure ResizeProgram(w,h : Integer);stdcall;
begin
  if Assigned(frmMainProgram) then
  begin
   frmMainProgram.Width := w;
   frmMainProgram.Height := h;
  end;
end;

function ShowProgram(_MainApp: TApplication;AParent:TWinControl; _Parameter: String;_DBConn:TADOConnection): TForm;export; stdcall;

begin
 if DllApplication=nil then
 begin
   DllApplication:=Application;
   Application:=_MainApp;
 end;




    frmMainProgram := TfrmMainProgram.CreateParented(AParent.Handle);


    frmMainProgram.ADODataSet.Connection := _DBConn;


    frmMainProgram.FormStyle := fsNormal;
    frmMainProgram.BorderStyle:=bsNone;

    Application.MainForm.OnKeyPress:= frmMainProgram.OnKeyPress;
    frmMainProgram.Width:=AParent.Width;
    frmMainProgram.Height:=AParent.Height;
    //Result.Align:=alClient;

    frmMainProgram.Show();

    Result:=frmMainProgram;

  

end;

function ShowProgramS(_MainApp: TApplication;AParent:TWinControl; _Parameter: TDLLParam;_DBConn:TSockCon): TForm;export; stdcall;
begin
 if DllApplication=nil then
 begin
   DllApplication:=Application;
   Application:=_MainApp;
 end;




    frmMainProgram := TfrmMainProgram.CreateParented(AParent.Handle);

    frmMainProgram.SockCon.Connected:=false;
    frmMainProgram.SockCon.Address:=_DBConn.Address;
    frmMainProgram.SockCon.Port:=_DBConn.Port;
    frmMainProgram.SockCon.Connected:=true;

    frmMainProgram.FormStyle := fsNormal;
    frmMainProgram.BorderStyle:=bsNone;
    frmMainProgram.KeyPreview:=true;

    Application.MainForm.OnKeyPress:= frmMainProgram.OnKeyPress;
    frmMainProgram.Width:=AParent.Width;
    frmMainProgram.Height:=AParent.Height;

    Application.MainForm.Caption:=Application.Title+' - [ '+frmMainProgram.Caption+' ]';

    frmMainProgram.ToolbarVisible:=_Parameter.BtnVisible;
    frmMainProgram.ToolbarEnable:=_Parameter.BtnEnable;
    frmMainProgram.Show();

    Result:=frmMainProgram;
end;


procedure DLLUnloadProc(Reason: Integer); register;
begin
  if Reason = DLL_PROCESS_DETACH then
    if Assigned(DllApplication) then Application := DllApplication;
end;

exports
    ShowProgram,ResizeProgram,ShowProgramS,Execute;

begin

  DLLProc := @DLLUnloadProc;
end.
