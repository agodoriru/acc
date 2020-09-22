#!/bin/bash
assert() {
	expected="$1"
	input="$2"
	
	./acc "$input" > tmp.s
	cc -o tmp tmp.s
	./tmp
	actual="$?"
	
	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected expected, but got $actual"
		echo NG
		exit 1
	fi
}

assert 0 0
assert 20 20
assert 30 '15+20-5'
assert 5 '1-6+10'

echo OK
