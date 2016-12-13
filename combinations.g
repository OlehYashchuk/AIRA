NrCombinations([1..24], 3);

nComb := function(n, r)
	if r = 0 or r = n then 
		return (1);
	else 
		return (nComb(n-1, r-1) + nComb(n-1, r));
	fi;
end;

nComb(24, 2);

fib := function ( n )
     if n < 3 then
       return 1;
     else
       return fib(n-1) + fib(n-2);
     fi;
end;;
List( [1..10], fib );
