(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* Setup and housekeeping stuff *)
ClearAll["Global`*"];
If[Length[$FrontEnd] > 0,NBDir=SetDirectory[NotebookDirectory[]]];(* If running from the Notebook interface *)
rootDir = SetDirectory["../../.."];(* root directory below which all code resides *)
CoreCodeDir=SetDirectory[rootDir<>"/Mathematica/CoreCode"];
MainCodeDir=SetDirectory[rootDir<>"/Mathematica/Examples/Question"];
FigsDir=SetDirectory[MainCodeDir<>"/Figures"];
Get[CoreCodeDir<>"/FriedmanPIH-Setup.m"];(* Further setup stuff, for creating figures etc *)



(* Function to construct all results using variances as inputs *)
MakeResults[\[ScriptP]Var_,\[CurlyTheta]Var_,ColorForPlots_] := Block[{\[ScriptP]Std,\[CurlyTheta]Std,\[Alpha]1FriedmanTheory,\[Alpha]0Est,\[Alpha]1Est},
{\[ScriptP]Std,\[CurlyTheta]Std}={\[ScriptP]Var^0.5,\[CurlyTheta]Var^0.5}; (* Compute standard deviations from variances *)
(* Create normally distributed shocks according to the assumed distributions *)
\[CurlyTheta]Vec=RandomVariate[NormalDistribution[0,\[CurlyTheta]Std],NObs];(* \[CurlyTheta]Vec is the list (vector) of transitory shocks *)
\[ScriptP]Vec=\[ScriptP]Mean+RandomVariate[NormalDistribution[0,\[ScriptP]Std],NObs];(* \[ScriptP]Vec is the list (vector) of permanent incomes *)
(* \[ScriptP]Mean is an "environment" variable *)
\[ScriptY]Vec=\[ScriptP]Vec+\[CurlyTheta]Vec; (* Actual income is permanent income plus transitory *)
\[ScriptC]Vec=\[ScriptP]Vec;(* Consumption equals permanent income! *)
FitLine=LinearModelFit[Transpose[{\[ScriptY]Vec,\[ScriptC]Vec}],{1,\[ScriptY]},\[ScriptY]];(* Regress \[ScriptC] on \[ScriptY] and a constant *)
{\[Alpha]0Est,\[Alpha]1Est}=FitLine["BestFitParameters"];
Print["Predicted coefficient from Friedman formula vs estimated from data:",{\[Alpha]1FriedmanTheory=\[ScriptP]Var/(\[ScriptP]Var+\[CurlyTheta]Var),\[Alpha]1Est}];
FitPlot=Plot[FitLine[\[ScriptY]],{\[ScriptY],Min[\[ScriptY]Vec],Max[\[ScriptY]Vec]},PlotStyle->ColorForPlots];
Degree45=Plot[\[ScriptY],{\[ScriptY],0,Max[\[ScriptY]Vec]},PlotStyle->Black];
FitComparedToCEqualsY=Show[Degree45,FitPlot];
DotPlot=ListPlot[Transpose[{\[ScriptY]Vec,\[ScriptC]Vec}],PlotStyle->ColorForPlots];
Return[{\[Alpha]1Est,\[Alpha]1FriedmanTheory,FitComparedToCEqualsY,DotPlot}]];


(* Set parameter values *)
\[ScriptP]VarBase=0.01; (* Standard deviation of permanent income \[ScriptP] *)
\[CurlyTheta]VarBase=0.02;(* Standard deviation of transitory income \[CurlyTheta] *)
\[GothicCapitalG]Base=1.0; (* Growth factor; useful for creating trending time series if \[GothicCapitalG] > 1.0 *)
\[ScriptP]Mean=\[ScriptP]MeanBase = 1.0; (* Level of permanent income to start with *)
NObs=100; (* Number of observations to create *)
FarmerColor=Red;
BaseColor=NonFarmerColor=Blue;



{\[Alpha]1Est,\[Alpha]1FriedmanTheory,FitPlotBase,DotPlotBase}=MakeResults[\[ScriptP]VarBase,\[CurlyTheta]VarBase,NonFarmerColor];
AppendTo[AllResults,{\[Alpha]1Est,\[Alpha]1FriedmanTheory}];
{\[ScriptY]VecBase,\[ScriptC]VecBase}={\[ScriptY]Vec,\[ScriptC]Vec};
Print[Show[FitPlotBase,DotPlotBase]];



(* Example where farmers have larger transitory variance *)
\[CurlyTheta]VarFarm1=3 \[CurlyTheta]VarBase;
{\[Alpha]1Est,\[Alpha]1FriedmanTheory,FitPlotFarm1,DotPlotFarm1}=MakeResults[\[ScriptP]VarBase,\[CurlyTheta]VarFarm1,FarmerColor];
AppendTo[AllResults,{\[Alpha]1Est,\[Alpha]1FriedmanTheory}];



Print[Farm1Plot=Show[FitPlotBase,DotPlotBase,FitPlotFarm1,DotPlotFarm1,PlotRange->All]];


\[ScriptP]VarFarm2=10 \[ScriptP]VarBase;
{\[Alpha]1Est,\[Alpha]1FriedmanTheory,FitPlotFarm2,DotPlotFarm2}=MakeResults[\[ScriptP]VarFarm2,\[CurlyTheta]VarBase,FarmerColor];
AppendTo[AllResults,{\[Alpha]1Est,\[Alpha]1FriedmanTheory}];
Print[Farm2Plot=Show[FitPlotBase,DotPlotBase,FitPlotFarm2,DotPlotFarm2,PlotRange->All]];



\[ScriptP]VarFarm3=0.10 \[ScriptP]VarBase;
\[CurlyTheta]VarFarm3= 3 \[CurlyTheta]VarBase;

{\[Alpha]1Est,\[Alpha]1FriedmanTheory,FitPlotFarm3,DotPlotFarm3}=MakeResults[\[ScriptP]VarFarm3,\[CurlyTheta]VarFarm3,FarmerColor];
AppendTo[AllResults,{\[Alpha]1Est,\[Alpha]1FriedmanTheory}];
Print[Farm3Plot=Show[FitPlotBase,DotPlotBase,FitPlotFarm3,DotPlotFarm3,PlotRange->All]];




