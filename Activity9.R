library(tidyverse)
library(ggplot2)
library(palmerpenguins)
library(dcData)

ggplot(
  data = diamonds,
  # Creating x-axis, y-axis, and color of dots
  mapping = aes(
    x = carat,
    y = price,
    color = cut
  )
) +
  # Setting dot size and transparency
  geom_point(size = 2, alpha = 0.35) +
  # Creating labels for x, y, and color, as well as title
  labs(
    x = "Carat (g)",
    y = "Price ($)",
    color = "Cut Quality",
    title = "Diamond Price by Carats by Cut"
  ) +
  # Setting colors of different cuts
  scale_color_manual(
    values = c("red", "orange", "#ffef00", "green", "darkgreen")
  ) +
  # Making background white
  theme_bw() +
  # Putting legend at the bottom
  theme(
    legend.position = "bottom"
  )

ggplot(
  data = penguins,
  # Creating x-axis, y-axis, and color of dots
  mapping = aes(
    x = bill_depth_mm,
    y = bill_length_mm,
    color = species
  )
) +
  # Setting dot size
  geom_point(size = 2) +
  # Creating lines of best fit for each species
  geom_smooth(method=lm, se=FALSE) +
  # Creating labels for x, y, and color, as well as title
  labs(
    x = "Bill Depth (mm)",
    y = "Bill Length (mm)",
    color = "Species",
    title = "Penguin Species by Bill Depth and Length"
  ) +
  # Making background white
  theme_bw() +
  # Putting legend at the bottom
  theme(
    legend.position = "bottom"
  )

View(BabyNames)

filtered_names <- BabyNames %>% filter(name == "Bob" | name == "Liam" | name == "Tiffany") %>%
  select(name, year, count)
  
combined_names <- aggregate(
  x = filtered_names[3],
  by = list(filtered_names$name, filtered_names$year),
  FUN = sum
) %>% rename()

ggplot(
  data = combined_names,
  mapping = aes(
    x = Group.2,
    y = count,
    color = Group.1
  )
) +
  geom_line(size = 1.5) +
  labs(
    x = "Year",
    y = "Frequency",
    color = "Name",
    title = "Popularity of Bob, Liam, and Tiffany Over Time"
  ) +
  theme_bw() +
  theme(
    legend.position = "bottom"
  )