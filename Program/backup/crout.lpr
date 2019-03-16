program crout;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, crout01, crout_solve2, crout_solve3, functions, crout_solve4,
  crout_solvex, interval_functions, intervalarithmetic, unit1;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCSF2, CSF2);
  Application.CreateForm(TCSF3, CSF3);
  Application.CreateForm(TCSF4, CSF4);
  Application.CreateForm(TCSFX, CSFX);
  Application.Run;
end.

