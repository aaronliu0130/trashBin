	vector<vector<int>> permute(vector<int> &nums) {
		int s = nums.size();
		if (s < 1)
			return { {}};
		vector<int> states(s, 0);
		vector<bool> used(s + 1, 0);
		vector<vector<int>> ans;
		sort(nums.begin(), nums.end());
		nums.insert(nums.begin(), INT_MIN);
		for (int i = 0; i >= 0;) {
			auto prev = states[i];
			auto flag = 0;
			for (used[prev] = 0; !flag && ++states[i] <= s;
					flag = !used[states[i]] && nums[states[i]] != nums[prev])
				;
			if (flag) {
				used[states[i]] = 1;
				++i;
				if (i >= s) {
					vector<int> a(s);
					for (int j = 0; j < s; ++j)
						a[j] = nums[states[j]];
					ans.push_back(a);
					--i;
				} else
					states[i] = 0;
			} else
				--i;
		}
		return ans;
	}
