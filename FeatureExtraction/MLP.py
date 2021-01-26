import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from keras.utils import np_utils
from keras.callbacks import Callback
from sklearn.metrics import confusion_matrix
from sklearn import preprocessing
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split

# load the dataset
f = open('features/finalFeatures.txt', 'r')
dataset = f.read()
f.close()

dataset = dataset.split('\n')
dataset = [ data.split(" ")[:-1] for data in dataset ]
dataset.pop()
dataset = np.array(dataset)

labels = dataset[:, 1:2].flatten()
features = dataset[:, 2:]
features = features.astype('float64')
for i in range(features.shape[1]):
  features[:, i:i+1] -= features[:, i:i+1].min()
  if features[:, i:i+1].max() != 0:
    features[:, i:i+1] /= features[:, i:i+1].max()

# encode class values as integers
encoder = LabelEncoder()
encoder.fit(labels)
encoded_Y = encoder.transform(labels)
# convert integers to dummy variables (i.e. one hot encoded)
dummy_y = np_utils.to_categorical(encoded_Y)

# Splitting dataset
X_train, X_test, y_train, y_test = train_test_split(features, dummy_y, test_size=0.2, random_state=42)

# define model
def model():
	# create model
	model = Sequential()
	model.add(Dense(20, input_dim=features.shape[1], activation='sigmoid'))
	model.add(Dense(10, input_dim=features.shape[1], activation='sigmoid'))
	model.add(Dense(7, activation='softmax'))
	# Compile model
	model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
	return model

model = model()
model.fit(
    features,
    dummy_y,
    batch_size=5,
    epochs=500,
    verbose=1,
    callbacks=[],
)

res = model.evaluate(
    X_test,
    y_test,
    batch_size=5,
    verbose=1,
    callbacks=[],
)

print(res)