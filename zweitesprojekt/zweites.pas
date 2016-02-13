unit zweites;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  LazHelpHTML, StdCtrls, Buttons, HelpIntfs;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    HelpButton: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    HTMLBrowserHelpViewer1: THTMLBrowserHelpViewer;
    HTMLHelpDatabase1: THTMLHelpDatabase;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{ TForm1 }

procedure TForm1.HelpButtonClick(Sender: TObject);
begin
  // This demonstrates how to show a help item manually:
  ShowHelpOrErrorForKeyword('','HTML/index.html');
end;

procedure TForm1.FormCreate(Sender: TObject);
const
  {$IFDEF Darwin}
  HelpShortcut = #$e2#$8c#$98'?';
  {$ELSE}
  HelpShortcut = 'F1';
  {$ENDIF}
begin
  HTMLHelpDatabase1.BaseURL:='file://html';
  Edit1.Text:='Edit1 - Press '+HelpShortcut+' for help';
  Edit2.Text:='Edit2 - Press '+HelpShortcut+' for help';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
filename: string;
begin
if OpenDialog1.Execute then
begin
  filename := OpenDialog1.Filename;
  ShowMessage(filename);
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    if SaveDialog1.Execute then
    Memo1.Lines.SaveToFile( SaveDialog1.Filename );
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add ('das wird ins file geschrieben:');
end;

{$R *.lfm}

end.

