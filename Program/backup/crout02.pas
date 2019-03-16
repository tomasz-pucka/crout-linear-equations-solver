unit crout02;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

uses
  crout01;

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button3Click(Sender: TObject);
begin
  Form2.Close;
end;

end.

