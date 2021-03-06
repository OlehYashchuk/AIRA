# Группа q8 - группа кватернионов
# Рештка L из 0, 1
# Все подгруппы группы LQ=q8*L
# Read("d:/D/Algebra/Кватернионы/Q8.txt");
Read("d:/D/Algebra/Кватернионы/LG.txt");
Read("d:/D/Algebra/Кватернионы/mult.txt");

# q8:=QuaternionGroup(8);
q8:=SmallGroup(8,4);
# Elements(SmallGroup(8,4));
q:=AsList(q8);
L:=[0,1];
# Cartesian product
LQ:=Cartesian(q, L); 

# All possible combinations
Comb:=[];
for i in [1..Size(LQ)] do
	Append(Comb,Combinations(LQ,i));
od;
Size(Comb);

sum:=0;
SubGroup:=[];
# output := OutputTextFile( "d:/Oleh/Codding/GAP/Кватернионы/Результаты/Подгруппы Q8 ?????.txt", false);
# AppendTo(output,"LG1, LG2, LG3 are TRUE:\n");
# Print("LG1, LG2, LG3 are TRUE:\n");
for i in [1..Length(Comb)] do
	if LG1(Comb[i]) and LG2(Comb[i]) and LG3(Comb[i]) then # 
	# if LG1(Comb[i]) and LG2(Comb[i]) and LG3(Comb[i]) then # 
		sum:=sum+1;
		SubGroup[sum]:=Comb[i];
		# Append(SubGroup,Comb[i]);
		# AppendTo(output,i,". ",Comb[i],"\n");
		Print(i,". ",Comb[i],"\n");
	fi;
od;

count:=0;
for i in [1..Length(SubGroup)] do
	score:=0;
	for j in [1..Length(SubGroup[i])] do
		# Print(i, ". j = ", j, "\n");
		for k in [1..Length(LQ)] do
			if mult(mult(LQ[k], SubGroup[i][j]), [LQ[k][1]^(-1), LQ[k][2]]) in SubGroup[i] then
				score:=score+1;
			fi;
			# Print("     k = ", k, " | score = ", score, "\n");
		od;
	od;
	# Print(i, ". j*k = ", Length(SubGroup[i])*Length(LQ), "\n");
	# Print(i, ". score = ", score, "\n");
	if score = j*k then
		count:=count+1;
		Print(i,". ",SubGroup[i],"\n");
	fi;
od;
