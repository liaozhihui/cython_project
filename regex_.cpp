##include "test_regex.h"

string find_keyword(string pattern,string sentence){
    regex p(pattern);
    smatch m;
    bool found = regex_search(sentence,m,p);

    if(found){
        return m.str(0);
    }
    else{
        return "null";
    }

}