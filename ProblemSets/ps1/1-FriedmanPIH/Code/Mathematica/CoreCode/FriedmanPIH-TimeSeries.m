(* ::Package:: *)

If[$VersionNumber<8,(*then*) Print["These programs require Mathematica version 8 or greater."];Abort[]];

SetupForSims:=Block[{},ClearAll[ObsList,PermLev,TranShk,\[GothicCapitalG],\[ScriptP],\[ScriptY],\[CurlyTheta],\[CurlyTheta]std,\[ScriptP]std];\[ScriptP]=\[CurlyTheta]=ObsList={}];
AddObsToObsList:=AppendTo[ObsList,If[Length[ObsList]>0,Last[ObsList]+1,1]];
AddObsToPermLev:=AppendTo[\[ScriptP],If[Length[\[ScriptP]]>0,\[GothicCapitalG] Last[\[ScriptP]],\[ScriptP]Start=1]];
AddObsToTranShk:=AppendTo[\[CurlyTheta],RandomReal[NormalDistribution[0,\[CurlyTheta]std]]];
AddObs:=Block[{},AddObsToPermLev;AddObsToTranShk;AddObsToObsList;\[ScriptY]=\[ScriptP]+\[CurlyTheta];\[ScriptC]=\[ScriptP]];

ExportFigure[MmaFigName_,FileNameText_]:=Block[{},
Export[FileNameText<>".eps",MmaFigName];
Export[FileNameText<>".jpg",MmaFigName,ImageSize->Large];
Export[FileNameText<>".pdf",MmaFigName];
Export[FileNameText<>".svg",MmaFigName];
Show[MmaFigName]];

(* Test whether running from the Notebook interface (may determine treatment of figures) *)
If[$FrontEnd == Null,RunningFromNotebookFrontEnd=True,RunningFromNotebookFrontEnd=False]; 
