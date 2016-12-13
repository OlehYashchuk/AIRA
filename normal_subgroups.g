# Read("d:/D/AIRA/normal_subgroups.g");
Read("d:/D/AIRA/functions/LG.g");
Read("d:/D/AIRA/functions/mult.g");

# q8:=QuaternionGroup(8);
q8:=SmallGroup(8,4);
# Elements(SmallGroup(8,4));
q:=AsList(q8);
L:=[0,1,2];
# Cartesian product
LQ:=Cartesian(q, L); 

k:=0;
for i in [1..Length(LQ)] do
	k:=k+NrCombinations([1..Length(LQ)], i);
od;
k;

sum:=0;
k:=0;
Comb:=[];
SubGroup:=[];
# output := OutputTextFile( "d:/D/Algebra/Кватернионы/Результаты/Подгруппы_Q8_L3.txt", false);
# AppendTo(output,"LG1, LG2, LG3 are TRUE:\n");
Print("LG1, LG2, LG3 are TRUE:\n");
for i in [1..Length(LQ)] do
	k:=k+NrCombinations([1..Length(LQ)], i);
	Comb:=[];
	Append(Comb,Combinations(LQ,i));
	for j in [1..Length(Comb)] do
		if LG1(Comb[j]) and LG2(Comb[j]) and LG3(Comb[j]) then 
			sum:=sum+1;
			SubGroup[sum]:=Comb[j];
			# AppendTo(output, k, ". ",Comb[j],"\n");
			Print(sum, ". ", i, " ", k, " ", Comb[j],"\n");
		fi;
	od;
od;

# AppendTo(output,"sum = ",sum,";");
# CloseStream(output);

# Проверка условия нормальности
count:=0;
for i in [1..Length(SubGroup)] do
	score:=0;
	for j in [1..Length(SubGroup[i])] do
		for k in [1..Length(LQ)] do
			if mult(mult(LQ[k], SubGroup[i][j]), [LQ[k][1]^(-1), LQ[k][2]]) in SubGroup[i] then
				score:=score+1;
			fi;
		od;
	od;
	if score = j*k then
		count:=count+1;
		Print(i,". ",SubGroup[i],"\n");
	fi;
od;


