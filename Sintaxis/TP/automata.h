automata(char * texto)
{
	static Tabla[20][17][1] = {
								{3,-1},{1,-1},{1,-1},{18,19},{18,19},{18,19}{18,19}{18,19}{18,19},{14,-1},{-1,-1}
							  };

	int i = 0;
	while(texto[i]!=fdt){
		if(isDigit(texto[i]) || texto[i]=='.')
			i = automataEyR(texto,i);
		if(isAlpha(texto[i]) || texto[i]=='_')
		{
			i=automataI(texto,i);
		}else{
			printf("%cOtro\n",texto[i]);
			i++;
		}

	}
}

automataEyR(char * texto,int i){
	int j = 0;
	char buffer[100+1];
	  //int i = 0, j = 0;
	  char fdt= ‘\0’;
	  //estadoActual = 0;
	  while (texto[j] != fdt) {
	    estadoActual = Tabla[estadoActual][Columna(texto[j])];
	   
	    switch (estadoActual) {
		    case 9: buffer[j++] = texto[i];
			case 8: buffer[j] = “\0”; printf(“%s Constante Entera\n”,buffer); j=0; break;
			case 17: buffer[j++] = texto[i];
			case 16: buffer[j] = “\0”; printf(“%s Constante Real\n”,buffer); j=0; break;

	      default: buffer[j++] = texto[i];
	    }
	    j++;	
	  }
	  if (texto[j] == fdt) return 1;
	  return 0;  
	} 

}

int Columna (char x)  {
  if(x=='0') return 0;
  if (x>='1' && x<='7') return 1; 
  if (x>='8' && x<='9') return 2;
  if (x>='a' && x<='d') return 8;
  if (x>='A' && x<='D') return 8;
  if (x=='.') return 9;
  if (x=='\-' || x<='\+') return 10;
  if (x=='_') return 11;
  if (x>='g' && x<='k') return 12;
  if (x>='G' && x<='K') return 12;
  if (x>='m' && x<='t') return 13;
  if (x>='M' && x<='T') return 13;
  if (x>='v' && x<='w') return 14;
  if (x>='V' && x<='W') return 14;
  if (x>='y' && x<='z') return 15;
  if (x>='Y' && x<='Z') return 15;
  switch(x)  {
    case 'x': case 'X': return 3; break;
    case 'u': case 'U': return 4; break;
    case 'l': case 'L': return 5; break;
    case 'e': case 'E': return 6; break;
    case 'f': case 'F': return 7; break;
    case ';': case ',': case '(': case ')': return 16; break;
    default: return 17; break;
  }
} 
