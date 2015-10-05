#!/bin/sh
../../crf_learn -c 10.0 template train.data model
../../crf_test  -m model test.data > crf
cat crf | ../conlleval.txt -d '\t'

../../crf_learn -a MIRA template train.data model
../../crf_test  -m model test.data > mira
cat mira | ../conlleval.txt -d '\t'

../../crf_learn -a crf-sgd -m 10 template train.data model
../../crf_test  -m model test.data > sgd
cat sgd | ../conlleval.txt -d '\t'

rm -f model
rm -f crf
rm -f mira
rm -f sgd