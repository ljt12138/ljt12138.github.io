#include <bits/stdc++.h>
using namespace std;

static const int MAXN = 1 << 22;
static const long long inf = 1e15;

struct node {
	node *lc, *rc;
	long long value;
	long long tag;
};

static node tree[MAXN << 1];
static int id2pos[MAXN << 1];
static int N, top;
 
// build cache-oblivious segment tree:
// - position (in a common zkw tree) of the root is @id
// - containing array[L, R], @h = log_2(R-L+1)+1 
static void dfs_build(int id, int h)
{
	if (h == 1) {
		int nd = ++top;
		id2pos[id] = nd;
		tree[nd].tag = 0;
	} else {
	    dfs_build(id, h/2);
		int h_sub = h-h/2, step = 1 << (h_sub-1), chlnum = 1 << (h/2);
		int start_id = id << (h/2);
	    for (int cur_id = start_id; cur_id < start_id+chlnum; cur_id++) {
			dfs_build(cur_id, h_sub);
		}
	}
}

void co_zkw_init(const vector<int> &vec)
{
	N = 1;
	top = 0;
	int lgn = 0;
	while (N < vec.size()) {
		N <<= 1;
		lgn++;
	}
	id2pos[0] = 0;
	dfs_build(1, lgn+1);
	for (int i = 0; i < vec.size(); i++)
		tree[id2pos[i+N]].value = vec[i];
	for (int i = vec.size(); i < N; i++)
		tree[id2pos[i+N]].value = -inf;
	for (int i = N-1; i >= 1; i--) {
		node *nd = tree + id2pos[i];
		nd->lc = tree + id2pos[i<<1];
		nd->rc = tree + id2pos[i<<1|1];
		nd->value = max(nd->lc->value,
						nd->rc->value);
	}
}

inline void update(node *nd)
{ nd->value = max(nd->lc->value, nd->rc->value); }

inline void put_tag(node *nd, long long dt)
{
	nd->value += dt;
	nd->tag += dt;
}

inline void push_down(node *nd)
{
	put_tag(nd->lc, nd->tag);
	put_tag(nd->rc, nd->tag);
	nd->tag = 0;
}

static long long query(node *nd, int L, int R, int lpos, int rpos)
{
	if (L == lpos && R == rpos) return nd->value;
	else {
		push_down(nd);
		int mid = (L+R)>>1;
		if (rpos <= mid) return query(nd->lc, L, mid, lpos, rpos);
		else if (lpos > mid) return query(nd->rc, mid+1, R, lpos, rpos);
		else return max(query(nd->lc, L, mid, lpos, mid),
						query(nd->rc, mid+1, R, mid+1, rpos));
	}
}

long long co_zkw_query(int lpos, int rpos)
{
	return query(tree+1, 1, N, lpos, rpos);
}

static void modify(node *nd, int L, int R, int opl, int opr, int dt)
{
    if (L == opl && R == opr) put_tag(nd, dt);
	else {
		push_down(nd);
		int mid = (L+R)>>1;
		if (opr <= mid) modify(nd->lc, L, mid, opl, opr, dt);
		else if (opl > mid) modify(nd->rc, mid+1, R, opl, opr, dt);
	    else {
			modify(nd->lc, L, mid, opl, mid, dt);
			modify(nd->rc, mid+1, R, mid+1, opr, dt);
		}
		update(nd);
	}
}

void co_zkw_update(int opl, int opr, int dt)
{
	modify(tree+1, 1, N, opl, opr, dt);
}

