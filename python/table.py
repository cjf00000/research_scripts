import pickle
import sys

def read_table(filename):
	"""
	Private function.
		
	Read a table from filename.
	"""

	f = open(filename, "r")
	table = map(lambda line : line[:-1].split('\t'), f.readlines())
	f.close()

	return table

def mean_and_variance(filename, cluster_by, data_needed):
	"""
	Read a table from filename, seperated by \\t and \\n
	cluster experiment results by columns in cluster_by
	compute mean and variance in each cluster for columns in data_needed
	returns a list of records, [(contents of cluster_by) samples ((mean, variance) in data_needed)]
	"""

	table = read_table(filename)

	stat = {}
	for record in table:
		identifier = []
		for column in cluster_by:
			identifier.append(record[column])

		identifier = pickle.dumps(identifier)
		if not stat.has_key(identifier):
			stat[identifier] = []

		data = []
		for column in data_needed:
			data.append(float(record[column]))

		stat[identifier].append(data)

	result = []
	for identifier in stat.keys():
		data		= stat[identifier]
		identifier	= pickle.loads(identifier)
		line_result	= identifier

		samples		= len(data)
		dimension	= len(data_needed)

		means		= [0.0] * dimension
		var		= [0.0] * dimension
		for one_data in data:
			for i in xrange(0, dimension):
				means[i] = means[i] + one_data[i]
				var[i] = var[i] + one_data[i] * one_data[i]

		means = map(lambda x : x / samples, means)
		var = map(lambda tu : tu[0] / samples - tu[1]*tu[1], zip(var, means))

		line_result.append(samples)
		line_result.extend(means)
		line_result.extend(var)
		result.append(line_result)

	return result

if __name__ == "__main__":
	for result in mean_and_variance('data.table', [7, 8], [10, 11]):
		for entry in result:
			sys.stdout.write(str(entry) + ' ')

		sys.stdout.write('\n')
