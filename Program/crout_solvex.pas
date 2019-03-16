unit crout_solvex;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Spin, math;

type

  { TCSFX }

  TCSFX = class(TForm)
    A00E: TEdit;
    A01E: TEdit;
    A02E: TEdit;
    A0XE: TEdit;
    A10E: TEdit;
    A11E: TEdit;
    A12E: TEdit;
    A1XE: TEdit;
    A20E: TEdit;
    A21E: TEdit;
    A22E: TEdit;
    A2XE: TEdit;
    AX0E: TEdit;
    AX1E: TEdit;
    Ax1L: TEdit;
    AX2E: TEdit;
    Ax2L: TEdit;
    Ax3L: TEdit;
    AxNL: TEdit;
    AXXE: TEdit;
    B0E: TEdit;
    B1E: TEdit;
    B2E: TEdit;
    BooDekkB: TButton;
    BXE: TEdit;
    CalkRB: TRadioButton;
    CofnijB: TButton;
    DotV2: TLabel;
    DotV3: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    HilbertB: TButton;
    ix1WL: TEdit;
    ix2WL: TEdit;
    ix3WL: TEdit;
    ixNWL: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label200: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DotV1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LosujB: TButton;
    MaxBBL: TEdit;
    IMaxBBL: TEdit;
    MeanBBL: TEdit;
    IMeanBBL: TEdit;
    MinBBL: TEdit;
    IMinBBL: TEdit;
    MRB: TButton;
    MRSE: TSpinEdit;
    ObliczB: TButton;
    RadioGroup1: TRadioGroup;
    RandomBegE: TEdit;
    RandomEndE: TEdit;
    RzeczRB: TRadioButton;
    WarningL: TLabel;
    x1L: TEdit;
    ix1LL: TEdit;
    ix1LR: TEdit;
    x2L: TEdit;
    ix2LL: TEdit;
    ix2LR: TEdit;
    x3L: TEdit;
    ix3LL: TEdit;
    ix3LR: TEdit;
    xNL: TEdit;
    ixNLL: TEdit;
    ixNLR: TEdit;
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
  CSFX: TCSFX;

implementation

{$R *.lfm}
uses
  crout01, functions, interval_functions;

procedure TCSFX.CofnijBClick(Sender: TObject);
begin
  CSFX.Close;
end;

