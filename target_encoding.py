# coding = 'utf-8'
import numpy as np
import pandas as pd
from homework import target_mean_v3,target_mean_v4
import time
def target_mean_v1(data, y_name, x_name):
    result = np.zeros(data.shape[0])
    for i in range(data.shape[0]):
        groupby_result = data[data.index != i].groupby([x_name], as_index=False).agg(['mean', 'count'])
        result[i] = groupby_result.loc[groupby_result.index == data.loc[i, x_name], (y_name, 'mean')]


    return result


def target_mean_v2(data, y_name, x_name):
    result = np.zeros(data.shape[0])
    value_dict = dict()
    count_dict = dict()
    for i in range(data.shape[0]):
        if data.loc[i, x_name] not in value_dict.keys():
            value_dict[data.loc[i, x_name]] = data.loc[i, y_name]
            count_dict[data.loc[i, x_name]] = 1
        else:
            value_dict[data.loc[i, x_name]] += data.loc[i, y_name]
            count_dict[data.loc[i, x_name]] += 1
    for i in range(data.shape[0]):
        result[i] = (value_dict[data.loc[i, x_name]] - data.loc[i, y_name]) / (count_dict[data.loc[i, x_name]] - 1)
    return result


def main():
    y = np.random.randint(2, size=(50000, 1))
    x = np.random.randint(10, size=(50000, 1))
    data = pd.DataFrame(np.concatenate([y, x], axis=1), columns=['y', 'x'])
    t1 = time.time()
    result_2 = target_mean_v2(data, 'y', 'x')
    t2 = time.time()
    print(f"v2 cost:{t2-t1}")
    t3 = time.time()
    result_3 = target_mean_v3(data, "y", "x")
    t4 = time.time()
    print(f"v3 cost:{t4-t3}")
    diff = np.linalg.norm(result_2 - result_3)
    print(diff)
    t5 = time.time()
    result_4 = target_mean_v4(data, "y", "x")
    t6 = time.time()
    print(f"v4 cost:{t6 - t5}")
    diff = np.linalg.norm(result_2 - result_4)
    print(diff)

if __name__ == '__main__':
    main()
