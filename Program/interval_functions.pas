unit interval_functions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, intervalarithmetic;
type
  OneDimArray = array of extended;
  TwoDimArray = array of OneDimArray;
  IntOneDimArray = array of interval;
  IntTwoDimArray = array of IntOneDimArray;
  StrOneDimArray = array of string;
  StrTwoDimArray = array of StrOneDimArray;

function crout_method_interval(n : integer; A : TwoDimArray; B : OneDimArray; XStr : StrTwoDimArray; XWidth : OneDimArray; XInt : IntOneDimArray) : boolean;
procedure IntOneDimArray2OneDimArray(n: integer; XInt: IntOneDimArray; X: OneDimArray);

implementation

procedure IntOneDimArray2OneDimArray(n: integer; XInt: IntOneDimArray; X: OneDimArray);
var
  i: integer;
begin
  for i:=0 to n-1 do X[i]:=interval_mean(XInt[i]);
end;

function crout_decomposition(n : integer; A : IntTwoDimArray; D : IntTwoDimArray) : boolean;
var
  i,j,k,p : integer;
  sum : interval;
begin
  for k := 0 to n - 1 do if compare_equal(A[k][k],int_read('0')) then Exit(false);
  for k := 0 to n - 1 do
  begin
    for i := k to n - 1 do
    begin
         sum:=int_read('0');
         for p := 0 to k - 1 do
            sum := iadd(sum,imul(D[i][p],D[p][k])); //sum + D[i][p] * D[p][k];
        D[i][k]:= isub(A[i][k],sum); //A[i][k]-sum;
    end;
    if compare_equal(D[k][k],int_read('0')) then Exit(false);
    for j := k + 1 to n - 1 do
    begin
        sum:=int_read('0');
        for p := 0 to k - 1 do
          sum := iadd(sum,imul(D[k][p],D[p][j])); //sum + D[k][p] * D[p][j];
        D[k][j] := idiv(isub(A[k][j],sum),D[k][k]); //(A[k][j]-sum)/D[k][k];
    end;
  end;
  crout_decomposition := true;
end;

function crout_solve(n : integer; D : IntTwoDimArray; B : IntOneDimArray; X : IntOneDimArray) : boolean;
var
  i,k : integer;
  sum : interval;
begin
  for i := 0 to n - 1 do
  begin
    sum := int_read('0');
    for k := 0 to i - 1 do
        sum := iadd(sum,imul(D[i][k],X[k])); //sum + D[i][k] * X[k];
    X[i] := idiv(isub(B[i],sum),D[i][i]); //(B[i] - sum)/D[i][i];
  end;
  for i := n - 1 downto 0 do
  begin
    sum := int_read('0');
    for k := i + 1 to n - 1 do
        sum := iadd(sum,imul(D[i][k],X[k])); //sum + D[i][k] * X[k];
    X[i] := isub(X[i],sum); //X[i] - sum;
  end;
  crout_solve := true;
end;

function crout_method_interval(n : integer; A : TwoDimArray; B : OneDimArray; XStr : StrTwoDimArray; XWidth : OneDimArray; XInt : IntOneDimArray) : boolean;
var
  DInt : IntTwoDimArray;
  AInt : IntTwoDimArray;
  BInt : IntOneDimArray;
  i,j : integer;
begin
  setlength(DInt, n, n);
  setlength(AInt, n, n);
  setlength(BInt, n);

  for i := 0 to n - 1 do
  begin
    for j := 0 to n - 1 do
    begin
      AInt[i][j]:=int_read(FloatToStr(A[i][j]));
    end;
    BInt[i]:=int_read(FloatToStr(B[i]));
  end;

  if crout_decomposition(n,AInt,DInt) and crout_solve(n,DInt,BInt,XInt) then
  begin
    for i := 0 to n - 1 do
    begin
      iends_to_strings(XInt[i],XStr[i][0],XStr[i][1]);
      XWidth[i]:=int_width(XInt[i]);
    end;
    Exit(true);
  end
  else Exit(false);
end;

end.

