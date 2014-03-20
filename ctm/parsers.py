import re

def parse_docToTop(fileName):
        ''' Return a dict, id : {topicID : p} '''

        lines = map(lambda x : x.rstrip(), open(fileName, 'r').readlines())

        data = {}

        for line in lines:
                line = re.split('\s+', line)
                doc_id = line[0]

                doc = {}

                for pair in line[2:]:
                        pp = pair[1:-1].split(',')

                        idx = int(pp[0])
                        p = float(pp[1])
                
                        doc[idx] = p

                data[doc_id] = doc

        return data

def parse_corpus(fileName):

        lines = map(lambda x : x.rstrip().split(), open(fileName, 'r').readlines())

        data = { key: value for (key, value) in map(lambda line : (line[0], line[2:]), lines) }

        return data
