import os, sys, random

if (len(sys.argv) != 3):
    print 'Usage: generate_validation <input file name> <number of folds>'
    sys.exit(0)
else:
    prefix = sys.argv[1]
    nfolds = int(sys.argv[2])

data_raw = open(prefix, 'r').readlines()
ndata = int(data_raw[0])

data = data_raw[1:ndata+1]
random.shuffle(data)

ends = map(lambda x : ndata * x / nfolds, range(0, nfolds+1))

for i in range(1, nfolds+1):
    valid = data[ends[i-1] : ends[i]]
    train = data[:ends[i-1]] + data[ends[i]:]

    ftrain = open(prefix + '.' + str(i) + '.train', 'w')
    ftrain.write(str(len(train)) + '\n')
    ftrain.writelines(train)
    ftrain.close()

    fvalid = open(prefix + '.' + str(i) + '.valid', 'w')
    fvalid.write(str(len(valid)) + '\n')
    fvalid.writelines(valid)
    fvalid.close()
