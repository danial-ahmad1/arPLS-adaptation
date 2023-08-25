#!/usr/bin/env wolframscript
(* ::Package:: *)

UsingFrontEnd[
scriptPath = ExpandFileName[First[$ScriptCommandLine]];
scriptName = Last[FileNameSplit[ scriptPath ]];
TruePath=StringReplace[ToString[scriptPath],scriptName->""];
SetDirectory[TruePath];
SetDirectory["Processed/Baseline"];
baselines=FileNames["*.txt"];
bloop={};
Do[
AppendTo[
bloop,
Import[baselines[[i]],"Table"]
	      ],
{i,1,Length[baselines],1}
    ];
SetDirectory[TruePath];
SetDirectory["Processed/Fitted"];
fitted=FileNames["*.txt"];
floop = {};
Do[
  AppendTo[
   floop,
   Import[fitted[[i]],"Table"]
   	      ],
  {i, 1, Length[fitted], 1}
     ];
SetDirectory[TruePath];
plsfit={};
q=0;
Do[
    AppendTo[plsfit, {Null, Null}],
 {i, 1, Length[bloop], 1}
  ];
Do[
   plsfit[[i]] = {},
  {i, 1, Length[bloop], 1}
     ];
While[
q<=Length[bloop],
Do[
AppendTo[
plsfit[[q]],
bloop[[q]][[j]][[2]]-floop[[q]][[j]][[2]]
	         ],
{j,1,1024,1}
  ];
q++
]//Quiet;
colorlist={Black,Darker[Red],Darker[Blue],Darker[Green],Darker[Yellow],Darker[Purple],Darker[Cyan]};
plotgroup={};
Do[AppendTo[plotgroup,Framed[ListLinePlot[{bloop[[i]],plsfit[[i]],floop[[i]]},BaseStyle->{FontSize->16,FontFamily->"Arial"},PlotLabel->" ",LabelStyle->Black,Frame->True,PlotLegends->Placed[{"Raw","arPLS","Corr"},Right],FrameLabel->{"Pixel Number","Count"},ImageSize->Large,AspectRatio->9/16,PlotStyle->{{PlotStyle->colorlist,Thickness[0.003]}},PlotRange->{{0,1024},{Automatic,Automatic}},FrameTicks->{{Automatic,None},{Automatic,Automatic}}]]],{i,1,Length[bloop],1}];
SetDirectory[TruePath];
CreateDirectory["Figures"];
SetDirectory["Figures"];
Do[
	Export[
	FileBaseName[baselines[[i]]]<>ToString[_fig]<>".pdf",plotgroup[[i]],"PDF","AllowRasterization"->False
		  ]
	,{i,1,Length[bloop]}
  ];
SetDirectory[TruePath];
SetDirectory["Processed"];
CreateDirectory["FitLine"];
SetDirectory["FitLine"];
fitlines={};
Do[AppendTo[fitlines,i],{i,1,1024,1}];
Do[
	Export[
	FileBaseName[baselines[[i]]]<>ToString[_fit]<>".txt",plsfit[[i]]
		  ],
	{i,1,Length[bloop],1}
  ];
]
CloseFrontEnd[];
