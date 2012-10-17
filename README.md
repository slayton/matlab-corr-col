matlab-corr-col
===============

Quickly compute a the column by column correlation between large matrices.

![](https://raw.github.com/slayton/matlab-corr-col/master/example.png)

## Usage Example
Create two large matrices
```matlab
A = rand(100, 5000);
B = rand(100, 5000);
```
Meausre the time required to compute the column by column correlation using:
##### corr_col
```matlab
tic;
C1 = corr_col(A,B);
t1 = toc;
```
##### diag + corr
```matlab
tic;
C2 = diag(corr(A,B));
t2 = toc;
```
##### loop + corr
```matlab
tic;
C3 = zeros(size(A,1),1);
for i = 1:size(A,2);
    C3(i) = corr(A(:,i), B(:,i));
end
t3 = toc;
```

### Results
```text
Results:
  col_corr:  0.0080 seconds
  diag+corr: 0.1953 seconds
  loop+corr: 1.0560 seconds
Difference between results:
  col_corr  vs diag+corr: 0.1747e-12
  loop+corr vs diag+corr: 0.1397e-12
```