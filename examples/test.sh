echo '1 chunk'
time ./bitFold.out -nproc 1 10000 25 1 
time ./bitFold.out -nproc 2 10000 25 1 
time ./bitFold.out -nproc 3 10000 25 1
time ./bitFold.out -nproc 4 10000 25 1
echo '2 chunks'
time ./bitFold.out -nproc 1 10000 25 2
time ./bitFold.out -nproc 2 10000 25 2 
time ./bitFold.out -nproc 3 10000 25 2
time ./bitFold.out -nproc 4 10000 25 2
echo '3 chunks'
time ./bitFold.out -nproc 1 10000 25 3
time ./bitFold.out -nproc 2 10000 25 3 
time ./bitFold.out -nproc 3 10000 25 3
time ./bitFold.out -nproc 4 10000 25 3
echo '4 chunks'
time ./bitFold.out -nproc 1 10000 25 4
time ./bitFold.out -nproc 2 10000 25 4 
time ./bitFold.out -nproc 3 10000 25 4
time ./bitFold.out -nproc 4 10000 25 4

