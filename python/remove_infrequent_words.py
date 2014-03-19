#! /usr/bin/env python
# preserve max_tokens most frequent words
import sys

if len(sys.argv) != 3:
	print 'Read a corpus, keep at most <max tokens> unique tokens, and write to stdout'
	print 'Usage: remove_infrequent_words.py input_file max_tokens'
	sys.exit(0)

input_file = sys.argv[1]
max_tokens = int(sys.argv[2])

fdocs = open(input_file, 'r')
docs = map( lambda line : line[:-1].split(' '), fdocs.readlines() )
fdocs.close()

wordCount = {}
for doc in docs:
	for word in doc[2:]:
		if wordCount.has_key(word):
			wordCount[word] = wordCount[word] + 1
		else:
		     	wordCount[word] = 1

it = map( lambda x : (x[1], x[0]), wordCount.items() )
it.sort()
it.reverse()

tokens = min(len(it), max_tokens)
valid_tokens = set( map(lambda x : x[1], it[:tokens]) )

for doc in docs:
	sys.stdout.write(doc[0] + ' ' + doc[1])
	for word in doc[2:]:
		if word in valid_tokens:
			sys.stdout.write(' ' + word)

	sys.stdout.write('\n')
