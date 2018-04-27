# CyrptoSystem
Project	7
Build	a	Crypto	System
1. Your	system	will	consist	of:
• The	Diffie-Hillman	protocol	to	exchange	a	key
• sDES	to	encrypt	a	message	using	the	key	exchanged	through Diffie-Hellman
• The	El	Gamal	digital	signature	scheme	to	sign	the	message
• A	cipher	block	chaining	function	to	encrypt	blocks	of	text
2. Every	group	will	have	a	github	account	where its	prime,	P,	and	its	primitive	root	a	mod	P
are	posted.		Call	this	the	El	Gamal	key
3. Groups	will	be	named,	prosaically,	0,	1,	2,	…,	9
4. I	will	give	a	short	text	message, m,		to	group	0
5. for	i	in	range(10):
a. group	i will	exchange	a	key	with	group	i +	1 mod	10,	using	the	Diffie-Hellman	
protocol
b. group	i	will	encrypt	m with	the	key
c. group	i	will	sign	the	message	with	its	El	Gamal private	key
d. group	i	will	email	the	message	to	group	i +	1 mod	10
e. group	i	+	1	mod	10	will	download	the	El	Gamal	public	key	from	group	i
f. group	i	+	1 mod	10	 will	decrypt	the	message	with	the	Diffie-Hellman	key	and	
verify	that	it	comes	from	group	i with	the	El	Gamal	public	key
6. Group	0	will	give	the	plain	text	message,	m,	to	me.	
7. Each	group	will	make	a	15	minute	appointment	to	see	me	and	demonstrate	its	system.		
The	system	must	be	written	in	saga	with	clearly	defined	functions	for	key	generation,	
encryption,	decryption,	signing,	and	verifying.
8. The	encryption	process	will	take	place	on	4/30 and	5/1.		This	means	that	everyone’s	
work	must	be	completed	by	4/29.	
