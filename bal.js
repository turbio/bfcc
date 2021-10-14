const fs = require('fs');
console.log(fs.readFileSync('aaaaaaa.bf', 'utf8')
	.split('')
	.filter(c => c == '[' || c == ']')
	.map(c => c == '[' ? 1 : -1)
	.reduce((s,c) => s+c))
