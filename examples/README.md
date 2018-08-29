# Examples

This directory includes the following example LVars programs:

## Simple Integer/Double Examples

+ `counter.xc` (integer counter)
+ `int.xc` (single-write integers)
+ `double.xc` (single-write doubles)
+ `unpredictable_scheduling.xc` (puts and gets may occur in different orders)

## Interesting Lattice Data Structures

+ `and.xc` (boolean and operation)
+ `colors.xc` (mixing paint colors)
+ `customers.xc` (customer-product database)
    + makeStoreFiles.py (builds example data)
    + store1.csv, store2.csv, store3.csv, store4.csv (example store data)
+ `intpair.xc` (a pair of single-write integers)
+ `pizza.xc` (votes for pizza)	

## Map-Folds

+ `sum.xc` (taking the sum of all integers in an array)
+ `product.xc` (taking the product of all integers in an array)
+ `cilk_fold.xc` (using cilk to map-fold over an array of integers)
+ `pthreads_fold.xc` (using pthreads to map-fold over an array of integers)
+ `run_fold.xc` (using the run extension to map-fold over an array of integers)

