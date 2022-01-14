unsigned int fibo(unsigned int n)
{
    if (n < 2) {
        return n;
    }
    else {
        int x1 = 0;
        int x2 = 1;
        for (int i=2; i<=n; i++) {
            int tmp = x2;
            x2 = x1 + x2;
            x1 = tmp;
        }
        return x2;
    }
}
