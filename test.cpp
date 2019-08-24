class Solution {
public:
    vector<vector<string>> findLadders(string &start, string &end,
			unordered_set<string> &dict) {
		unordered_map<string, unordered_set<string>> m;
		unordered_set<string> s1 { start }, s2, *cur = &s1, *next = &s2;
		dict.insert(end);
		for (bool flag = 1; flag;) {
			for (auto c : *cur) {
				for (const auto& d : dict) {
					auto diff = 0;
					for (auto i = 0u; i < d.length(); i++)
						if (d[i] != c[i] && ++diff > 1)
							break;
					if (diff == 1) {
						m[d].insert(c);
						next->insert(d);
						if (d == end)
							flag = 0;
					}
				}
			}
			if (flag = flag && !next->empty()) {
				swap(cur, next);
				next->clear();
				for (auto c : *cur)
					dict.erase(c);
			}
		}
		vector<vector<string>> result;
		function<vector<vector<string>>(string)> dfs;
		dfs = [&dfs,&m,&start](string s)->vector<vector<string>> {
			vector<vector<string>> ans;
			if(s==start)return { {start}};
			for(auto i:m[s])
			for(auto d:dfs(i)) {
				ans.push_back(d);
				ans.back().push_back(s);
			}
			return ans;
		};
		return dfs(end);
	}
};
