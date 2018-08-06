echo '1 chunk'
time ./bitFold.out 100000 25 1 -nproc 1
time ./bitFold.out 100000 25 1 -nproc 2
time ./bitFold.out 100000 25 1 -nproc 3
time ./bitFold.out 100000 25 1 -nproc 4
echo '2 chunks'
time ./bitFold.out 100000 25 2 -nproc 1
time ./bitFold.out 100000 25 2 -nproc 2
time ./bitFold.out 100000 25 2 -nproc 3
time ./bitFold.out 100000 25 2 -nproc 4
echo '3 chunks'
time ./bitFold.out 100000 25 3 -nproc 1
time ./bitFold.out 100000 25 3 -nproc 2
time ./bitFold.out 100000 25 3 -nproc 3
time ./bitFold.out 100000 25 3 -nproc 4
echo '4 chunks'
time ./bitFold.out 100000 25 4 -nproc 1
time ./bitFold.out 100000 25 4 -nproc 2
time ./bitFold.out 100000 25 4 -nproc 3
time ./bitFold.out 100000 25 4 -nproc 4
