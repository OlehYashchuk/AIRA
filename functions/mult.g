mult:=function(f,g)
		local r;
		r:=[];
		r[1]:=f[1]*g[1];
		r[2]:=Minimum(f[2],g[2]);
	return r;
end;