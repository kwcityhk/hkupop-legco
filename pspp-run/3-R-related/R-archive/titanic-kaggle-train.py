# -*- coding: utf-8 -*-
# http://openmachin.es/blog/titanic-disaster

import csv
import numpy as np

# load in the csv file and read it as text
csv_file_object = csv.reader(open('titanic-kaggle-train.csv', 'rU'))
# we want to store the csv data inside a numpy array
data=np.array(csv_file_object.next())
data=np.expand_dims(data,axis=0)

# save each row to our new data array
for row in csv_file_object:
    data = np.append(data,[row],axis=0)

header = data[0]
data = np.delete(data,0,0)
print("header: ",header)
hd = {}
i = 0
for h in header:
    hd[h] = i
    i += 1

print(data[::,hd['Survived']])

survived = data[::,hd['Survived']].astype(np.float)
print("{0} % survived.".format((np.sum(survived)/len(survived))*100))

def sigmoid(x):
    return 1.0/(1+np.exp(-x))

"""
    Predicts the outcome for the input x and the weights w
    x_0 is 1 and w_0 is the bias
"""
def predict(x,w):
    return sigmoid(np.dot(x.T,w.T))

"""
    get the gradient for the inputs x,weights w and the outputs y
"""
def gradient(x,w,y):
    # create an empty gradient array which has the same length as the array of weights
    grads = np.empty((len(w)))
    # compute the gradient for each weight
    for j in range(len(w)):
        grads[j] = np.mean(np.sum([x[i,j]*(predict(x[i],w)-y[i]) for i in range(len(x))]))
    return grads

"""
    get the new weights based on the old ones w, learning rate a and the gradients
"""
def getWeights(w,a,grads):
    return w-a*grads

"""
    Determine the cost of the prediction (pred)
"""
def cost(real,pred):
    return np.sqrt(1.0/2*np.mean(np.power(real-pred,2)))

def getInputRepresentation(m,entry,test=False):
    if test:
        t = 1
    else:
        t = 0

    inp = np.zeros(m+1)
    inp[0] = 1
    inp[1] = entry[hd['Sex']-t] == "female"
    pClass = entry[hd['Pclass']-t].astype(np.float)
    inp[2] = pClass == 1
    inp[3] = pClass == 2
    inp[4] = pClass == 3

    # we can also add the age column and divide it into 5 groups
    if entry[hd['Age']-t] == '':
        inp[5:10] = [0.1,0.3,0.2,0.2,0.2]
    else:
        inp[5] = (entry[hd['Age']-t].astype(np.float) <= 15)
        inp[6] = (entry[hd['Age']-t].astype(np.float) > 15) & (entry[hd['Age']-t].astype(np.float) <= 25)
        inp[7] = (entry[hd['Age']-t].astype(np.float) > 25) & (entry[hd['Age']-t].astype(np.float) <= 32)
        inp[8] = (entry[hd['Age']-t].astype(np.float) > 32) & (entry[hd['Age']-t].astype(np.float) <= 41)
        inp[9] = (entry[hd['Age']-t].astype(np.float) > 41)

    inp[10] = (entry[hd['SibSp']-t].astype(np.float) <= 0)
    inp[11] = (entry[hd['SibSp']-t].astype(np.float) > 0) & (entry[hd['SibSp']-t].astype(np.float) <= 1)
    inp[12] = (entry[hd['SibSp']-t].astype(np.float) > 1)
    inp[13] = (entry[hd['Parch']-t].astype(np.float) <= 0)
    inp[14] = (entry[hd['Parch']-t].astype(np.float) > 0) & (entry[hd['Parch']-t].astype(np.float) <= 1)
    inp[15] = (entry[hd['Parch']-t].astype(np.float) > 1)
    if entry[hd['Fare']-t] == '':
        inp[16:21] = [0.2,0.2,0.2,0.2,0.2]
    else:
        inp[16] = (entry[hd['Fare']-t].astype(np.float) <= 8)
        inp[17] = (entry[hd['Fare']-t].astype(np.float) > 8) & (entry[hd['Fare']-t].astype(np.float) <= 11)
        inp[18] = (entry[hd['Fare']-t].astype(np.float) > 11) & (entry[hd['Fare']-t].astype(np.float) <= 22)
        inp[19] = (entry[hd['Fare']-t].astype(np.float) > 22) & (entry[hd['Fare']-t].astype(np.float) <= 40)
        inp[20] = (entry[hd['Fare']-t].astype(np.float) > 40)

    title = entry[hd['Name']-t].split(", ")[1].split(" ")[0]
    inp[21] = title == "Mr."
    inp[22] = title == "Mrs."
    inp[23] = title == "Miss."
    inp[24] = title == "Master."
    inp[25] = title == "Dr."
    inp[26] = title == "Sir."
    if (np.count_nonzero(inp[21:27]) == 0):
        inp[27] = 1
    return inp

