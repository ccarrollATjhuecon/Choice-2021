(* ::Package:: *)

If[$VersionNumber<8,(*then*) Print["These programs require Mathematica version 8 or greater."];Abort[]];

ExportFigure[MmaFigName_,FileNameText_]:=Block[{},
Export[FileNameText<>".eps",MmaFigName];
Export[FileNameText<>".jpg",MmaFigName,ImageSize->Large];
Export[FileNameText<>".pdf",MmaFigName];
Export[FileNameText<>".svg",MmaFigName];
Show[MmaFigName]];

(* Test whether running from the Notebook interface (may determine treatment of figures) *)
If[$FrontEnd == Null,RunningFromNotebookFrontEnd=True,RunningFromNotebookFrontEnd=False]; 
