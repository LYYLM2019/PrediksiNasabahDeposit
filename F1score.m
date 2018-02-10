function [F1] = F1score(predict)
    x  = xlsread('Data Fix.xlsx','A2:N11163');
    f1(:,1) = x(7814:11162,end); 
    f1(:,2) = predict(:,end);
    TN = 1; TP = 1; FN = 1; FP = 1;
    n = 0;
    for i=1:length(f1(:,1))
        if f1(i,1) == f1(i,2)
            n = n+1;
        end
        if f1(i,1) == 0 && f1(i,2) == 0
            TN = TN+1;
        elseif f1(i,1) == 0 && f1(i,2) == 1
            FP = FP+1;
        elseif f1(i,1) == 1 && f1(i,2) == 0
            FN = FN+1;
        elseif f1(i,1) == 0 && f1(i,2) == 0
            TP = TP + 1;
        end
    end
    TN
    FP
    akurasi = (n/3348)*100
    [F1] = f1;
end