function [x] = normalisasi
    Data  = xlsread('Data Fix.xlsx','A2:M11163');
    
    min_data = min(Data(:,1:end-1));
    max_data= max(Data(:,1:end-1));
    
    % normalisasi data
    for i=1:length(Data(:,1))
        for j=1:length(Data(1,:))
            x(i,j) = (Data(i,j) - min_data)/( max_data - min_data);
        end
    end
end