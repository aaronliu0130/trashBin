void mul(int c[], int a[], int b[])//Size at array[0],array[1]is the ones digit, array[2] is the tens digit, array[3] is the hundreds digit etc.
{
	int la = a[0], lb = b[0];
	int l = la + lb - 1;
	
	for (int i = 1; i <= la; i++)
		for (int j = 1; j <= lb; j++)
		{
			c[i+j-1] += a[i] * b[j];
			c[i+j] += c[i+j-1]/10;
			c[i+j-1] %= 10;
		}
	while(c[l+1] > 0)
	{
		l++;
		c[l+1] += c[l] / 10;
		c[l] %= 10;
	}
	c[0] = l;
}
void add(int c[], int a[])
{
	int l = c[0], la = a[0];
	if (la > l) l = la;
	for (int i = 1; i <= l; i++)
	{
		c[i] += a[i];
		c[i+1] += c[i] / 10;
		c[i] %= 10;
	}
	while(c[l+1] > 0)
	{
		l++;
		c[l+1] += c[l] / 10;
		c[l] %= 10;
	}
	c[0] = l;
}
void print(int a[]){
    for (int i = a[0]; i >= 1; i--)
        printf("%d", f[i]);
}
