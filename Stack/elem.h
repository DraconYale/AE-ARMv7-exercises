typedef struct __elemento {
int info;
struct __elemento * next;
} ELEM;
extern void push(int, ELEM**);
extern int isEmpty(ELEM**);
extern int pop(ELEM**);
