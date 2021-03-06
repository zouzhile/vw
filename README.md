Vowpal Wabbit Learning
==

### Multi-Class Text Classification
 - input data: dataset/texts.tgz
 - create a folder "input", and extract texts.tgz to input/
 - bin/vwgen_text_multiclass input/texts/training output/texts/training 30
 - bin/vwgen_text_multiclass_test input/texts/test/ output/texts/test/vw_test_data output/texts/training 30
 - mkdir -p output/model/texts/
 - vw -d output/texts/training/vw_training_data --passes 100 --cache_file training.cache --loss_function logistic -f output/model/texts/predictor.vw --readable_model output/model/texts/predictor.readable --oaa 20 
 - vw -d output/texts/test/vw_test_data -t -i output/model/texts/predictor.vw -p test_predictions

### Click Prediction
 - input data: dataset/clicks.tgz
 - create a folder "input", and extract clicks.tgz to input/
 - bin/train_click_prediction

### Classifier Performance Measurement with aucROC
 - git clone git@github.com:zouzhile/PyROC.git 
 - python pyroc.py -f roc_input.tsv -p -t "test roc" 

The roc_input.tsv is the classifier's prediction result on the test set. The first column is the the actual class ( 0 or 1) of the test instance and second column is the prediction score 

## Useful Readings
 - [VW Repo and Installation Instruction](https://github.com/JohnLangford/vowpal_wabbit)
 - [VW Introduction Tutorials](https://github.com/JohnLangford/vowpal_wabbit/wiki/Tutorial) 
 - [A worth reading comprehensive Tutorial](http://zinkov.com/posts/2013-08-13-vowpal-tutorial/)
 - VW Clustering 
   - [John's slide](https://raw.github.com/wiki/JohnLangford/vowpal_wabbit/Cluster_parallel.pdf) 
   - [A Reliable Effective Terascale Linear Learning System](http://arxiv.org/pdf/1110.4198v3.pdf) 

