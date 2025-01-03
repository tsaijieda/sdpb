(* ::Package:: *)

(* Examples *)

<<"/Users/ethan/Desktop/\:7269\:7406/sdpb/test4/SDPB.m";
mu = 1.999;
M = 1;



A[s_, t_, l_, a_] := 
  1/(s - a M^2) LegendreP[l, 1 + (2 s t)/(s - M^2)^2] + 
   1/(2 M^2 - s - t - a M^2)
     LegendreP[l, 
     1 + (2 (2 M^2 - s - t) t)/(2 M^2  - s - t - M^2)^2];
     
Reschan[s_, t_, l_, a_] := 
  Residue[A[x, t, l, a]/((x - M^2) (M^2 - x - t) (x - s)), {x, 
     a M^2}] + 
   Residue[A[x, t, l, a]/((x - M^2) (M^2 - x - t) (x - s)), {x, 
     2 M^2 - a M^2 - t}];
     
NC1all[k_, q_, a_, l_] := 
  FullSimplify[
   1/((k - q - 1)! q!)
      D[D[FullSimplify[(M^2 - s - t) (Reschan[s, t, l, a])], {s, 
         k - q - 1}] /. {s -> M^2}, {t, q}] /. {t -> 0}];


Bsall[s_, t_, l_, a_] := 
  1/(s - a M^2)
    LegendreP[l, (2 t - 2 M^2 + s)/Sqrt[(s) (s - 4 M^2)]];
Buall[s_, t_, l_, 
   a_] := +(1/(2 M^2 - s - t - a M^2)) LegendreP[l, 
    1 + (2 (2 M^2 - s - t) s)/(2 M^2 - s - t - M^2)^2];
Resschan[s_, t_, l_, a_] := 
  Simplify[Residue[Bsall[x, t, l, a]/(x^2 (x - s)), {x, a M^2}] + 
    Residue[Bsall[x, t, l, a]/(x^2 (x - s)), {x, 2 M^2 - t - a M^2}]];
Resuchan[s_, t_, l_, a_] := 
  Simplify[Residue[Buall[x, t, l, a]/(x^2 (x - s)), {x, a M^2}] + 
    Residue[Buall[x, t, l, a]/(x^2 (x - s)), {x, 2 M^2 - t - a M^2}]];
NC2sall[k_, q_, a_, l_] :=
  
   1/(k - q - 2)! FullSimplify[
    Residue[( 
       Limit[D[ Resschan[s, t, l, a + mu], {s, k - q - 2}], {s -> 0}])/(t -
         M^2)^(q + 1), {t, M^2}]];
NC2uall[k_, q_, a_, l_] :=
  
   1/(k - q - 2)! FullSimplify[
    Residue[( 
       Limit[D[ Resuchan[s, t, l, a + mu], {s, k - q - 2}], {s -> 0}])/(t -
         M^2)^(q + 1), {t, M^2}]];


g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+mu)+1/(x+s+t-2*M^2+mu))*1/((x-M^2+mu)(x+t-M^2+mu))*LegendreP[l,1+(2(x+mu) t)/(x-M^2+mu)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];

n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+mu)+1/(x+s+t-2*M^2+mu))*1/((x-M^2+mu)(x+t-M^2+mu))*LegendreP[l,1+(2(x+mu) t)/(x-M^2+mu)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];

m[k_,q_,x_,l_]:=Refine[Re[Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/((x+mu)-s)*1/((x+mu))^2*s^2*LegendreP[l,(2t-2M^2+(x+mu))/Sqrt[(x+mu)(x+mu-4M^2)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]]],Element[{x},Reals]];

l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+mu)-t)-s)*1/(2-(x+mu)-t)^2*s^2*LegendreP[l,1+(2*((x+mu))*(2-(x+mu)-t))/((x+mu)-M^2)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];

h[k_,q_,x_,l_]:=FullSimplify[1/((k-q-1)!)*1/((q)!)(D[D[(s+t)(1/(x-s+mu)+1/(x+s+t+mu))*1/((x+mu)(x+t+mu))*LegendreP[l,1+(2t)/(x+mu)],{t,q}]/.{t -> 0},{s,k-q-1}]/.{s -> 0})];

