# Load necessary libraries
library(ggplot2)
library(readr)

# Load the training history data
history <- fread("cnn_training_history.csv")

# Plot accuracy with a white background
accuracy_plot <- ggplot(history, aes(x=epoch)) +
  geom_line(aes(y=accuracy, color="train")) +
  geom_line(aes(y=val_accuracy, color="validation")) +
  labs(title="Model Accuracy", x="Epoch", y="Accuracy") +
  scale_color_manual(values=c("train"="blue", "validation"="orange"), 
                     labels=c("train", "validation")) +
  theme_minimal(base_size = 15) +
  theme(panel.background = element_rect(fill = "white", color = "black"),
        plot.background = element_rect(fill = "white", color = NA),
        legend.background = element_rect(fill = "white"))

# Plot loss with a white background
loss_plot <- ggplot(history, aes(x=epoch)) +
  geom_line(aes(y=loss, color="train")) +
  geom_line(aes(y=val_loss, color="validation")) +
  labs(title="Model Loss", x="Epoch", y="Loss") +
  scale_color_manual(values=c("train"="blue", "validation"="orange"), 
                     labels=c("train", "validation")) +
  theme_minimal(base_size = 15) +
  theme(panel.background = element_rect(fill = "white", color = "black"),
        plot.background = element_rect(fill = "white", color = NA),
        legend.background = element_rect(fill = "white"))

# Display the plots in R
print(accuracy_plot)
print(loss_plot)
