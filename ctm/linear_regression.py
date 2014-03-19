import random

def regression(x, y):
        sumx2 = 0
        sumy = 0
        sumx = 0
        sumxy = 0

        for (x1, y1) in zip(x, y):
                sumx2 += x1 * x1
                sumx += x1
                sumy += y1
                sumxy += x1 * y1

        n = len(x)
        denom = n * sumx2 - sumx * sumx

        a = (n * sumxy - sumx * sumy) / denom
        b = (sumx2 * sumy - sumxy * sumx) / denom

        return (a, b)

if __name__ == '__main__':
        x = range(1, 11)
        y = map(lambda x : x * 3 + 2 + random.random() - 0.5, x)

        print regression(x, y)
