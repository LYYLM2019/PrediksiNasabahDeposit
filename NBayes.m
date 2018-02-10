function [predict] = NBayes(x)
    Data  = xlsread('Data Fix.xlsx','N2:N7814');
    data_train = x(1:7813,1:end-1);
    data_test =  x(7814:11162,1:end-1);
    kelas = [1 0];
    
    % nilai prior (masalah ada di prior)
    prob_yes = (histc(Data(:,1), 1))/(length(Data(:,1))); 
    prob_no = (histc(Data(:,1), 0))/(length(Data(:,1)));
    prob = [prob_yes, prob_no];
    
    % nilai likelihood
    for i=1:length(kelas(1,:))
        mn(i,:) = mean(data_train(Data == kelas(1,i),:));
        st_dev(i,:) = std(data_train(Data == kelas(1,i),:));
    end
    
    % nilai posterior
    for i=1:length(data_test(:,1))
        for j=1:2
            likelihood = normpdf(data_test(i,:), mn(j,:), st_dev(j,:));
            posterior(i,j) = prod(likelihood)*prob(j);
        end
        if posterior(i,1) > posterior(i,2)
            target(i,1) = 1;
        elseif posterior(i,1) < posterior(i,2)
            target(i,1) = 0;
        end
    end
    [predict] = target;
end