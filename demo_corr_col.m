% This file contains a simply Matlab script that demonstrates the
% speed benefits of using corr_coll vs diag(corr(a,b)) or corr within a loop
%
% The most up to date version of this code can be found at:
% https://github.com/slayton/matlab-corr-col
%
% Copyright(c) 2012, Stuart P. Layton <stuart.layton@gmail.com> MIT
% http://stuartlayton.com


A = rand(100, 5000);
B = rand(100, 5000);


% Compute the column correlations
% fast corr_col
tic;
C1 = corr_col(A,B);
t1 = toc;

% diag(corr( ) )
tic;
C2 = diag(corr(A,B));
t2 = toc;

% compute column by column using a loop
tic;
C3 = zeros(size(A,1),1);
for i = 1:size(A,2);
    C3(i) = corr(A(:,i), B(:,i));
end
t3 = toc;


fprintf('\nExecution speed:\n');

fprintf('  col_corr:  %4.4f seconds\n', t1);
fprintf('  diag+corr: %4.4f seconds\n', t2);
fprintf('  loop+corr: %4.4f seconds\n', t3);

fprintf('\nDifference between results:\n');
fprintf(' col_corr  vs diag+corr: %4.4fe-12\n', sum( abs( C1' - C2) ) *1e12 );
fprintf(' loop+corr vs diag+corr: %4.4fe-12\n', sum( abs( C3  - C2) ) *1e12 );