procedure TCSFX.BooDekkBClick(Sender: TObject);
begin
  booth_dekk_gen(xQuantity, A, B);
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A02E.Text:=FloatToStr(A[0,2]);
  A0XE.Text:=FloatToStr(A[0,xQuantity-1]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  A12E.Text:=FloatToStr(A[1,2]);
  A1XE.Text:=FloatToStr(A[1,xQuantity-1]);
  A20E.Text:=FloatToStr(A[2,0]);
  A21E.Text:=FloatToStr(A[2,1]);
  A22E.Text:=FloatToStr(A[2,2]);
  A2XE.Text:=FloatToStr(A[2,xQuantity-1]);
  AX0E.Text:=FloatToStr(A[xQuantity-1,0]);
  AX1E.Text:=FloatToStr(A[xQuantity-1,1]);
  AX2E.Text:=FloatToStr(A[xQuantity-1,2]);
  AXXE.Text:=FloatToStr(A[xQuantity-1,xQuantity-1]);
  B0E.Text:=FloatToStr(B[0]);
  B1E.Text:=FloatToStr(B[1]);
  B2E.Text:=FloatToStr(B[2]);
  BXE.Text:=FloatToStr(B[xQuantity-1]);
end;

procedure TCSFX.HilbertBClick(Sender: TObject);
begin
  hilbert_gen(xQuantity, A, B);
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A02E.Text:=FloatToStr(A[0,2]);
  A0XE.Text:=FloatToStr(A[0,xQuantity-1]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  A12E.Text:=FloatToStr(A[1,2]);
  A1XE.Text:=FloatToStr(A[1,xQuantity-1]);
  A20E.Text:=FloatToStr(A[2,0]);
  A21E.Text:=FloatToStr(A[2,1]);
  A22E.Text:=FloatToStr(A[2,2]);
  A2XE.Text:=FloatToStr(A[2,xQuantity-1]);
  AX0E.Text:=FloatToStr(A[xQuantity-1,0]);
  AX1E.Text:=FloatToStr(A[xQuantity-1,1]);
  AX2E.Text:=FloatToStr(A[xQuantity-1,2]);
  AXXE.Text:=FloatToStr(A[xQuantity-1,xQuantity-1]);
  B0E.Text:=FloatToStr(B[0]);
  B1E.Text:=FloatToStr(B[1]);
  B2E.Text:=FloatToStr(B[2]);
  BXE.Text:=FloatToStr(B[xQuantity-1]);
end;

procedure TCSFX.LosujBClick(Sender: TObject);
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
  A0XE.Text:=FloatToStr(A[0,xQuantity-1]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  A12E.Text:=FloatToStr(A[1,2]);
  A1XE.Text:=FloatToStr(A[1,xQuantity-1]);
  A20E.Text:=FloatToStr(A[2,0]);
  A21E.Text:=FloatToStr(A[2,1]);
  A22E.Text:=FloatToStr(A[2,2]);
  A2XE.Text:=FloatToStr(A[2,xQuantity-1]);
  AX0E.Text:=FloatToStr(A[xQuantity-1,0]);
  AX1E.Text:=FloatToStr(A[xQuantity-1,1]);
  AX2E.Text:=FloatToStr(A[xQuantity-1,2]);
  AXXE.Text:=FloatToStr(A[xQuantity-1,xQuantity-1]);
  B0E.Text:=FloatToStr(B[0]);
  B1E.Text:=FloatToStr(B[1]);
  B2E.Text:=FloatToStr(B[2]);
  BXE.Text:=FloatToStr(B[xQuantity-1]);
end;

procedure TCSFX.MRBClick(Sender: TObject);
begin
  sparse_matrix_gen(xQuantity, MRSE.Value, A);
  A00E.Text:=FloatToStr(A[0,0]);
  A01E.Text:=FloatToStr(A[0,1]);
  A02E.Text:=FloatToStr(A[0,2]);
  A0XE.Text:=FloatToStr(A[0,xQuantity-1]);
  A10E.Text:=FloatToStr(A[1,0]);
  A11E.Text:=FloatToStr(A[1,1]);
  A12E.Text:=FloatToStr(A[1,2]);
  A1XE.Text:=FloatToStr(A[1,xQuantity-1]);
  A20E.Text:=FloatToStr(A[2,0]);
  A21E.Text:=FloatToStr(A[2,1]);
  A22E.Text:=FloatToStr(A[2,2]);
  A2XE.Text:=FloatToStr(A[2,xQuantity-1]);
  AX0E.Text:=FloatToStr(A[xQuantity-1,0]);
  AX1E.Text:=FloatToStr(A[xQuantity-1,1]);
  AX2E.Text:=FloatToStr(A[xQuantity-1,2]);
  AXXE.Text:=FloatToStr(A[xQuantity-1,xQuantity-1]);
end;

procedure TCSFX.ObliczBClick(Sender: TObject);
begin
  A[0,0]:=StrToFloat(A00E.Text);
  A[0,1]:=StrToFloat(A01E.Text);
  A[0,2]:=StrToFloat(A02E.Text);
  A[0,xQuantity-1]:=StrToFloat(A0XE.Text);
  A[1,0]:=StrToFloat(A10E.Text);
  A[1,1]:=StrToFloat(A11E.Text);
  A[1,2]:=StrToFloat(A12E.Text);
  A[1,xQuantity-1]:=StrToFloat(A1XE.Text);
  A[2,0]:=StrToFloat(A20E.Text);
  A[2,1]:=StrToFloat(A21E.Text);
  A[2,2]:=StrToFloat(A22E.Text);
  A[2,xQuantity-1]:=StrToFloat(A2XE.Text);
  A[xQuantity-1,0]:=StrToFloat(AX0E.Text);
  A[xQuantity-1,1]:=StrToFloat(AX1E.Text);
  A[xQuantity-1,2]:=StrToFloat(AX2E.Text);
  A[xQuantity-1,xQuantity-1]:=StrToFloat(AXXE.Text);
  B[0]:=StrToFloat(B0E.Text);
  B[1]:=StrToFloat(B1E.Text);
  B[2]:=StrToFloat(B2E.Text);
  B[xQuantity-1]:=StrToFloat(BXE.Text);
  if crout_method_interval(xQuantity, A, B, XStr, XWidth, XInt) and crout_method(xQuantity, A, B, X) then
  begin
       x1L.Text:=FloatToStr(X[0]);
       x2L.Text:=FloatToStr(X[1]);
       x3L.Text:=FloatToStr(X[2]);
       xNL.Text:=FloatToStr(X[xQuantity-1]);
       ix1LL.Text:=XStr[0][0];
       ix1LR.Text:=XStr[0][1];
       ix2LL.Text:=XStr[1][0];
       ix2LR.Text:=XStr[1][1];
       ix3LL.Text:=XStr[2][0];
       ix3LR.Text:=XStr[2][1];
       ixNLL.Text:=XStr[xQuantity-1][0];
       ixNLR.Text:=XStr[xQuantity-1][1];
       ix1WL.Text:=FloatToStr(XWidth[0]);
       ix2WL.Text:=FloatToStr(XWidth[1]);
       ix3WL.Text:=FloatToStr(XWidth[2]);
       ixNWL.Text:=FloatToStr(XWidth[xQuantity-1]);
       WarningL.Caption:='';
       matrix_multiplication(xQuantity, A, X, BCalc);
       Ax1L.Text:=FloatToStr(BCalc[0]);
       Ax2L.Text:=FloatToStr(BCalc[1]);
       Ax3L.Text:=FloatToStr(BCalc[2]);
       AxNL.Text:=FloatToStr(BCalc[xQuantity-1]);
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
      xNL.Caption:='';
      ix1LL.Text:='';
      ix1LR.Text:='';
      ix2LL.Text:='';
      ix2LR.Text:='';
      ix3LL.Text:='';
      ix3LR.Text:='';
      ixNLL.Text:='';
      ixNLR.Text:='';
      ix1WL.Text:='';
      ix2WL.Text:='';
      ix3WL.Text:='';
      ixNWL.Text:='';
      Ax1L.Caption:='';
      Ax2L.Caption:='';
      Ax3L.Caption:='';
      AxNL.Caption:='';
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

