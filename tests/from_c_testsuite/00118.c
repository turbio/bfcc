// TEST:{"func":"main","output":""}
int
main()
{
	struct { int x; } s = { 0 };
	return s.x;
}