j[k_,q_,x_,l_]:=FullSimplify[1/((k-q-1)!)*1/((q)!)(D[D[(s+t-8/3*M^2)(1/(x-s+mu)+1/(x+s+t+mu-4))*1/((x-4/3+mu)(x+t-8/3+mu))*LegendreP[l,1+(2t)/(x+mu-4)],{t,q}]/.{t -> 0},{s,k-q-1}]/.{s -> 0})];

(*k[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(-1-s+1)+1/(-1+s+t-2*M^2+1))*1/((-1-M^2+1)(-1+t-M^2+1))*LegendreP[l,1+(2(-1+1) t)/(-1-M^2+1)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];*)

k[k_,q_,x_,l_]:=0;




(*M=1;

spin = ToExpression[ReadList["range.txt"][[1]]];
bound = ToExpression[ReadList["range.txt"][[2]]];*)
spin = 2;
bound = 1;
(*bound = -1;*)

(*matA[J_, f_]:={{{0,h[2,0,f,J]/2,h[5,2,f,J]-h[5,3,f,J],h[6,2,f,J]-h[6,4,f,J],3*h[4,0,f,J]-h[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC2sall[5,2,f,J],NC2sall[7,5,f,J]/2,NC2sall[6,2,f,J]/2,NC2sall[4,2,f,J]/2,NC2sall[6,3,f,J]/2,NC2sall[7,4,f,J]/2,NC2sall[7,2,f,J]/2,NC2sall[7,3,f,J]/2,NC2sall[3,1,f,J]/2,NC2sall[4,1,f,J]/2,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC1all[5,2,f,J]-NC2uall[5,2,f,J],NC1all[7,5,f,J]-NC2uall[7,5,f,J],NC1all[6,2,f,J]-NC2uall[6,2,f,J],NC1all[4,2,f,J]-NC2uall[4,2,f,J],NC1all[6,3,f,J]-NC2uall[6,3,f,J],NC1all[7,4,f,J]-NC2uall[7,4,f,J],NC1all[7,2,f,J]-NC2uall[7,2,f,J],NC1all[7,3,f,J]-NC2uall[7,3,f,J],NC1all[3,1,f,J]-NC2uall[3,1,f,J],NC1all[4,1,f,J]-NC2uall[4,1,f,J],0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,NC2sall[5,2,f,J]/2,NC2sall[7,5,f,J]/2,NC2sall[6,2,f,J]/2,NC2sall[4,2,f,J]/2,NC2sall[6,3,f,J]/2,NC2sall[7,4,f,J]/2,NC2sall[7,2,f,J]/2,NC2sall[7,3,f,J]/2,NC2sall[3,1,f,J]/2,NC2sall[4,1,f,J]/2,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,j[5,2,f,J]-j[5,3,f,J],j[6,2,f,J]-j[6,4,f,J],3*j[4,0,f,J]-j[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0}}};*)
(*matA[J_, f_]:={{{0,h[2,0,f,J]/2,h[5,2,f,J]-h[5,3,f,J],h[6,2,f,J]-h[6,4,f,J],3*h[4,0,f,J]-h[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,j[5,2,f,J]-j[5,3,f,J],j[6,2,f,J]-j[6,4,f,J],3*j[4,0,f,J]-j[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0}}};*)
matA[J_, f_]:={{{0,h[2,0,f,J]/2,h[5,2,f,J]-h[5,3,f,J],h[6,2,f,J]-h[6,4,f,J],3*h[4,0,f,J]-h[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,m[5,2,f,J]/2,m[5,4,f,J]/2,m[6,2,f,J]/2,m[4,2,f,J]/2,m[6,3,f,J]/2,m[2,1,f,J]/2,m[7,2,f,J]/2,m[7,3,f,J]/2,m[3,1,f,J]/2,m[4,1,f,J]/2,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,n[5,2,f,J]-l[5,2,f,J],n[5,4,f,J]-l[5,4,f,J],n[6,2,f,J]-l[6,2,f,J],n[4,2,f,J]-l[4,2,f,J],n[6,3,f,J]-l[6,3,f,J],n[2,1,f,J]-l[2,1,f,J],n[7,2,f,J]-l[7,2,f,J],n[7,3,f,J]-l[7,3,f,J],n[3,1,f,J]-l[3,1,f,J],n[4,1,f,J]-l[4,1,f,J],0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,m[5,2,f,J]/2,m[5,4,f,J]/2,m[6,2,f,J]/2,m[4,2,f,J]/2,m[6,3,f,J]/2,m[2,1,f,J]/2,m[7,2,f,J]/2,m[7,3,f,J]/2,m[3,1,f,J]/2,m[4,1,f,J]/2,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,j[5,2,f,J]-j[5,3,f,J],j[6,2,f,J]-j[6,4,f,J],3*j[4,0,f,J]-j[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0}}};
(*matA[J_, f_]:={{{0,0,h[5,2,f,J]-h[5,3,f,J],h[6,2,f,J]-h[6,4,f,J],3*h[4,0,f,J]-h[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC2sall[5,2,f,J]/2,NC2sall[7,5,f,J]/2,NC2sall[6,2,f,J]/2,NC2sall[4,2,f,J]/2,NC2sall[6,3,f,J]/2,NC2sall[7,4,f,J]/2,NC2sall[7,2,f,J]/2,NC2sall[7,3,f,J]/2,NC2sall[3,1,f,J]/2,NC2sall[4,1,f,J]/2}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC1all[5,2,f,J]-NC2uall[5,2,f,J],NC1all[7,5,f,J]-NC2uall[7,5,f,J],NC1all[6,2,f,J]-NC2uall[6,2,f,J],NC1all[4,2,f,J]-NC2uall[4,2,f,J],NC1all[6,3,f,J]-NC2uall[6,3,f,J],NC1all[7,4,f,J]-NC2uall[7,4,f,J],NC1all[7,2,f,J]-NC2uall[7,2,f,J],NC1all[7,3,f,J]-NC2uall[7,3,f,J],NC1all[3,1,f,J]-NC2uall[3,1,f,J],NC1all[4,1,f,J]-NC2uall[4,1,f,J]},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,NC2sall[5,2,f,J]/2,NC2sall[7,5,f,J]/2,NC2sall[6,2,f,J]/2,NC2sall[4,2,f,J]/2,NC2sall[6,3,f,J]/2,NC2sall[7,4,f,J]/2,NC2sall[7,2,f,J]/2,NC2sall[7,3,f,J]/2,NC2sall[3,1,f,J]/2,NC2sall[4,1,f,J]/2},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,j[5,2,f,J]-j[5,3,f,J],j[6,2,f,J]-j[6,4,f,J],3*j[4,0,f,J]-j[4,2,f,J],0,0,0,0,0,0,0,0,0,0}}};*)
matB[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC1all[5,2,f,J]-NC2uall[5,2,f,J],NC1all[7,5,f,J]-NC2uall[7,5,f,J],NC1all[6,2,f,J]-NC2uall[6,2,f,J],NC1all[4,2,f,J]-NC2uall[4,2,f,J],NC1all[6,3,f,J]-NC2uall[6,3,f,J],NC1all[7,4,f,J]-NC2uall[7,4,f,J],NC1all[7,2,f,J]-NC2uall[7,2,f,J],NC1all[7,3,f,J]-NC2uall[7,3,f,J],NC1all[3,1,f,J]-NC2uall[3,1,f,J],NC1all[4,1,f,J]-NC2uall[4,1,f,J],0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}}};
(*matC[J_, f_]:={{{-h[3,1,f,J],h[2,0,f,J]/2,h[5,2,f,J]-h[5,3,f,J],h[6,2,f,J]-h[6,4,f,J],3*h[4,0,f,J]-h[4,2,f,J],0,0,0,-k[5,2,f,J],-k[7,5,f,J],-k[6,2,f,J],-k[4,2,f,J],-k[6,3,f,J],-k[7,4,f,J],-k[7,2,f,J],-k[7,3,f,J],-k[3,1,f,J],-k[4,1,f,J],1},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC2sall[5,2,f,J]/2,NC2sall[7,5,f,J]/2,NC2sall[6,2,f,J]/2,NC2sall[4,2,f,J]/2,NC2sall[6,3,f,J]/2,NC2sall[7,4,f,J]/2,NC2sall[7,2,f,J]/2,NC2sall[7,3,f,J]/2,NC2sall[3,1,f,J]/2,NC2sall[4,1,f,J]/2,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,NC2sall[5,2,f,J]/2,NC2sall[7,5,f,J]/2,NC2sall[6,2,f,J]/2,NC2sall[4,2,f,J]/2,NC2sall[6,3,f,J]/2,NC2sall[7,4,f,J]/2,NC2sall[7,2,f,J]/2,NC2sall[7,3,f,J]/2,NC2sall[3,1,f,J]/2,NC2sall[4,1,f,J]/2,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,j[5,2,f,J]-j[5,3,f,J],j[6,2,f,J]-j[6,4,f,J],3*j[4,0,f,J]-j[4,2,f,J],0,0,0,0,0,0,0,0,0,0,-1}}};*)
matC[J_, f_]:={{{1,h[2,0,f,J]/2,h[5,2,f,J]-h[5,3,f,J],h[6,2,f,J]-h[6,4,f,J],3*h[4,0,f,J]-h[4,2,f,J],0,0,0,-k[5,2,f,J],-k[7,5,f,J],-k[6,2,f,J],-k[4,2,f,J],-k[6,3,f,J],-k[7,4,f,J],-k[7,2,f,J],-k[7,3,f,J],-k[3,1,f,J],-k[4,1,f,J],1},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC2sall[5,2,f,J],NC2sall[7,5,f,J]/2,NC2sall[6,2,f,J]/2,NC2sall[4,2,f,J]/2,NC2sall[6,3,f,J]/2,NC2sall[7,4,f,J]/2,NC2sall[7,2,f,J]/2,NC2sall[7,3,f,J]/2,NC2sall[3,1,f,J]/2,NC2sall[4,1,f,J]/2,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC1all[5,2,f,J]-NC2uall[5,2,f,J],NC1all[7,5,f,J]-NC2uall[7,5,f,J],NC1all[6,2,f,J]-NC2uall[6,2,f,J],NC1all[4,2,f,J]-NC2uall[4,2,f,J],NC1all[6,3,f,J]-NC2uall[6,3,f,J],NC1all[7,4,f,J]-NC2uall[7,4,f,J],NC1all[7,2,f,J]-NC2uall[7,2,f,J],NC1all[7,3,f,J]-NC2uall[7,3,f,J],NC1all[3,1,f,J]-NC2uall[3,1,f,J],NC1all[4 ,1,f,J]-NC2uall[4,1,f,J],0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,NC2sall[5,2,f,J]/2,NC2sall[7,5,f,J]/2,NC2sall[6,2,f,J]/2,NC2sall[4,2,f,J]/2,NC2sall[6,3,f,J]/2,NC2sall[7,4,f,J]/2,NC2sall[7,2,f,J]/2,NC2sall[7,3,f,J]/2,NC2sall[3,1,f,J]/2,NC2sall[4,1,f,J]/2,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,j[5,2,f,J]-j[5,3,f,J],j[6,2,f,J]-j[6,4,f,J],3*j[4,0,f,J]-j[4,2,f,J],0,0,0,0,0,0,0,0,0,0,-1}}};
matD[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}}};
(*matE[J_, f_]:={{{0,0,h[5,2,f,J]-h[5,3,f,J],h[6,2,f,J]-h[6,4,f,J],3*h[4,0,f,J]-h[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC1all[5,2,f,J]-NC2uall[5,2,f,J],NC1all[7,5,f,J]-NC2uall[7,5,f,J],NC1all[6,2,f,J]-NC2uall[6,2,f,J],NC1all[4,2,f,J]-NC2uall[4,2,f,J],NC1all[6,3,f,J]-NC2uall[6,3,f,J],NC1all[7,4,f,J]-NC2uall[7,4,f,J],NC1all[7,2,f,J]-NC2uall[7,2,f,J],NC1all[7,3,f,J]-NC2uall[7,3,f,J],NC1all[3,1,f,J]-NC2uall[3,1,f,J],NC1all[4,1,f,J]-NC2uall[4,1,f,J]},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,j[5,2,f,J]-j[5,3,f,J],j[6,2,f,J]-j[6,4,f,J],3*j[4,0,f,J]-j[4,2,f,J],0,0,0,0,0,0,0,0,0,0}}};*)
matE[J_, f_]:={{{0,h[2,0,f,J]/2,h[5,2,f,J]-h[5,3,f,J],h[6,2,f,J]-h[6,4,f,J],3*h[4,0,f,J]-h[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,NC1all[5,2,f,J]-NC2uall[5,2,f,J],NC1all[7,5,f,J]-NC2uall[7,5,f,J],NC1all[6,2,f,J]-NC2uall[6,2,f,J],NC1all[4,2,f,J]-NC2uall[4,2,f,J],NC1all[6,3,f,J]-NC2uall[6,3,f,J],NC1all[7,4,f,J]-NC2uall[7,4,f,J],NC1all[7,2,f,J]-NC2uall[7,2,f,J],NC1all[7,3,f,J]-NC2uall[7,3,f,J],NC1all[3,1,f,J]-NC2uall[3,1,f,J],NC1all[4,1,f,J]-NC2uall[4,1,f,J],0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,j[5,2,f,J]-j[5,3,f,J],j[6,2,f,J]-j[6,4,f,J],3*j[4,0,f,J]-j[4,2,f,J],0,0,0,0,0,0,0,0,0,0,0}}};


MatCombine[f_]:=Fold[ArrayFlatten[{{#,{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},#2}}]&,{matA[0,f],matD[1,f],matA[2,f],matD[3,f],matA[4,f],matD[5,f],matA[6,f],matD[7,f],matA[8,f],matD[9,f],matA[10,f],matD[11,f],matA[12,f],matD[13,f]}];
MatCombine2[f_]:=Fold[ArrayFlatten[{{#,{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},#2}}]&,{matC[spin,f],matD[1,f],matD[2,f],matD[3,f],matD[4,f],matD[5,f],matD[6,f],matD[7,f],matD[8,f],matD[9,f],matD[10,f],matD[11,f],matD[12,f],matD[13,f]}];
MatCombine3[f_]:=Fold[ArrayFlatten[{{#,{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},#2}}]&,{matE[0,f],matD[1,f],matE[2,f],matD[3,f],matE[4,f],matD[5,f],matE[6,f],matD[7,f],matE[8,f],matD[9,f],matE[10,f],matD[11,f],matE[12,f],matD[13,f]}];



Polyp[f_]:={

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine[f]]};
        
Polyp3[f_]:=

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine[f]];

Polyp4[f_]:=

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine2[f]];   
             
Polyp5[f_]:=

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine3[f]]; 
                  
Polyp2[f_]:={

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],Sum[MatCombine[x],{x,4,f}]+MatCombine[1]+MatCombine[2]]};

  
SDP[datfile_] := Module[

    {
   
		
        pols = {
        Polyp4[1 - mu],
        Polyp3[0],
        Polyp3[1],
		Polyp3[2],
		Polyp3[3],
		Polyp3[4],
		Polyp3[5],
		Polyp3[6],
		Polyp3[7],
		Polyp3[8],
		Polyp3[9],
		Polyp3[10],
		Polyp3[11],
		Polyp3[12],
		Polyp3[13],
		Polyp3[14],
		Polyp3[15](*,
		Polyp3[16],
		Polyp3[17],
		Polyp3[18],
		Polyp3[19],
		Polyp3[20],
		Polyp3[21],
		Polyp3[22],
		Polyp3[23],
		Polyp3[24],
		Polyp3[25],
		Polyp3[26],
		Polyp3[27],
		Polyp3[28],
		Polyp3[29],
		Polyp3[30],
		Polyp3[31],
		Polyp3[32],
		Polyp3[33],
		Polyp3[34],
		Polyp3[35],
		Polyp3[36],
		Polyp3[37],
		Polyp3[38],
		Polyp3[39],
		Polyp3[40],
		Polyp3[41],
		Polyp3[42],
		Polyp3[43],
		Polyp3[44],
		Polyp3[45]*)
        },

        (*pols = Polyp2[20],*)
		norm = {bound, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        obj  = {0, - 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

    },
 
    

(*
{pols={PositiveMatrixWithPrefactor[DampedRational[1,{},1/E,x],{{{1+x^4,x^4/12+x^2}}}]},norm={1,0},obj={0,-1}},
*)
    (*Print[pols];*)
    Print[norm];
    Print[obj];
    WriteBootstrapSDP[datfile, SDP[obj, norm, pols]];]

SDP["/Users/ethan/Desktop/\:7269\:7406/sdpb/test4/new.xml"]










