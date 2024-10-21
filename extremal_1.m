(* ::Package:: *)

(* Examples *)

<<"/Users/ethan/Desktop/\:7269\:7406/sdpb/test4/SDPB.m";



h[k_,q_,x_,l_]:=FullSimplify[(1+x)^10*(-1)^(q-1)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+1)+1/(x+s+t+1))*1/((x+1)(x+t+1))*LegendreP[l,1+(2t)/(x+1)],{t,q-1}]/.{t -> -s},{s,k-q-1}]/.{s -> 0})];
r[k_,q_,x_,l_]:=FullSimplify[(1+x)^10*(-1)^(q-1)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+1)+1/(x+s+t+1))*1/((x+1)(x+t+1))*LegendreP[l,1+(2t)/(x+1)],{t,q-1}]/.{t -> -s},{s,k-q-1}]/.{s -> 0})];
a[k_,q_,x_,l_]:=FullSimplify[(1+x)^10*(-1)^(q-1)*1/((k-1)!)(D[(s+t)(1/(x-s+1)+1/(x+s+t+1))*1/((x+1)(x+t+1))*LegendreP[l,1+(2t)/(x+1)]/.{t -> 0},{s,k-1}]/.{s -> 0})];
j[k_,q_,x_,l_]:=Expand[Simplify[1/((k-q-1)!)*1/((q)!)(D[D[(s+t)*(1/(x-s+1.0)+1/(x+s+t+1.0))*1/((x+1.0)(x+t+1.0))*LegendreP[l,1+(2t)/(x+1.0)],{s,k-q-1}]/.{s -> 0},{t,q}]/.{t -> 0})]];
new[k_,q_,x_,l_]:=FullSimplify[1/((k-q-1)!)*1/((q)!)(D[D[(s+t-8/3*M^2)(1/(x-s+1)+1/(x+s+t+1-4))*1/((x-4/3+1)(x+t-8/3+1))*LegendreP[l,1+(2t)/(x+1-4)],{t,q}]/.{t -> 4/3},{s,k-q-1}]/.{s -> 4/3})];


M=1;

