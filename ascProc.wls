#!/usr/bin/env wolframscript
(* ::Package:: *)

UsingFrontEnd[
scriptPath = ExpandFileName[First[$ScriptCommandLine]];
scriptName = Last[FileNameSplit[ scriptPath ]];
TruePath=StringReplace[ToString[scriptPath],scriptName->""];
SetDirectory[TruePath];
SetDirectory["RawData"];
\[Alpha]=FileNames["*.asc"];
If[
 Length[\[Alpha]] > 0,
 \[Beta] = {};
 Do[
  AppendTo[
   \[Beta],
   Drop[Import[\[Alpha][[i]]], 20]
   	      ],
  {i, 1, Length[\[Alpha]], 1}
    ]
  ];
v = {};
Do[
    AppendTo[v, {Null, Null}],
 {i, 1, Length[\[Alpha]], 1}
  ];
Do[
   v[[i]] = {},
  {i, 1, Length[\[Alpha]], 1}
     ];
If[
 Length[\[Alpha]] > 0,
 n = 0;
 While[
   	n <= Length[\[Alpha]],
   	Do[
    	AppendTo[
     			v[[n]],
     			{\[Beta][[n]][[i]][[1]] , \[Beta][[n]][[i]][[4]]}
     	       ],
    	  {i, 1, 1024, 1}
                 ];
             n++
             ] // Quiet
        ];
SetDirectory[TruePath];
CreateDirectory["Processed"];
SetDirectory["Processed"];
Do[
	Export[
	FileBaseName[\[Alpha][[i]]]<>ToString[_proc]<>".txt",StringReplace[ToString[TableForm[v[[i]]]],{"      "->" ","     "->" ","    "->" ","   "->" ","  "->" ","\n\n"->"\n"}]
		  ],
	{i,1,Length[\[Alpha]]}
  ]
]
CloseFrontEnd[];