inputs = []
outputs = []
m = 27 # number of features without threshold

for entry in data:
    inp = getInputRepresentation(m,entry)

    inputs.append(inp)
    outputs.append(entry[hd['Survived']])

inputs = np.array(inputs).astype(np.float)
outputs = np.array(outputs).astype(np.float)

weights = np.random.rand(m+1) # one for the threshold

alpha = 0.001
epochs = 100
train_size = int((3*len(inputs))/4)
trainX = inputs[0:train_size]
trainY = outputs[0:train_size]
testX = inputs[train_size:]
testY = outputs[train_size:]

for t in range(epochs):
    weights = getWeights(weights,alpha,gradient(trainX,weights,trainY))
    sum_costs = 0
    for inp,outp in zip(testX,testY):
        prediction = predict(inp,weights)
        last_cost = cost(outp,0 if prediction < 0.5 else 1)
        sum_costs += last_cost

    print(weights)
    print(sum_costs/(len(inputs)-train_size))

# His

# [-0.95382855  0.94469917  0.89858109  0.43102736 -0.65090014  0.33426738
#  0.33741184  0.42538308  0.31467975 -0.12740568  0.1063886   0.20141303
# -0.71368804  0.20324538  0.22165528 -0.13517055  0.13118224 -0.16832063
# -0.11203696  0.01962982  0.35274372 -1.30658701  0.59768098  0.66461036
#  0.80450757  0.5089403   0.8805734  -0.01431949]
#0.142689709208

#Weight	Interpretation
#-0.95382855     Just weight for threshold
#0.94469917	Female
#0.89858109	First Class
#0.43102736	Second Class
#-0.65090014	Third Class
#0.33426738	Age≤19

#0.33741184	19<Age≤25
#0.42538308	25<Age≤32
#0.31467975	32<Age≤41
#-0.12740568	Age>41
#0.1063886	#Siblings/Spouse = 0
#0.20141303	#Siblings/Spouse = 1

#-0.71368804	#Siblings/Spouse > 1
#0.20324538	#Parents/Children = 0
#0.22165528	#Parents/Children = 1
#-0.13517055	#Parents/Children > 1
#0.13118224	Fare≤8
#-0.16832063	8<Fare≤11

#-0.11203696	11<Fare≤22
#0.01962982	22<Fare≤40
#0.35274372	Fare>40
#-1.30658701	Mr.
#0.59768098	Mrs.
#0.66461036	Miss.

#0.80450757	Master
#0.5089403	Dr.
#0.8805734	Sir.
#-0.01431949	None of the above titles

# Mine

#[-0.96849052  1.22041527  0.49471905  0.16465286 -0.83584079  0.17318807
#  0.05982881  0.18013492  0.15984471 -0.36071149  0.5383642   0.48504927
# -0.21260097  0.26856084  0.3357422  -0.13248707  0.14863794 -0.31599394
# -0.04909694  0.08317632  0.61045168 -1.31769986  0.35884718  0.2790736
#  0.4677525   0.33577595  0.18279332  0.53701968]
#0.142689709208

