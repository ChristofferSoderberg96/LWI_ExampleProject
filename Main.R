# Packages

library(png)
library(extrafont)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(patchwork)

# For LWI colour palette
devtools::install_github("ChristofferSoderberg96/lwi")
library(lwi)

# Logos

logo_england <- readPNG("lwlogo_england72dpi.png", native = TRUE)

# test plots

# scatter plot ----

# New theme

test1_lwi <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class), size = 3) +
  lwi_theme() +
  scale_colour_lwi() +
  guides(colour=guide_legend(title=NULL)) +
  labs(title="Test 1, theme 1",
       subtitle="R Default Dataset",
       caption="Learning and Work Institute analysis of R Foundation data",
       x="Engine displacement (litres)", y="Fuel efficiency (mpg)") +
  inset_element(logo_england, 0, 0, 0.15, 0.1, align_to = 'full') + theme_void()

print(test1_lwi)

# Old theme

test1_lwiold <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class), size = 3) +
  theme_economist_white(gray_bg = FALSE) +
  scale_colour_lwi() +
  guides(colour=guide_legend(title=NULL)) +
  labs(title="Test 1, theme 2",
       subtitle="R Default Dataset",
       caption="Learning and Work Institute analysis of R Foundation data",
       x="Engine displacement (litres)", y="Fuel efficiency (mpg)") +
  inset_element(logo_england, 0, 0, 0.15, 0.1, align_to = 'full') + theme_void()

print(test1_lwiold)

# line plot ----

# New theme

test2_lwi <- ggplot(data = economics) +
  geom_line(mapping = aes(x = date, y = uempmed), size = 1.25, colour = "#ee7e3b") +
  lwi_theme() +
  scale_colour_lwi() +
  labs(title="Test 2, theme 1",
       subtitle="R Default Dataset",
       caption="Learning and Work Institute analysis of R Foundation data",
       x=NULL, y="Unemployment rate") +
  inset_element(logo_england, 0, 0, 0.15, 0.1, align_to = 'full') + theme_void()

print(test2_lwi)

# Old theme

test2_lwiold <- ggplot(data = economics) +
  geom_line(mapping = aes(x = date, y = uempmed), size = 1.25, colour = "#ee7e3b") +
  theme_economist_white(gray_bg = FALSE) +
  scale_colour_lwi() +
  labs(title="Test 2, theme 2",
       subtitle="R Default Dataset",
       caption="Learning and Work Institute analysis of R Foundation data",
       x=NULL, y="Unemployment rate") +
  inset_element(logo_england, 0, 0, 0.15, 0.1, align_to = 'full') + theme_void()

print(test2_lwiold)

# bar plot ----

# New theme

test3_lwi <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), width = 0.5) +
  lwi_theme() +
  scale_fill_lwi() +
  guides(fill=guide_legend(title="Diamond clarity")) +
  labs(title="Test 3, theme 1",
       subtitle="R Default Dataset",
       caption="Learning and Work Institute analysis of R Foundation data",
       x="Diamond cut", y="Frequency") +
  inset_element(logo_england, 0, 0, 0.15, 0.1, align_to = 'full') + theme_void()

print(test3_lwi)

# Old theme

test3_lwiold <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), width = 0.5) +
  theme_economist_white(gray_bg = FALSE) +
  scale_fill_lwi() +
  guides(fill=guide_legend(title="Diamond clarity")) +
  labs(title="Test 3, theme 2",
       subtitle="R Default Dataset",
       caption="Learning and Work Institute analysis of R Foundation data",
       x="Diamond cut", y="Frequency") +
  inset_element(logo_england, 0, 0, 0.15, 0.1, align_to = 'full') + theme_void()

print(test3_lwiold)

# bar plot coord flip ----

# New theme

test4_lwi <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), width = 0.5) +
  coord_flip() +
  lwi_theme(horizontal = FALSE) +
  scale_fill_lwi() +
  guides(fill=guide_legend(title="Diamond clarity")) +
  labs(title="Test 4, theme 1",
       subtitle="R Default Dataset",
       caption="Learning and Work Institute analysis of R Foundation data",
       x="Diamond cut", y="Frequency") +
  inset_element(logo_england, 0, 0, 0.15, 0.1, align_to = 'full') + theme_void()

print(test4_lwi)

# Old theme

test4_lwiold <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), width = 0.5) +
  coord_flip() +
  theme_economist_white(gray_bg = FALSE, horizontal = FALSE) +
  scale_fill_lwi() +
  guides(fill=guide_legend(title="Diamond clarity")) +
  labs(title="Test 4, theme 2",
       subtitle="R Default Dataset",
       caption="Learning and Work Institute analysis of R Foundation data",
       x="Diamond cut", y="Frequency") +
  inset_element(logo_england, 0, 0, 0.15, 0.1, align_to = 'full') + theme_void()

print(test4_lwiold)

# Outputs ----

charts = ls(pattern = "test")

plot_print(mget(charts), "Charts", width = 400, height = 300, res = 200, scaling = 1.5)

excel_print(mget(charts), "Excel", ggplots = TRUE)