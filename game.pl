#!/usr/bin/perl
@tab=([0,0,0,0,0,0],[0,int rand 2,int rand 2,int rand 2,int rand 2,0],[0,int rand 2,int rand 2,int rand 2,int rand 2,0],[0,int rand 2,int rand 2,int rand 2,int rand 2,0],[0,int rand 2,int rand 2,int rand 2,int rand 2,0],[0,0,0,0,0,0]);

print "\nWylosowana tablica:\n";
$licznik = 0;
for($i=1; $i < 5; ++$i){
	print "\n";
	for($j=1; $j < 5; ++$j){
		if ($tab[$i][$j]==1){ $licznik++;}
		print "$tab[$i][$j]  ";
	}
}
$x=16-$licznik;
print "\n\nPozostalo przy zyciu: $licznik komorek, martwych: $x \n";

for(;;){
	print "\nCzy chcesz zobaczyc kolejna faze zycia? (T/N):";
	$a=<STDIN>;
	
	if(a=='t' || a=='T'){

		@nowa=([0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]);
		
		for($i=1; $i < 5; ++$i){
			for($j=1; $j < 5; ++$j){
				$otoczenie=$tab[$i-1][$j-1]+$tab[$i-1][$j]+$tab[$i-1][$j+1]+$tab[$i][$j-1]+$tab[$i][$j+1]+$tab[$i+1][$j-1]+$tab[$i+1][$j]+$tab[$i+1][$j+1];
				
				if($tab[$i][$j]==0 && $otoczenie==3) {$nowa[$i][$j]=1;}
				if($tab[$i][$j]==0 && $otoczenie!=3) {$nowa[$i][$j]=0;}
				if($tab[$i][$j]==1 && $otoczenie!=2 && $otoczenie!=3) {$nowa[$i][$j]=0;}
				elsif($tab[$i][$j]==1) {$nowa[$i][$j]=1;}
			}
		}
		for($i = 0; $i < 6; ++$i ){
			for($j = 0; $j < 6; ++$j ){
				$tab[$i][$j]=$nowa[$i][$j];
			}
		}
		
		$licznik = 0;
		print "\n";
		for($i=1; $i < 5; ++$i){
			print "\n";
			for($j=1; $j < 5; ++$j){
				if ($tab[$i][$j]==1){ $licznik++;}
					print "$tab[$i][$j]  ";
			}
		}
		$x=16-$licznik;
		print "\n\nPozostalo przy zyciu: $licznik komorek, martwych: $x \n";
	}
	
	else{ last;}
}
print "Koniec gry";


		