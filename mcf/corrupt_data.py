import os, sys, random

if (len(sys.argv) != 4):
	print 'Usage: corrupt_data <input file name> <ndim> <percentage of corruption (0~1)>'
	sys.exit(0)
else:
	prefix = sys.argv[1]
	ndim = int(sys.argv[2])
	corruption = float(sys.argv[3])

ncorrupt = int(ndim * corruption)

data_raw = open(prefix, 'r').readlines()
ndata = int(data_raw[0])

data = map(lambda x : x.replace('\r', '').replace('\n', '').split(' '), data_raw[1:ndata+1])

fout = open("%s.corrupt%f" % (prefix, corruption), 'w')
fout.write(data_raw[0])
for line in data:
	# data format: id label #features [index : feature]
	id		= int(line[0])
	label		= int(line[1])
	features	= map(lambda x : (int(x.split(':')[0]), x.split(':')[1]), line[3:])

	perm		= range(ndim)
	random.shuffle(perm)
	corrupt = set(perm[:ncorrupt])

	corrupted_features = []
	full_features	= [0] * (ndim+1)
	for (index, feature) in features:
		if not index in corrupt:
			corrupted_features.append( (index, feature) )

	fout.write('%d %d %d ' % (id, label, len(corrupted_features)))
	fout.write(' '.join(map(lambda (index, feature) : '%d:%s' % (index, feature), corrupted_features)))
	fout.write('\n')

fout.close()
