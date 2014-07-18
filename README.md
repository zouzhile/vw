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
 - mkdir -p output/model/texts/
 - do training: 
     vw -d output/texts/training/vw_training_data -f output/model/texts/predictor.vw --oaa 20 
 - test predictor: 
     vw -d output/texts/test/vw_training_data -t -i output/model/texts/predictor.vw
