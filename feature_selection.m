function select_data = feature_selection(data, vocabulary)
    %% remove digits from vocabulary
    num = regexp(vocabulary,'\d');
    idx = find(~cellfun('isempty',num));
    vocabulary(:,idx) = [];
    data(:,idx) = [];
    
    %% stemmer
    feature = strings(1,size(vocabulary,2));
    for i = 1:size(vocabulary,2)
        temp = char(vocabulary(i));
        stem = porterStemmer(temp);
        feature(i) = stem;
    end
    [C,ia,ic] = unique(feature,'stable');
    duplicate = C(histc(ic,1:size(data,2))>1);
    select_data = data(:,ia);
    for j = 1: size(duplicate,2)
        index = find(feature == duplicate(j));
        temp = sum(data(:,index),2);
        select_data(:,ic(index(1))) = temp;
    end
    
    %% remove the words which appears no more than once
    select_data(:,find(sum(select_data,1)<=1)) = [];
end
