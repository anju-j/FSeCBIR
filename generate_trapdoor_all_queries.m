function trapdoor=generate_trapdoor_all_queries(query_set,dataset,M1,M2,S)  % Trapdoor Generation for all queries in the query set
   trapdoor=struct([]);
   query_len=size(query_set,2);
   gamma=randi([1 100],query_len,1);        %   A positive random number chosen for each query for randomness in trapdoor
    for i=1: query_len
        query=query_set(1,i);
        query_feature=dataset(query,:);
        M1_inv=inv(M1);                     %   Inverse of M1
        M2_inv=inv(M2);                     %   Inverse of M2
        [M1_fqa,M2_fqb]=trapdoor_gen(query_feature',M1_inv,M2_inv,S,gamma(i,1));    %   Generate trapdoor per query vector using Query encryption in ASPE
        trapdoor(i).M1_fqa=M1_fqa;          %   Encrypted query vector is the trapdoor
        trapdoor(i).M2_fqb=M2_fqb;
    end
end
