#include <bits/stdc++.h>

#define fi first
#define se second
#define forn(i,n) for(int i=0; i< (int)n; ++i)
#define for1(i,n) for(int i=1; i<= (int)n; ++i)
#define fore(i,l,r) for(int i=(int)l; i<= (int)r; ++i)
#define ford(i,n) for(int i=(int)(n) - 1; i>= 0; --i)
#define fored(i,l,r) for(int i=(int)r; i>= (int)l; --i)
#define pb push_back
#define el '\n'
#define d(x) cout<< #x<< " " << x<<el

using namespace std;

typedef long long ll;
typedef pair<int,int> ii;
typedef pair<char,int> pci;
typedef tuple<int, int, int> tiii;
typedef pair<ll,ll> pll;
typedef vector<int> vi;
const ll INF = LONG_LONG_MAX;
int choco[int(1<<15)];
int dp[100][int(1<<15)];

int go(int w, int h, int S){
    if(h<0) return dp[w][S]=0;
    if(__builtin_popcount(S)==1){
        return dp[w][S]=1;
    }
    int &r = dp[w][S];
    if(r!=-1) return r;
    for(int subset= S; subset; subset= (subset-1) & S){
        r=0;
        int com= S ^ subset;
        int cS = choco[subset], cCom=choco[com];
        if(cS%w==0&&cCom%w==0){
            int k = cS/w;
            r=(go(w,k,subset)&&go(w,h-k,com));
            if(r) return r;
        } else if(cS%h==0&&cCom%h==0){
            int k = cS/h;
            r=(go(h,k,subset)&&go(h,w-k,com));
            if(r) return r;
        }
    }
    return r;

}

int main(){
    int n, cases=0;
    while(cin>> n){
        if(n==0) return 0;
        cases++;
        int w, h;
        cin>> w>> h;
        memset(choco,0,sizeof choco);
        memset(dp, -1, sizeof dp);
        forn(i,n) cin>> choco[int(1<<i)];
        for(int i= 0; i<(1<<n) ; ++i){
            int c= choco[i];
            for(int j=0; j<n && !c; j++){
                if(i & (1<<j) ){
                    choco[i]+= choco[(1<<j)];
                }
            }
        }
        if(go(w,h,(1<<n)-1)) cout<<"Yes"<<el;
        else cout<<"No"<<el;
    }
}
