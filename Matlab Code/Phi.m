function X = Phi(x,R,dim)

    %The centers
c1=linspace(x{1}(1),x{1}(end),R);
c2=linspace(x{2}(1),x{2}(end),R);

    %The rays
b1 = 2*abs(c1(2)-c1(1));
b2 = 2*abs(c2(2)-c2(1));


b=0;%x1 coordinate 
n=0;%number of columns

for i=1:R 
       for j=1:R 
            n=n+1;
            a=0; %x2 coordinate
            for k=1:dim
              if (mod(k-1,sqrt(dim)) == 0) 
                    a = a +1;
              end
              if b >= sqrt(dim)
                   b=0;
              end
                b = b + 1;
                X(k,n)=exp(-((x{1}(b)-c1(j))/b1)^2-((x{2}(a)-c2(i))/b2)^2);
            end
       end
end

end
