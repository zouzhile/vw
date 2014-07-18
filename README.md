Vowpal Wabbit Learning
==

VW Repo and Installation
    https://github.com/JohnLangford/vowpal_wabbit

VW Introduction
    https://github.com/JohnLangford/vowpal_wabbit/wiki/Tutorial 

Multi-Class Text Classification
 - input data: dataset/texts.tgz
 - create a folder "input", and extract texts.tgz to input/
 - bin/vwgen_text_multiclass input/texts/training output/texts/training 30
 - bin/vwgen_text_multiclass_test input/texts/test/ output/texts/test/vw_test_data output/texts/training 50
 - mkdir -p output/model/texts/
 - vw -d output/texts/training/vw_training_data --passes 100 --cache_file training.cache --loss_function logistic -f output/model/texts/predictor.vw --oaa 20 
 - vw -d output/texts/test/vw_test_data -t -i output/model/texts/predictor.vw -p test_predictions
