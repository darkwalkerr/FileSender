unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent, IdStack,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Winapi.ShellAPI;
type
  TForm1 = class(TForm)
    ButtonGetFile: TButton;
    IdTCPClient1: TIdTCPClient;
    EditServerAdress: TEdit;
    LabelAdress: TLabel;
    EditServerPort: TEdit;
    Label1: TLabel;
    MemoLog: TMemo;
    FileOpenDialog1: TFileOpenDialog;
    LabeSaveFolder: TLabel;
    EditSaveFolder: TEdit;
    ButtonChangeSaveFolder: TButton;
    procedure ButtonGetFileClick(Sender: TObject);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure IdTCPClient1Disconnected(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonChangeSaveFolderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;

implementation
{$R *.dfm}

procedure TForm1.ButtonChangeSaveFolderClick(Sender: TObject);
begin
with TFileOpenDialog.Create(nil) do
  try
    Options := [fdoPickFolders];
    if Execute then
      EditSaveFolder.Text := Filename;
  finally
    Free;
  end;
end;

procedure TForm1.ButtonGetFileClick(Sender: TObject);
var
  LMemoryStream: TMemoryStream;
  LFileName: string;
  FileSize: Int64;
  FileNameLength: Integer;
  Index: Integer;
begin
  try
    // �����������, ���� ��� ����������
    if IdTCPClient1.Connected then
    begin
      IdTCPClient1.Disconnect; // ���� ��� ����������, �����������
      IdTCPClient1.IOHandler.InputBuffer.Clear; // ������� ����� �����
    end;
    // ����������� IP ����� ������� �� ���������� ����
    IdTCPClient1.Host := EditServerAdress.Text;
    // ����������� ���� ������� �� ���������� ����
    IdTCPClient1.Port := StrToInt(EditServerPort.Text);
    // ����������� � �������
    try
      IdTCPClient1.Connect;
    except
      on E: Exception do
      begin
        ShowMessage('Error: ' + E.Message);
        Exit;
      end;
    end;

    // ���������, ��������� �� ������
    if IdTCPClient1.Connected then
    begin
      try
        // ������ ����� ����� �����
        FileNameLength := IdTCPClient1.IOHandler.ReadLongInt;
        // ������ ��� �����
        LFileName := IdTCPClient1.IOHandler.ReadString(FileNameLength);
        //���� �� ������� ���������� �������� � ��������� ����� ������� '?', �� �������� �� �� '_'
        LFileName :=  StringReplace(LFileName, '?', '_', [rfReplaceAll]);
        // ������� ���� �� ����� �����
        Index := LastDelimiter('\', LFileName);
        LFileName := Copy(LFileName, Index + 1, Length(LFileName) - Index);
        // ������ ������ �����
        FileSize := IdTCPClient1.IOHandler.ReadInt64;
        // ���������, ��� ���� �����, � ������� ����� ��������� ���������� ����
        if not DirectoryExists(EditSaveFolder.Text) then
          CreateDir(EditSaveFolder.Text);
        // ������� ����� ��� �������� ����������� �����
        LMemoryStream := TMemoryStream.Create;
        try
          // ���������� ���������, ����� ���� �������
          IdTCPClient1.IOHandler.LargeStream := True;
          // ��������� ���������� � �����
          IdTCPClient1.IOHandler.ReadStream(LMemoryStream, FileSize, False);
          //������ �� ������ ������
          LMemoryStream.Position := 0;
          //��������� ����� � ���� � ���������� ������
          LMemoryStream.SaveToFile(EditSaveFolder.Text + LFileName);
          //����� � ����
          MemoLog.Lines.Add('File downloaded successfully: '+ DateTimeToStr(Now));
        finally
          // ������� ����� � ���������
          LMemoryStream.Free;
        end;
      finally
        // �����������
        IdTCPClient1.Disconnect;
      end;
      // ��������� ���� � ����������� ����������
      ShellExecute(0, 'OPEN', PChar(EditSaveFolder.Text + LFileName), '', '', SW_SHOWNORMAL);
    end;
  except
    on E: EIdSocketError do
    begin
      if E.LastError <> 10038 then
        raise; // ������������ ������ ������, ����� ���������� ����������
    end;
    on E: EIdNotASocket do
    begin
      ShowMessage('Error: ' + E.Message);
      Exit;
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //����������� IdTCPClient1
  FreeAndNil(IdTCPClient1);
end;

procedure TForm1.IdTCPClient1Connected(Sender: TObject);
begin
  //����� � ����
  MemoLog.Lines.Add('Client Connected: '+ DateTimeToStr(Now));
end;

procedure TForm1.IdTCPClient1Disconnected(Sender: TObject);
begin
  //����� � ����
  MemoLog.Lines.Add('Client Disconnected: '+ DateTimeToStr(Now));
end;

end.
