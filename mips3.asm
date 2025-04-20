# === GIVEN C EXAMPLE ====
# int a[20];
# double b[20];
# int c[10] = { 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
# int d[5] = { 42, 42, 42, 42, 42 };
# char e[3] = { 'a', 'b', 'c' };

.data
a: .space 80 # 20 chars x 1 word (4 byes)
b: .space 160 # 20 chars x 1 double (8 bytes)
c: .word 9,8,7,6,5,4,3,2,1,0
d: .word 42 : 5
e: .byte 'a', 'b', 'c'

# turns out space will be initialized to 0