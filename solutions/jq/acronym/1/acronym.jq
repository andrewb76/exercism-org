[.phrase | gsub("-"; " ") | gsub("'"; "") | gsub("[^a-zA-Z]"; " ") | scan("[a-zA-Z]+")] |map(.[0:1]) | join("") | ascii_upcase
