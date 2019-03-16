unit crout_solve2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Spin, math;

type

  { TCSF2 }

  TCSF2 = class(TForm)
    Ax1L: TEdit;
    Ax2L: TEdit;
    IMaxBBL: TEdit;
    IMeanBBL: TEdit;
    IMinBBL: TEdit;
    ix1LL: TEdit;
    ix1LR: TEdit;
    ix1WL: TEdit;
    ix2LL: TEdit;
    ix2LR: TEdit;
    ix2WL: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    MaxBBL: TEdit;
    MeanBBL: TEdit;
    MinBBL: TEdit;
    MRB: TButton;
    GroupBox2: TGroupBox;
    HilbertB: TButton;
    BooDekkB: TButton;
    CofnijB: TButton;
    CalkRB: TRadioButton;
    Label14: TLabel;
    Label6: TLabel;
    RzeczRB: TRadioButton;
    RadioGroup1: TRadioGroup;
    MRSE: TSpinEdit;
    WarningL: TLabel;
    ObliczB: TButton;
    LosujB: TButton;
    A00E: TEdit;
    A01E: TEdit;
    A10E: TEdit;
    A11E: TEdit;
    RandomBegE: TEdit;
    RandomEndE: TEdit;
    B0E: TEdit;
    B1E: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    x1L: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    x2L: TEdit;
    procedure BooDekkBClick(Sender: TObject);
    procedure CofnijBClick(Sender: TObject);
    procedure HilbertBClick(Sender: TObject);
    procedure LosujBClick(Sender: TObject);
    procedure MRBClick(Sender: TObject);
    procedure ObliczBClick(Sender: TObject);
  private

  public

  end;

var
  CSF2: TCSF2;

implementation
{$R *.lfm}
{ TCSF2 }
uses
  crout01, functions, interval_functions;

procedure TCSF2.CofnijBClick(Sender: TObject);
begin
  CSF2.Close;
end;

procedure TCSF2.BooDekkBClick(Sender: TObject);
begin
  booth_dekk_gen(xQuantity, A, B);
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  B0E.Text:=FloatToStr(B[0]);
  B1E.Text:=FloatToStr(B[1]);
end;

procedure TCSF2.HilbertBClick(Sender: TObject);
begin
  hilbert_gen(xQuantity, A, B);
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  B0E.Text:=FloatToStr(B[0]);
  B1E.Text:=FloatToStr(B[1]);
end;

procedure TCSF2.LosujBClick(Sender: TObject);
var
  RandomBeg, RandomEnd, i, j : integer;
begin
  Randomize;
  RandomBeg:=StrToInt(RandomBegE.Text);
  RandomEnd:=StrToInt(RandomEndE.Text);
  for i := 0 to xQuantity - 1 do
  begin
      if Max(RandomBeg, RandomEnd)=Min(RandomBeg, RandomEnd) then
      begin
           B[i]:=RandomBeg;
           for j := 0 to xQuantity - 1 do A[i,j]:=RandomBeg;
      end
      else
      begin
           if RzeczRB.Checked then B[i]:=(Random(Abs(Max(RandomBeg, RandomEnd)-Min(RandomBeg, RandomEnd)))+Min(RandomBeg, RandomEnd)+Random)*xQuantity
           else B[i]:=(Random(Abs(Max(RandomBeg, RandomEnd)-Min(RandomBeg, RandomEnd))+1)+Min(RandomBeg, RandomEnd))*xQuantity;
      for j := 0 to xQuantity - 1 do
          begin
               if RzeczRB.Checked then A[i,j]:=Random(Abs(Max(RandomBeg, RandomEnd)-Min(RandomBeg, RandomEnd)))+Min(RandomBeg, RandomEnd)+Random
               else A[i,j]:=Random(Abs(Max(RandomBeg, RandomEnd)-Min(RandomBeg, RandomEnd))+1)+Min(RandomBeg, RandomEnd);
          end;
      end;
  end;
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  B0E.Text:=FloatToStr(B[0]);
  B1E.Text:=FloatToStr(B[1]);
end;

procedure TCSF2.MRBClick(Sender: TObject);
begin
  sparse_matrix_gen(xQuantity, MRSE.Value, A);
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
end;

procedure TCSF2.ObliczBClick(Sender: TObject);
begin
  A[0,0]:=StrToFloat(A00E.Text);
  A[0,1]:=StrToFloat(A01E.Text);
  A[1,0]:=StrToFloat(A10E.Text);
  A[1,1]:=StrToFloat(A11E.Text);
  B[0]:=StrToFloat(B0E.Text);
  B[1]:=StrToFloat(B1E.Text);
  if crout_method_interval(xQuantity, A, B, XStr, XWidth, XInt) and crout_method(xQuantity, A, B, X) then
  begin
       x1L.Text:=FloatToStr(X[0]);
       x2L.Text:=FloatToStr(X[1]);
       ix1LL.Text:=XStr[0][0];
       ix1LR.Text:=XStr[0][1];
       ix2LL.Text:=XStr[1][0];
       ix2LR.Text:=XStr[1][1];
       ix1WL.Text:=FloatToStr(XWidth[0]);
       ix2WL.Text:=FloatToStr(XWidth[1]);
       WarningL.Caption:='';
       matrix_multiplication(xQuantity, A, X, BCalc);
       Ax1L.Text:=FloatToStr(BCalc[0]);
       Ax2L.Text:=FloatToStr(BCalc[1]);
       vector_difference(xQuantity, B, BCalc, BDif);
       IntOneDimArray2OneDimArray(xQuantity, XInt, XIntMean);
       matrix_multiplication(xQuantity, A, XIntMean, IBCalc);
       vector_difference(xQuantity, B, IBCalc, IBDif);
       MaxBBL.Text:=FloatToStr(maxvalue(BDif));
       MinBBL.Text:=FloatToStr(minvalue(BDif));
       MeanBBL.Text:=FloatToStr(mean(BDif));
       IMaxBBL.Text:=FloatToStr(maxvalue(IBDif));
       IMinBBL.Text:=FloatToStr(minvalue(IBDif));
       IMeanBBL.Text:=FloatToStr(mean(IBDif));
  end
  else
  begin
      x1L.Caption:='';
      x2L.Caption:='';
      ix1LL.Text:='';
      ix1LR.Text:='';
      ix2LL.Text:='';
      ix2LR.Text:='';
      ix1WL.Text:='';
      ix2WL.Text:='';
      Ax1L.Caption:='';
      Ax2L.Caption:='';
      MaxBBL.Text:='';
      MinBBL.Text:='';
      MeanBBL.Text:='';
      IMaxBBL.Text:='';
      IMinBBL.Text:='';
      IMeanBBL.Text:='';
      WarningL.Caption:='Blad. Macierz osobliwa lub metoda zawodzi.';
  end;
end;

end.

