#include<stdio.h>
#include<conio.h>
 
void main()
{
    int matrix[10][10];
    int i,j,row,column,sum=0;
    printf("Enter the number of rows and columns number: \n");
    scanf("%d%d",&row,&column);
    printf("Enter the elements in matrix: \n");
    for(i=0;i<row;i++)
    {
        for(j=0;j<column;j++)
        {
            scanf("%d",&matrix[i][j]);
        }
    }
 
    printf("The matrix is: \n");
    for(i=0;i<row;i++)
    {
        for(j=0;j<column;j++)
        {
            printf("%d \t",matrix[i][j]);
        }
        printf("\n");
    }
    //To add diagonal elements
    for(i=0;i<row;i++)
    {
        for(j=0;j<column;j++)
        {
            if(i == j)
            {
                sum=sum+matrix[i][j];
            }
        }
    }
 
    printf("The sum of diagonal elements of a square matrix = %d\n",sum);
getch();
}