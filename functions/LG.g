# LG1
LG1:=function(L)
local i, j, I, Stop;
Stop := true;
I := true;
while I and Stop do				
	for i in [1..Length(L)] do
		for j in [1..Length(LQ)] do
			if L[i] > LQ[j] and L[i][1] = LQ[j][1] then
				if not(LQ[j] in L) then
					I := false;
					Stop := false;
					return I;
					break;
				fi;
			fi;
		od;
	od;
	Stop := false;
od;
return I;
end;
# LG1(Comb[63912]);
# Print("L[",i,"] > LQ[",j, "] = ", L[i] > LQ[j], " | L[",i,"][1] = LQ[",j,"][1] = ", L[i][1] = LQ[j][1], "\n");
			# Print("LQ[",j,"] in L = ", LQ[j] in L, "\n");

# LG2
LG2:=function(L)
local i, j, I, Stop;
Stop := true;
I := true;
while  I and Stop do	
	for i in [1..Length(L)] do
		for j in [1..Length(L)] do
			if not(mult(L[i],L[j]) in L) then
				I := false;
				Stop := false;
				return I;
				break;
			fi;
		od;
	od;
	Stop := false;
od;
return I;
end;

# LG3
LG3:=function(L)
local i, j, I, Stop, temp;
Stop := true;
I := true;
while I and Stop do		
	for i in [1..Length(L)] do
		temp := [];
		temp[1] := L[i][1]^(-1);
		Add(temp, L[i][2]);
		if not (temp in L) then
			I := false;
			return I;
			break;
		fi;
	od;
	Stop := false;
od;
return I;
end;