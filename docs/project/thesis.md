---
title: MRI and EEG signal processing
lang: en-US
tags: ['Machine Learning']
thumbnail: ./thesis-thumb.png
description: Thesis to develop standardized pipelines MRI and EEG signals.
links: [{url: 'https://hdl.handle.net/2123/24270', text: 'View in University of Sydney Library', icon: ['fas', 'book']}]
info: [{key: 'Role', value: 'Masters student'}, {key: 'Affiliation', value: 'University of Sydney'}, {key: 'Skills involved', value: ['Signal processing', 'Machine learning']}, {key: 'Tech used', value: ['Python', 'MATLAB', 'Tensorflow']}]
date: 2020-01-01
---
![An image](/thesis.png)

## Abstract
Medical image and signal analysis play a vital role in biomedical research where a variety of computational methods are available. In recent years, the methods were widely variable across studies which was possibly the reason for conflicting results in many studies. Moreover, these differences can hinder the development of multi-dataset federated machine learning (ML) and multimodal studies. Therefore, to characterize how methodological differences can influence the results, this thesis conducted two case studies of contrasting workflows in electroencephalography (EEG) signals and Magnetic resonance imaging (MRI) analysis. In the first experiment, EEG preprocessing methods, that previously varied across studies and produced inconsistent results, were assessed. The results indicated that several choices can modulate the results significantly.

The second experiment considered clinical dementia rating (CDR) classification pipelines using MRI. Previously reported models lacked the ability to classify all five levels of CDR, had limited interpretability and used restricted data sources making the models biased towards the experimental settings. Furthermore, most of the reported pipelines were found to have “data leakage”, a phenomenon which resulted in highly accurate models but with low repeatability in new datasets. To overcome these limitations, a deep learning model with improved interpretability was developed. The results indicated that MRI experimental settings can substantially affect the model accuracy invalidating real-world use cases for previously published models.

The two experiments signify that disproportional or biased results are obtained across studies if methods or experimental settings vary. Therefore, a common set of agreed standards for analysis is needed. This will allow comparison of studies, integration of information sources such as combined EEG and MRI, and pave the way for multi-dataset studies such as those being proposed using federated ML.