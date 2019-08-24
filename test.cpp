class Solution {
public:
    /*
     * @param start: a string
     * @param end: a string
     * @param dict: a set of string
     * @return: An integer
     */
    int ladderLength(string &start, string &end, unordered_set<string> &dict) {
        unordered_set<string>starts{start},ends{end};
        auto grow=[&dict](unordered_set<string>& starts,unordered_set<string>& ends,int& times)->bool{
            ++times;
            unordered_set<string> ns;
            for(auto s:starts)
                for(auto&c:s){
                    auto origi=c;
                    for(c='a';c<='z';++c)
                        if(c!=origi)
                            if(ends.count(s))
                                return false;
                            else if(dict.count(s)){
                                ns.insert(s);
                                dict.erase(s);
                            }
                    c=origi;
                }
            starts=ns;
            return true;
        };
        auto i=1;
        while(grow(starts,ends,i)&&grow(ends,starts,i));
        return i;
    }
};
