#include<stdio.h>
#include<unistd.h>
int main(int argc, char *argv[])
{
	printf("Inicio ..%s ",argv[0]);
	
	sleep(20);
	printf("Terminando.....");
	return 0;
}
