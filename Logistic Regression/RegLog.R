library(car)
library(ResourceSelection)
library(pscl)
library(ggplot2)

#Preprocessing Data
breastcancer = read.csv("~/Kuliah Satria/Materi Semester 6/PKL/
                        Analisis Data/breastcancer")

breastcancer$Tumor.Size..cm. = as.numeric(breastcancer$Tumor.Size..cm.)
breastcancer$Metastasis = as.factor(breastcancer$Metastasis)
breastcancer$Diagnosis.Result = as.factor(breastcancer$Diagnosis.Result)

data = breastcancer
colnames(data) = c('X1', 'X2', 'X3', 'Y')
str(data)
View(data)

#Statistika Deskriptif
summary(data)

y_dum = data$Y
df = data.frame(kategori = factor(y_dum, levels = c(1, 0), 
                                  labels = c("Malignant", "Benign")))
data_summary = table(df$kategori)
df_summary <- data.frame(kategori = names(data_summary), Frequency = as.numeric(data_summary))

ggplot(df_summary, aes(x = kategori, y = Frequency, fill = kategori)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Frequency), vjust = -0.2, color = "black", size = 4) + 
  scale_fill_manual(values = c("blue", "red"), labels = c("Benign", "Malignant")) +
  xlab("Hasil Diagnosis") +
  ylab("Frekuensi") +
  ggtitle("Diagram Batang Diagnosis Kanker Payudara")

data$Kategori <- factor(ifelse(data$Y == 1, "Malignant", "Benign"))

ggplot(data, aes(x = X1, fill = Kategori)) +
  geom_histogram(binwidth = 5, position = "dodge", alpha = 0.7) +
  labs(x = "Umur", y = "Frekuensi", fill = "Kategori") +
  scale_fill_manual(values = c("blue", "red"), labels = c("Benign", "Malignant")) +
  ggtitle("Histogram Usia Pasien Kanker Payudara") +
  theme_minimal() +
  facet_wrap(~ Kategori, ncol = 1)

ggplot(data, aes(x = X2, fill = Kategori)) +
  geom_histogram(binwidth = 1, position = "dodge", alpha = 0.7) +
  labs(x = "Ukuran Tumor (cm)", y = "Frekuensi", fill = "Kategori") +
  scale_fill_manual(values = c("blue", "red"), labels = c("Benign", "Malignant")) +
  ggtitle("Histogram Ukuran Tumor Pasien Kanker Payudara") +
  theme_minimal() +
  facet_wrap(~ Kategori, ncol = 1)

df3 <- data.frame(data$X3, data$Y)

freq_table <- table(df3$data.X3, df3$data.Y)

plot_data <- data.frame(
  Kategori_x3 = factor(rep(c("Tidak Metastasis", "Metastasis"), each = 2)),
  Kategori_y = factor(c("Benign","Malignant", "Benign", "Malignant")),
  Frekuensi = c(freq_table[1, 1], freq_table[1, 2], freq_table[2, 1], freq_table[2, 2])
)

ggplot(plot_data, aes(x = Kategori_y, y = Frekuensi, fill = Kategori_x3)) +
  geom_bar(stat = "identity", position = "dodge", alpha = 0.7) +
  geom_text(aes(label = Frekuensi), position = position_dodge(width = 0.9), vjust = -0.5, size = 4) +
  labs(x = "Diagnosis Kanker Payudara", y = "Frekuensi", fill = "Kondisi") +
  scale_fill_manual(values = c("blue", "red"), labels = c("Metastasis", "Tidak Metastasis")) +
  ggtitle("Diagram Batang Kondisi Metastasis Pasien Kanker Payudara") +
  theme_minimal()


#Regresi Logistik
reglog = glm(Y ~ X1+X2+X3, data=data,
           family='binomial'(link = 'logit'))

#Asumsi Multikolinieritas
vif(reglog)

#Pendugaan Parameter
summary(reglog)

#Uji Simultan
pR2(reglog)
qchisq(0.95, 3)

#Uji Parsial
summary(reglog)

#Uji Kelayakan Model
hoslem.test(reglog$y, fitted(reglog))
qchisq(0.95, 8)

#Nilai Odds Ratio
beta = coef(reglog)
OR = exp(beta)
cbind(beta, OR)

#Ketepatan Klasifikasi
pred = ifelse(reglog$fitted.values>0.5, "1", "0")
cm = table(Predicted = pred, Actual=reglog$y)
akurasi = ((cm[1,1]+cm[2,2])/sum(cm))
            