#include <bits/stdc++.h>
using namespace std;

extern void co_zkw_init(const vector<int> &vec);
extern long long co_zkw_query(int lpos, int rpos);
extern void co_zkw_update(int opl, int opr, int dt);
extern void baseline_init(const vector<int> &vec);
extern long long baseline_query(int lpos, int rpos);
extern void baseline_update(int opl, int opr, int dt);

vector<long long> ans_baseline, ans_co_zkw;
int topx, topy;

vector<int> val;

struct query {
	int type; // 0 for update, 1 for query
	int a1, a2, a3;
};

vector<query> q;

void init(int N, int M)
{
	val.resize(N);
	q.resize(M);
	ans_baseline.resize(M);
	ans_co_zkw.resize(M);
	topx = topy = 0;
}

void gen(int N, int M)
{
	srand(time(0));
	for (int i = 0; i < N; i++) {
		val[i] = rand()%N+1;
		// cout << val[i] << " ";
	}
	// cout << endl;
	for (int i = 0; i < M; i++) {
		query qy;
		qy.type = rand()%2;
		if (qy.type == 0) {
			qy.a1 = rand()%N+1;
			qy.a2 = rand()%N+1;
			if (qy.a1 > qy.a2)
				swap(qy.a1, qy.a2);
			qy.a3 = rand()%N+1;
		} else {
			qy.a1 = rand()%N+1;
			qy.a2 = rand()%N+1;
			if (qy.a1 > qy.a2)
				swap(qy.a1, qy.a2);
		}
		// cout << qy.type << " " << qy.a1 << " " << qy.a2 << " " << qy.a3 << endl;
		q[i] = qy;
	}
}

void test_baseline()
{
	cout << "Testing baseline......" << endl;
	clock_t c1 = clock();
	baseline_init(val);
    clock_t c2 = clock();
	for (int i = 0; i < q.size(); i++) {
		query qy = q[i];
		if (q[i].type == 0) {
			baseline_update(qy.a1, qy.a2, qy.a3);
		} else {
			ans_baseline[topx++] = baseline_query(qy.a1, qy.a2);
		}
	}
	clock_t c3 = clock();
	cout << "Init Time : " << 1.0*(c2-c1)/CLOCKS_PER_SEC << endl;
	cout << "Query Time : " << 1.0*(c3-c2)/CLOCKS_PER_SEC << endl;
	cout << "Total Time : " << 1.0*(c3-c1)/CLOCKS_PER_SEC << endl;
}

void test_co_zkw()
{
	cout << "Testing co_zkw......" << endl;
	clock_t c1 = clock();
	co_zkw_init(val);
    clock_t c2 = clock();
	for (int i = 0; i < q.size(); i++) {
		query qy = q[i];
		if (q[i].type == 0) {
			co_zkw_update(qy.a1, qy.a2, qy.a3);
		} else {
			ans_co_zkw[topy++] = co_zkw_query(qy.a1, qy.a2);
		}
	}
	clock_t c3 = clock();
	cout << "Init Time : " << 1.0*(c2-c1)/CLOCKS_PER_SEC << endl;
	cout << "Query Time : " << 1.0*(c3-c2)/CLOCKS_PER_SEC << endl;
	cout << "Total Time : " << 1.0*(c3-c1)/CLOCKS_PER_SEC << endl;

}

void check()
{
	assert(topx == topy);
	for (int i = 0; i < topx; i++)
		if (ans_baseline[i] != ans_co_zkw[i]) {
			cout << "WA on query " << i
				 << ", get " << ans_co_zkw[i]
				 << ", expected " << ans_baseline[i] << endl;
			return;
		}
	cout << "AC" << endl;
}

int main(int argc, char **argv)
{
	assert(argc == 3);
	int N = atoi(argv[1]), M = atoi(argv[2]);
	init(N, M);
	gen(N, M);
	test_baseline();
	test_co_zkw();
	check();
	return 0;
}
