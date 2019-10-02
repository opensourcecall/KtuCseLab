#include<stdio.h>
#define MAX 50
int s[MAX],top = -1;

void push(int );
void pop();
void status();
void palindrome();

int main(){

    int n,ele;

    do{

        printf("    MENU\n\n");
        printf("OPTION        OPERATION\n1.         PUSH AN ELEMENT ON THE STACK\n2.        POP AN ELEMENT FROM THE STACK\n3.        CHECK FOR PALINDRO\n4.        CHECK OVERFLOW OR UNDERFLOW\n5.        STATUS\n6.        EXIT\n\nYOUR CHOICE:");
        scanf("%d",&n);

        switch(n){

            case 1:

                printf("Enter element: ");
                scanf("%d",&ele);
                push(ele);
                break;

            case 2:

                pop();
                break;

            case 3:
                printf("Number: ");
                scanf("%d",&ele);
                palindrome(ele);
                break;

            // case 4:

            //     flow();
            //     break;

            case 5:

                status();
                break;
        }
    }while(n != 6);
}

void push(int ele){

    if(top < (MAX-1)){
        top++;
        s[top] = ele;
        printf("\n\nElement added\n\n");
        }
    else{
        printf("\n\nError!\nStack overflow\n\n");
    }
}
void pop(){
    if(top != -1){
        printf("\n\nPOPED\nElement: %d\nPosition: %d\n\n",s[top],top);
        top--;
    }
    else{
        printf("\n\nError!\nStack underflow\n\n");
    }
}
void status(){

    int i;

    if(top == -1)
        printf("\n\nStack empty\n\n");
    else if(top == (MAX-1))
        printf("\n\nStack full\n\n");

    for(i = 0; i<=top;i++){
        printf("%d\n",s[i]);
    }

}
void palindrome(int ele){

    int n = ele, reversedInteger = 0,c=0,i;
    top = 0;
    while( n !=0 )
    {

        s[top] = n%10;
        reversedInteger = reversedInteger*10 + s[top];
        n /= 10;
        // printf("\n%d    top = %d",s[top],top);
        top++;
    }

    n=reversedInteger;

    for(i = 0; i<= top;i++){

        if(n%10 == s[i]){

            c++;
            n = n/10;

        }
    }
    // printf("\n%d\n%d",c,top);
    if(c-1 == top)
        printf("\n\nThe number is palindrome\n\n");
    else
        printf("\n\nNot a palindrome number\n\n");
    top = -1;

}
