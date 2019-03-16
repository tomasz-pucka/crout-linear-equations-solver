unit crout_solve4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Spin, math;

type

  { TCSF4 }

  TCSF4 = class(TForm)
    A00E: TEdit;
    A01E: TEdit;
    A02E: TEdit;
    A03E: TEdit;
    A10E: TEdit;
    A11E: TEdit;
    A12E: TEdit;
    A13E: TEdit;
    A20E: TEdit;
    A30E: TEdit;
    A21E: TEdit;
    A31E: TEdit;
    A22E: TEdit;
    A32E: TEdit;
    A23E: TEdit;
    A33E: TEdit;
    Ax1L: TEdit;
    Ax2L: TEdit;
    Ax3L: TEdit;
    Ax4L: TEdit;
    B0E: TEdit;
    B1E: TEdit;
    B2E: TEdit;
    B3E: TEdit;
    BooDekkB: TButton;
    CalkRB: TRadioButton;
    CofnijB: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    HilbertB: TButton;
    IMaxBBL: TEdit;
    IMeanBBL: TEdit;
    IMinBBL: TEdit;
    ix1LL: TEdit;
    ix1LR: TEdit;
    ix1WL: TEdit;
    ix2LL: TEdit;
    ix2LR: TEdit;
    ix2WL: TEdit;
    ix3LL: TEdit;
    ix3LR: TEdit;
    ix3WL: TEdit;
    ix4LL: TEdit;
    ix4LR: TEdit;
    ix4WL: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LosujB: TButton;
    MaxBBL: TEdit;
    MeanBBL: TEdit;
    MinBBL: TEdit;
    MRB: TButton;
    MRSE: TSpinEdit;
    ObliczB: TButton;
    RadioGroup1: TRadioGroup;
    RandomBegE: TEdit;
    RandomEndE: TEdit;
    RzeczRB: TRadioButton;
    WarningL: TLabel;
    x1L: TEdit;
    x2L: TEdit;
    x3L: TEdit;
    x4L: TEdit;
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
  CSF4: TCSF4;

implementation

{$R *.lfm}
uses
  crout01, functions, interval_functions;

procedure TCSF4.CofnijBClick(Sender: TObject);
begin
  CSF4.Close;
end;

