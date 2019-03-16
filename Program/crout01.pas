unit crout01;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Spin, crout_solve2, crout_solve3, crout_solve4, crout_solvex, intervalarithmetic;

type
  OneDimArray = array of extended;
  TwoDimArray = array of OneDimArray;
  IntOneDimArray = array of interval;
  IntTwoDimArray = array of IntOneDimArray;
  StrOneDimArray = array of string;
  StrTwoDimArray = array of StrOneDimArray;
  { TMainForm }

  TMainForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    xQuantitySE: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;
  xQuantity: integer;
  A: TwoDimArray;
  B: OneDimArray;
  X: OneDimArray;
  XStr: StrTwoDimArray;
  XInt: IntOneDimArray;
  XIntMean: OneDimArray;
  XWidth: OneDimArray;
  BCalc: OneDimArray;
  BDif: OneDimArray;
  IBCalc: OneDimArray;
  IBDif: OneDimArray;
  MinBB, MaxBB, MeanBB : extended;
implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.Button1Click(Sender: TObject);
begin
  xQuantity:=StrToInt(xQuantitySE.Text);
  setlength(B, xQuantity);
  setlength(BCalc, xQuantity);
  setlength(BDif, xQuantity); 
  setlength(IBCalc, xQuantity);
  setlength(IBDif, xQuantity);
  setlength(A, xQuantity, xQuantity);
  setlength(X, xQuantity);
  setlength(XInt, xQuantity);
  setlength(XIntMean, xQuantity);
  setlength(XStr, xQuantity, 2);
  setlength(XWidth, xQuantity);
  MinBB:=0;
  MaxBB:=0;
  MeanBB:=0;
  case xQuantity of
       2: begin
           CSF2.Left:=MainForm.Left;
           CSF2.Top:=MainForm.Top;
           CSF2.ShowModal;
       end;
       3: begin  
           CSF3.Left:=MainForm.Left;
           CSF3.Top:=MainForm.Top;
           CSF3.ShowModal;
       end;
       4: begin
           CSF4.Left:=MainForm.Left;
           CSF4.Top:=MainForm.Top;
           CSF4.ShowModal;
       end;
       else
         begin
           CSFX.Left:=MainForm.Left;
           CSFX.Top:=MainForm.Top;
           CSFX.ShowModal;
       end;
  end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  xQuantitySE.Clear;
  xQuantitySE.SetFocus;
end;


end.

