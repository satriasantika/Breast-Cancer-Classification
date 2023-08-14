# Breast Cancer Classification with Logistic Regression and Neural Network

This repository contains a project focused on breast cancer classification using two different machine learning approaches: Logistic Regression with R Studio and Neural Network Classification with Python.

## Dataset Description

The dataset used in this study is secondary data downloaded from the datahub website. It was compiled by Zwitter & Soklic (1988) from the University Medical Centre, Institute of Oncology. The dataset contains the following key attributes:

- **Predictor Variables**: There are three predictor variables that contribute to the classification process.

- **Response Variable**: The response variable indicates the nature of breast cancer cases. A value of 1 signifies malignant (cancerous) tumors, while a value of 0 signifies benign (non-cancerous) tumors.

| Variable         | Description                 | Category      | Scale    | Code | Unit       |
|------------------|-----------------------------|---------------|----------|------|------------|
| 𝑌 Diagnosis      | Kanker Payudara             | Malignant     | Nominal  | 1    | -          |
|                  |                             | Benign        | Nominal  | 0    | -          |
| 𝑋1 Usia Pasien   | -                           | -             | Interval | -    | -          |
| 𝑋2 Ukuran Tumor  | -                           | -             | Interval | -    | cm         |
| 𝑋3 Metastasis    | Kondisi Metastasis          | Metastasis    | Nominal  | 1    | -          |
|                  |                             | Tidak Metastasis | Nominal  | 0    |            |


## Logistic Regression with R Studio

### Overview

In this part of the project, we utilize the Logistic Regression algorithm to classify breast cancer cases. Logistic Regression is a well-known statistical technique used for binary classification tasks.

### Implementation

We have employed R Studio for this task, ensuring that the assumptions of the model, such as multicollinearity, are taken into account during the analysis. The R script 'RegLog.R' contains the detailed implementation of the Logistic Regression model.

## Neural Network Classification with Python

### Overview

The second part of the project involves implementing a Neural Network for breast cancer classification. Neural Networks are powerful tools for complex pattern recognition tasks.

### Implementation

Python is utilized within this segment, and the 'NN Classification.ipnyb' script illustrates the execution of the Neural Network model. We leverage widely acknowledged libraries such as TensorFlow, Scikit-Learn, Pandas, Numpy, and Matplotlib to formulate and train the neural network. The subsequent depiction presents the employed Neural Network architecture:

<div align="center">
  <img src="https://drive.google.com/uc?id=1gYmtJd0gOBLCiRbtI6N5vGovwiqA9cTQ" alt="Neural Network Architecture" width="300" height="300">
</div>

## Conclusion

Based on the performance evaluation results, it can be concluded that the Binary Logistic Regression model achieved a classification accuracy of 89.15%, while the Artificial Neural Network (ANN) model achieved a classification accuracy of 93.02%. This assessment indicates that the ANN model outperforms the Binary Logistic Regression model in breast cancer classification and prediction tasks.

With an improvement of 3.87 percentage points in classification accuracy, the ANN model demonstrates enhanced capabilities in identifying and distinguishing breast cancer patient data more accurately. This provides a more reliable prediction for diagnosing cancer types in patients. This advantage may stem from the Artificial Neural Network's ability to extract more complex patterns from data, resulting in better decision-making outcomes.

With these findings, the utilization of the ANN model in breast cancer prediction and diagnosis can be favored. However, it is essential to consider the use of specific models based on other factors such as model complexity, computational time, and result interpretability.

Continued development and enhancement of models remain crucial to contribute positively to the early detection and management of breast cancer. The insights gained from this study shed light on the potential of machine learning techniques to further advance medical research and diagnosis in the field of breast cancer.
