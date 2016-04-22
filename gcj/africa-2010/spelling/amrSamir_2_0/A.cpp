/*
TASK: A
LANG: C++
*/
#include <vector>
#include <valarray>
#include <list>
#include <map>
#include <set>
#include <queue>
#include <deque>
#include <stack>
#include <algorithm>
#include <sstream>
#include <bitset>
#include <functional>
#include <numeric>
#include <utility>
#include <sstream>
#include <iostream>
#include <cstring>
#include <iomanip>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <complex>
using namespace std;
typedef long long ll;
typedef long double ld;
#define sz(x) ((int)(x).size())


int main()
{
	freopen("C-small-attempt0.in","rt",stdin);
	freopen("C.out","wt",stdout);
	map<char,int> m;
	m['a']=2;
	m['b']=22;
	m['c']=222;
	m['d']=3;
	m['e']=33;
	m['f']=333;
	m['g']=4;
	m['h']=44;
	m['i']=444;
	m['j']=5;
	m['k']=55;
	m['l']=555;
	m['m']=6;
	m['n']=66;
	m['o']=666;
	m['p']=7;
	m['q']=77;
	m['r']=777;m['s']=7777;
	m['t']=8;
	m['u']=88;
	m['v']=888;
	m['w']=9;
	m['x']=99;
	m['y']=999;
	m['z']=9999;
	m[' '] = 0;
	int N;
	string d;
	scanf("%d",&N);
	getline(cin,d);
	for (int ii = 0; ii < N; ++ii) {
//		int n, c;
//		scanf("%d",&c);
//		scanf("%d",&n);
//		int arr[2010];
		printf("Case #%d: ",ii+1);
//		for (int i = 0; i < n; ++i) {
//			scanf("%d",arr+i);
//			for (int j = 0; j < i; ++j) {
//				if( arr[i]+arr[j] == c )
//					printf("%d %d\n",j+1,i+1);
//			}
//		}
//		string s,tt;
//		getline(cin,s);
//		stringstream ss(s);
//		vector <string> r;
//		while(ss>>tt)
//			r.push_back(tt);
//		reverse(r.begin(),r.end());
//		for (int i = 0; i < r.size(); ++i) {
//			if( i )
//				printf(" ");
//			printf("%s",r[i].c_str());
//		}
//		printf("\n");
		string  s;
		getline(cin,s);
		int prev = -1;
		for (int i = 0; i < s.size(); ++i) {
			if( m[s[i]]%10 == prev )
				printf(" ");
			prev = m[s[i]]%10;
			printf("%d",m[s[i]]);
		}
		printf("\n");
	}
	return 0;
}
