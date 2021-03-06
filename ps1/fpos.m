str = input('Input the function: ','s');

str = strcat('@(x)',str);
f = str2func(str);
prompt = 'Enter the min:';
min = input(prompt);
prompt = 'Enter the max:';
max = input(prompt);
re = input('Convergence criterion:\n1.Relative Error: \n');
fe = input('2.Functional Error: \n');
loops = input('3.Number of iterations: \n');
iterate = [];
error = [];
i = 0;
m = min-((max-min)/(f(max)-f(min)))*f(min);
while (abs((max-min)/min)>re)&&(abs(f(m))>fe)&&(loops>0)
        m = min-((max-min)/(f(max)-f(min)))*f(min);
        if f(m)==0
            break;
        elseif f(m)*f(min)<0
            max = m;
        elseif f(m)*f(max)<0
            min = m;
        end
        loops = loops-1;
        i = i+1;
        iterate = [iterate,i];
        error = [error,(max-min)/min];
end
disp(m);
if abs((max-min)/min)>re
    disp('Stopped due to error condition');
elseif loops==0
    disp('Stopped due to iteration limit');
end
subplot(1,2,1);
gmin = m-2;
gmax = m+2;
r = linspace(gmin,gmax,(gmax-gmin)*100);
y = arrayfun(f,r);
plot(r,y);
title('Function Plot');
ax = [gmin gmax];
ay = [0 0];
hold on
axis manual
plot(ax,ay);
hold off
subplot(1,2,2);
plot(iterate,error);
title('Error Plot');
hold on
axis manual
plot(iterate,zeros(i));
hold off