(*matA[J_, f_]:={{{-r[3,1,f,J],-a[2,0,f,J],-a[4,0,f,J]/2,-h[4,1,f,J]+2h[4,2,f,J]-3h[4,3,f,J]-(-h[4,3,f,J]),h[5,2,f,J]-3h[5,3,f,J]+6h[5,4,f,J]-(-h[5,3,f,J]+4h[5,4,f,J]),-h[5,1,f,J]+2h[5,2,f,J]-3h[5,3,f,J]+4h[5,4,f,J]-(h[5,4,f,J]),h[6,2,f,J]-3h[6,3,f,J]+6h[6,4,f,J]-10h[6,5,f,J]-(h[6,4,f,J]-5h[6,5,f,J]),-h[7,3,f,J]+4h[7,4,f,J]-10h[7,5,f,J]+20h[7,6,f,J]-(h[7,4,f,J]-5h[7,5,f,J]+15h[7,6,f,J]),-h[6,1,f,J]+2h[6,2,f,J]-3h[6,3,f,J]+4h[6,4,f,J]-5h[6,5,f,J]-(-h[6,5,f,J]),h[7,2,f,J]-3h[7,3,f,J]+6h[7,4,f,J]-10h[7,5,f,J]+15h[7,6,f,J]-(-h[7,5,f,J]+6h[7,6,f,J]),-h[8,3,f,J]+4h[8,4,f,J]-10h[8,5,f,J]+20h[8,6,f,J]-35h[8,7,f,J]-(-h[8,5,f,J]+6h[8,6,f,J]-21h[8,7,f,J]),h[9,4,f,J]-5h[9,5,f,J]+15h[9,6,f,J]-35h[9,7,f,J]+70h[9,8,f,J]-(-h[9,5,f,J]+6h[9,6,f,J]-21h[9,7,f,J]+56h[9,8,f,J])}}};*)
(*matA[J_, f_]:={{{h[3,1,f,J],h[2,1,f,J],h[4,1,f,J],(-h[4,1,f,J]+2h[4,2,f,J]-3h[4,3,f,J]-(-h[4,3,f,J])),h[5,2,f,J]-3h[5,3,f,J]+6h[5,4,f,J]-(-h[5,3,f,J]+4h[5,4,f,J]),h[6,2,f,J]-3h[6,3,f,J]+6h[6,4,f,J]-10h[6,5,f,J]-(h[6,4,f,J]-5h[6,5,f,J])}}};*)
matA[J_, f_]:={{{-new[3,1,f,J],new[2,0,f,J]/2,new[4,0,f,J]/4,new[5,2,f,J]-new[5,3,f,J],new[6,2,f,J]-new[6,4,f,J],3*new[4,0,f,J]-new[4,2,f,J],new[8,2,f,J]-new[8,6,f,J],new[8,3,f,J]-new[8,5,f,J]}}};
MatCombine[f_]:=Fold[ArrayFlatten[{{#,{0, 0, 0, 0, 0, 0}},{{0, 0, 0, 0, 0, 0},#2}}]&,{matA[0,f],matA[2,f],matA[4,f],matA[6,f],matA[8,f]}];


        
Polyp[J_,x_]:=

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],matA[J,x]];
    
Polyp2[x_]:=

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine[x]];
gap = 0;

spin = ToExpression[ReadList["range.txt"][[1]]];
setvalue = ToExpression[ReadList["division.txt"][[1]]];
bound = ToExpression[ReadList["range.txt"][[2]]];


(*spin = 0;
setvalue = 4.222885459;
bound = -1;*)

SDP[datfile_] := Module[

    {
   
        pols = {
        (*Polyp[spin, gap],*)
        (*        
        Polyp[2,gap],
        Polyp[4,gap],
        Polyp[6,gap],
        Polyp[8,gap],
        Polyp[10,gap],
        Polyp[12,gap],
        Polyp[14,gap],
        Polyp[16,gap],
        Polyp[18,gap],
        Polyp[20,gap],
        Polyp[22,gap],
        Polyp[24,gap],
        Polyp[26,gap],
        Polyp[28,gap],
        Polyp[30,gap],
        Polyp[32,gap],
        Polyp[34,gap],
        Polyp[36,gap],
        Polyp[38,gap],
        Polyp[40,gap],
        *)
        Polyp[0,4.0],
        Polyp[2,4.0],
        Polyp[4,4.0],
        Polyp[6,4.0],
        Polyp[8,4.0],
        Polyp[10,4.0],
        Polyp[12,4.0],
        Polyp[14,4.0],
        Polyp[16,4.0],
        Polyp[18,4.0],
        Polyp[20,4.0],
        Polyp[22,4.0],
        Polyp[24,4.0],
        Polyp[26,4.0],
        Polyp[28,4.0],
        Polyp[30,4.0],
        Polyp[32,4.0],
        Polyp[34,4.0],
        Polyp[36,4.0],
        Polyp[38,4.0],
        Polyp[40,4.0],
        Polyp[0,5],
        Polyp[2,5],
        Polyp[4,5],
        Polyp[6,5],
        Polyp[8,5],
        Polyp[10,5],
        Polyp[12,5],
        Polyp[14,5],
        Polyp[16,5],
        Polyp[18,5],
        Polyp[20,5],
        Polyp[22,5],
        Polyp[24,5],
        Polyp[26,5],
        Polyp[28,5],
        Polyp[30,5],
        Polyp[32,5],
        Polyp[34,5],
        Polyp[36,5],
        Polyp[38,5],
        Polyp[40,5]
        },
		norm = {0, 0, bound, 0, 0, 0, 0, 0},
		obj = {setvalue, -1, 0, 0, 0, 0, 0, 0}

    },
 
    

    (*Print[pols];*)
    Print[1+gap];
    Print[norm];
    Print[obj];
    WriteBootstrapSDP[datfile, SDP[obj, norm, pols]];]

SDP["/Users/ethan/Desktop/\:7269\:7406/sdpb/test4/new.xml"]

