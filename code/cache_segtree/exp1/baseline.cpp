#include <bits/stdc++.h>
using namespace std;

static const int MAXN = 1 << 22;

static long long tree[MAXN<<2];
static long long tag[MAXN<<2];

#define lc (nd<<1)
#define rc (nd<<1|1)

static int N;

inline void update(int nd)
{
	tree[nd] = max(tree[lc], tree[rc]);
}

inline void put_tag(int nd, long long dt)
{
	tree[nd] += dt;
	tag[nd] += dt;
}

inline void push_down(int nd)
{
	put_tag(lc, tag[nd]);
	put_tag(rc, tag[nd]);
	tag[nd] = 0;
}

void dfs_build(int nd, int L, int R, const vector<int> &vec)
{
	tag[nd] = 0;
	if (L == R) tree[nd] = vec[L-1];
	else {
		int mid = (L+R)>>1;
		dfs_build(lc, L, mid, vec);
		dfs_build(rc, mid+1, R, vec);
		update(nd);
	}
}

void baseline_init(const vector<int> &vec)
{
	N = vec.size();
	dfs_build(1, 1, N, vec);
}

static long long query(int nd, int L, int R, int opl, int opr)
{
	if (L == opl && R == opr) return tree[nd];
	else {
		push_down(nd);
		int mid = (L+R)>>1;
		if (opr <= mid) return query(lc, L, mid, opl, opr);
		else if (opl > mid) return query(rc, mid+1, R, opl, opr);
		else return max(query(lc, L, mid, opl, mid),
						query(rc, mid+1, R, mid+1, opr));
	}
}

static void modify(int nd, int L, int R, int opl, int opr, int dt)
{
	if (L == opl && R == opr) put_tag(nd, dt);
	else {
		push_down(nd);
		int mid = (L+R)>>1;
		if (opr <= mid) modify(lc, L, mid, opl, opr, dt);
		else if (opl > mid) modify(rc, mid+1, R, opl, opr, dt);
		else {
			modify(lc, L, mid, opl, mid, dt);
			modify(rc, mid+1, R, mid+1, opr, dt);
		}
		update(nd);
	}
}

long long baseline_query(int lpos, int rpos)
{
	return query(1, 1, N, lpos, rpos);
}

void baseline_update(int lpos, int rpos, int dt)
{
	modify(1, 1, N, lpos, rpos, dt);
}