procedure TCSF4.BooDekkBClick(Sender: TObject);
begin
  booth_dekk_gen(xQuantity, A, B);
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A02E.Text:=FloatToStr(A[0,2]);
  A03E.Text:=FloatToStr(A[0,3]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  A12E.Text:=FloatToStr(A[1,2]);
  A13E.Text:=FloatToStr(A[1,3]);
  A20E.Text:=FloatToStr(A[2,0]);
  A21E.Text:=FloatToStr(A[2,1]);
  A22E.Text:=FloatToStr(A[2,2]);
  A23E.Text:=FloatToStr(A[2,3]);
  A30E.Text:=FloatToStr(A[3,0]);
  A31E.Text:=FloatToStr(A[3,1]);
  A32E.Text:=FloatToStr(A[3,2]);
  A33E.Text:=FloatToStr(A[3,3]);
  B0E.Text:=FloatToStr(B[0]);
  B1E.Text:=FloatToStr(B[1]);
  B2E.Text:=FloatToStr(B[2]);
  B3E.Text:=FloatToStr(B[3]);
end;

procedure TCSF4.HilbertBClick(Sender: TObject);
begin
  hilbert_gen(xQuantity, A, B);
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A02E.Text:=FloatToStr(A[0,2]);
  A03E.Text:=FloatToStr(A[0,3]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  A12E.Text:=FloatToStr(A[1,2]);
  A13E.Text:=FloatToStr(A[1,3]);
  A20E.Text:=FloatToStr(A[2,0]);
  A21E.Text:=FloatToStr(A[2,1]);
  A22E.Text:=FloatToStr(A[2,2]);
  A23E.Text:=FloatToStr(A[2,3]);
  A30E.Text:=FloatToStr(A[3,0]);
  A31E.Text:=FloatToStr(A[3,1]);
  A32E.Text:=FloatToStr(A[3,2]);
  A33E.Text:=FloatToStr(A[3,3]);
  B0E.Text:=FloatToStr(B[0]);
  B1E.Text:=FloatToStr(B[1]);
  B2E.Text:=FloatToStr(B[2]);
  B3E.Text:=FloatToStr(B[3]);
end;

procedure TCSF4.LosujBClick(Sender: TObject);
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
  A02E.Text:=FloatToStr(A[0,2]);
  A03E.Text:=FloatToStr(A[0,3]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  A12E.Text:=FloatToStr(A[1,2]);
  A13E.Text:=FloatToStr(A[1,3]);
  A20E.Text:=FloatToStr(A[2,0]);
  A21E.Text:=FloatToStr(A[2,1]);
  A22E.Text:=FloatToStr(A[2,2]);
  A23E.Text:=FloatToStr(A[2,3]);
  A30E.Text:=FloatToStr(A[3,0]);
  A31E.Text:=FloatToStr(A[3,1]);
  A32E.Text:=FloatToStr(A[3,2]);
  A33E.Text:=FloatToStr(A[3,3]);
  B0E.Text:=FloatToStr(B[0]);
  B1E.Text:=FloatToStr(B[1]);
  B2E.Text:=FloatToStr(B[2]);
  B3E.Text:=FloatToStr(B[3]);
end;

procedure TCSF4.MRBClick(Sender: TObject);
begin
  sparse_matrix_gen(xQuantity, MRSE.Value, A);
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A02E.Text:=FloatToStr(A[0,2]);
  A03E.Text:=FloatToStr(A[0,3]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  A12E.Text:=FloatToStr(A[1,2]);
  A13E.Text:=FloatToStr(A[1,3]);
  A20E.Text:=FloatToStr(A[2,0]);
  A21E.Text:=FloatToStr(A[2,1]);
  A22E.Text:=FloatToStr(A[2,2]);
  A23E.Text:=FloatToStr(A[2,3]);
  A30E.Text:=FloatToStr(A[3,0]);
  A31E.Text:=FloatToStr(A[3,1]);
  A32E.Text:=FloatToStr(A[3,2]);
  A33E.Text:=FloatToStr(A[3,3]);
end;

procedure TCSF4.ObliczBClick(Sender: TObject);
begin
  A[0,0]:=StrToFloat(A00E.Text);
  A[0,1]:=StrToFloat(A01E.Text);
  A[0,2]:=StrToFloat(A02E.Text);
  A[0,3]:=StrToFloat(A03E.Text);
  A[1,0]:=StrToFloat(A10E.Text);
  A[1,1]:=StrToFloat(A11E.Text);
  A[1,2]:=StrToFloat(A12E.Text);
  A[1,3]:=StrToFloat(A13E.Text);
  A[2,0]:=StrToFloat(A20E.Text);
  A[2,1]:=StrToFloat(A21E.Text);
  A[2,2]:=StrToFloat(A22E.Text);
  A[2,3]:=StrToFloat(A23E.Text);
  A[3,0]:=StrToFloat(A30E.Text);
  A[3,1]:=StrToFloat(A31E.Text);
  A[3,2]:=StrToFloat(A32E.Text);
  A[3,3]:=StrToFloat(A33E.Text);
  B[0]:=StrToFloat(B0E.Text);
  B[1]:=StrToFloat(B1E.Text);
  B[2]:=StrToFloat(B2E.Text);
  B[3]:=StrToFloat(B3E.Text);
  if crout_method_interval(xQuantity, A, B, XStr, XWidth, XInt) and crout_method(xQuantity, A, B, X) then
  begin
       x1L.Text:=FloatToStr(X[0]);
       x2L.Text:=FloatToStr(X[1]);
       x3L.Text:=FloatToStr(X[2]);
       x4L.Text:=FloatToStr(X[3]);
       ix1LL.Text:=XStr[0][0];
       ix1LR.Text:=XStr[0][1];
       ix2LL.Text:=XStr[1][0];
       ix2LR.Text:=XStr[1][1];
       ix3LL.Text:=XStr[2][0];
       ix3LR.Text:=XStr[2][1];
       ix4LL.Text:=XStr[3][0];
       ix4LR.Text:=XStr[3][1];
       ix1WL.Text:=FloatToStr(XWidth[0]);
       ix2WL.Text:=FloatToStr(XWidth[1]);
       ix3WL.Text:=FloatToStr(XWidth[2]);
       ix4WL.Text:=FloatToStr(XWidth[3]);
       WarningL.Caption:='';
       matrix_multiplication(xQuantity, A, X, BCalc);
       Ax1L.Text:=FloatToStr(BCalc[0]);
       Ax2L.Text:=FloatToStr(BCalc[1]);
       Ax3L.Text:=FloatToStr(BCalc[2]);
       Ax4L.Text:=FloatToStr(BCalc[3]);
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
      x3L.Caption:='';
      x4L.Caption:='';
      ix1LL.Text:='';
      ix1LR.Text:='';
      ix2LL.Text:='';
      ix2LR.Text:='';
      ix3LL.Text:='';
      ix3LR.Text:='';
      ix4LL.Text:='';
      ix4LR.Text:='';
      ix1WL.Text:='';
      ix2WL.Text:='';
      ix3WL.Text:='';
      ix4WL.Text:='';
      Ax1L.Caption:='';
      Ax2L.Caption:='';
      Ax3L.Caption:='';
      Ax4L.Caption:='';
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

