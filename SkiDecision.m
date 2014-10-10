order = [25 50 75];
revenue = order*75;
sold = [30 40 50 60];
for i = 1:3
    for j = 1:4
        if order(i) < sold(j)
            loss(j)= (sold(j)-order(i))*5;
        elseif order(i) > sold(j)
            rev(j) = (order(i)-sold(j))*25;
        end
    end
end
loss, rev