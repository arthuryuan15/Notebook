class Solution {
public:
		
		bool check(char c){
				if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') return true;
				return false;
		}

    vector<int> vowelStrings(vector<string>& w, vector<vector<int>>& q) {
    	
	    int n = w.size(),m = q.size();

	    int s[n + 1];
	    
	    for(int i = 0; i < n; i++){
		string str = w[i];
		if(check(str[0]) && check(str[str.size() - 1]){
			s[i + 1] += 1;
		}
		
		for(int i = 1; i <= n; i++) s[i] += s[i - 1];
		
		vector<int> res;
		for(int i = 0; i < m; i++){
				auto t = q[i];
				res[i] = s[t[1]] - s[t[0]];	
		}
		
		return res;

    }
};
