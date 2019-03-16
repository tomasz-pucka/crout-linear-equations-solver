unit functions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  OneDimArray = array of extended;
  TwoDimArray = array of OneDimArray;

function crout_method(n : integer; A : TwoDimArray; B : OneDimArray; X : OneDimArray) : boolean;
procedure matrix_multiplication(n : integer; A : TwoDimArray; X : OneDimArray; BCalc : OneDimArray);
procedure vector_difference(n : integer; V1, V2, VDif: OneDimArray);
procedure hilbert_gen(n : integer; A : TwoDimArray; B: OneDimArray);
procedure booth_dekk_gen(n : integer; A : TwoDimArray; B: OneDimArray);
procedure sparse_matrix_gen(n, sparsity: integer; A: TwoDimArray);

implementation

function crout_decomposition(n : integer; A : TwoDimArray; D : TwoDimArray) : boolean;
var
  i,j,k,p : integer;
  sum : extended;
begin
  for k := 0 to n - 1 do if A[k][k] = 0 then Exit(false);
  for k := 0 to n - 1 do
  begin
    for i := k to n - 1 do
    begin
         sum:=0;
         for p := 0 to k - 1 do
            sum := sum + D[i][p] * D[p][k];
        D[i][k]:= A[i][k]-sum;
    end;
    if D[k][k] = 0 then Exit(false);
    for j := k + 1 to n - 1 do
    begin
        sum:=0;
        for p := 0 to k - 1 do
          sum := sum + D[k][p] * D[p][j];
        D[k][j] := (A[k][j]-sum)/D[k][k];
    end;
  end;
  crout_decomposition := true;
end;

function crout_solve(n : integer; D : TwoDimArray; B : OneDimArray; X : OneDimArray) : boolean;
var
  i,k : integer;
  sum : extended;
begin
  for i := 0 to n - 1 do
  begin
    sum := 0;
    for k := 0 to i - 1 do
        sum := sum + D[i][k] * X[k];
    X[i] := (B[i] - sum)/D[i][i];
  end;
  for i := n - 1 downto 0 do
  begin
    sum := 0;
    for k := i + 1 to n - 1 do
        sum := sum + D[i][k] * X[k];
    X[i] := X[i] - sum;
  end;
  crout_solve := true;
end;

function crout_method(n : integer; A : TwoDimArray; B : OneDimArray; X : OneDimArray) : boolean;
var
  D : TwoDimArray;
begin
  setlength(D, n, n);
  if crout_decomposition(n,A,D) and crout_solve(n,D,B,X) then Exit(true)
  else Exit(false);
end;

procedure matrix_multiplication(n : integer; A : TwoDimArray; X : OneDimArray; BCalc : OneDimArray);
var i,k : integer;
    sum : extended;
begin
  for i := 0 to n - 1 do
    begin
      sum := 0;
      for k := 0 to n - 1 do sum := sum + A[i][k] * X[k];
      BCalc[i] := sum;
    end;
end;

procedure vector_difference(n : integer; V1, V2, VDif: OneDimArray);
var
    i: integer;
begin
  for i := 0 to n - 1 do VDif[i]:=abs(V1[i]-V2[i]);
end;

procedure hilbert_gen(n : integer; A : TwoDimArray; B: OneDimArray);
var
    sum : extended;
    i,j : integer;
begin
  for i:=0 to n-1 do
    begin
    sum:=0;
    for j:=0 to n-1 do
      begin
        A[i][j]:=1/(i+1+j);
        sum:=sum+A[i][j];
      end;
      B[i]:=sum;
    end;
end;

function BinomialCoeff(N, K: Cardinal): Cardinal;
var
  L: Cardinal;
begin
  if N < K then
    Result:= 0
  else begin
    if K > N - K then
      K:= N - K;
    Result:= 1;
    L:= 0;
    while L < K do begin
      Result:= Result * (N - L);
      Inc(L);
      Result:= Result div L;
    end;
  end;
end;

procedure booth_dekk_gen(n : integer; A : TwoDimArray; B: OneDimArray);
var
    i,j : integer;
begin
  for i:=0 to n-1 do
    begin
    for j:=0 to n-1 do
      begin
        A[i][j]:=BinomialCoeff(n+(i+1)-1,(i+1)-1)*BinomialCoeff(n-1,n-(j+1))*(n/(i+1+j));
      end;
      B[i]:=i+1;
    end;
end;

procedure sparse_matrix_gen(n, sparsity: integer; A: TwoDimArray);
var
    i,k,zeros,randomi,randomj: integer;
begin
  zeros:=trunc(n*n*(sparsity/100));
  for i:=0 to n-1 do
    for k:=0 to n-1 do
      begin
        if A[i][k]=0 then zeros:=zeros-1;
      end;
  if zeros<=0 then Exit();
  Randomize;
  k:=0;
  while k<zeros do
  begin
    randomi:=Random(n);
    randomj:=Random(n);
    if A[randomi][randomj]=0 then continue;
    A[randomi][randomj]:=0;
    k:=k+1;
  end;

end;

end.
