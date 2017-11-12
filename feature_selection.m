function select_data = feature_selection(data, vocabulary)
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
end

