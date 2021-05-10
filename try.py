import numpy as np
import sys
# 导入时间序列
x = []
for i in range(1,15):
    x.append(int(sys.argv[i]))
for i in range(0,14):
    if x[i] == 0:
        x[i] = 1
lan = []
for i in range(len(x)):
    if i == len(x) - 1:
        continue
    # 求级比
    lan.append(x[i] / x[i + 1])
    # try:
    #     lan.append(x[i] / x[i + 1])
    # except ZeroDivisionError:
    #     lan.append(1)
x_1 = np.cumsum(x)
# 构造数据矩阵B及数据向量
B = np.array([-1 / 2 * (x_1[i] + x_1[i + 1]) for i in range(len(x) - 1)])
B = np.mat(np.vstack((B, np.ones((len(x) - 1,)))).T)
Y = np.mat([x[i + 1] for i in range(len(x) - 1)]).T
u = np.dot(np.dot(B.T.dot(B).I, B.T), Y)
[a, b] = [u[0, 0], u[1, 0]]
a_new, b = x[0] - b / a, b / a

# 输入需要预测的年数
year = 3
year += len(x)
x_predict = [x[0]]
x_predict = x_predict + [a_new * (np.exp(-a * i) - np.exp(-a * (i - 1))) for i in range(1, year)]

#print((np.array(x_predict[:14])-np.array(x[:14]))/np.array(x[:14]))
#打印预测的未来数据，注意点同上
print(int(x_predict[14]))
print(int(x_predict[15]))
print(int(x_predict[16]))
