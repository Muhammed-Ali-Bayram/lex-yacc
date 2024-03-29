%{ 
   /* Definition section */
  #include<stdio.h> 
  int flag=0; 
%} 
  
%token NAME NUMBER 

%left GE LE EQ NE EE '<' '>'

%left '+' '-'
  
%left '*' '/' '%'
  
%left '(' ')'

%nonassoc UMINUS
/* Rule Section */
%% 
  
ArithmeticExpression: E{ 
  
         printf("Result=%d", $$); 
  
         return 0; 
  
        }; 
 E:E '+' E {$$=$1+$3;} 
  
 |E '-' E {$$=$1-$3;} 
  
 |E '*' E {$$=$1*$3;} 
  
 |E '/' E {$$=$1/$3;} 
  
 |E '%' E {$$=$1%$3;} 
  
 |'(' E ')' {$$=$2;} 
  
 | NUMBER {$$=$1;} 

 |E GE E {$$=$1 >= $3 ;} 

 |E LE E {$$=$1 <= $3 ;}

 |E NE E {$$=$1 != $3 ;} 
 
 |E EE E {$$=$1 == $3 ;} 

 |UMINUS E {$$=-$1 ;}
 ; 
  
%% 
  
//driver code 
int main() 
{ 
   printf("\nAritmetik ifade girin::\n"); 
   yyparse(); 
  // if(flag==0) 
   //printf("\nGeçerli ifade girin\n\n"); 
    //return 0;
} 
  
int yyerror() 
{ 
   printf("\Girilen aritmetik ifade Geçersiz. Sadece sayı ve aritmetik operatör girin. \n\n"); 
   flag=1; 
} 
int yywrap(){
    return 1;
}
