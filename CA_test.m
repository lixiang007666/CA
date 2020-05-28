n = 300;     %元胞矩阵大小
Plight = .000005; Pgrowth = .01;
UL = [n 1:n-1];
DR = [2:n 1];
veg = zeros(n,n);        %初始化
% The value of veg:
% empty == 0  
% burning == 1
% green == 2
imh = image(cat(3,veg,veg,veg));
for i = 1:3000
    sum = (veg(UL,:) == 1) + (veg(:,UL) == 1) + (veg(DR,:) == 1) + (veg(:,DR) == 1);
    %根据规则更新森林矩阵：树 = 树 - 着火的树 + 新生的树
    veg = 2 * (veg == 2) - ( (veg == 2) & (sum > 0 | (rand(n,n) < Plight)) ) + 2 * ( (veg == 0) & rand(n,n) < Pgrowth);
    set(imh, 'cdata', cat(3, (veg == 1), (veg == 2), zeros(n)) )
    drawnow
    pause(0.01)
end