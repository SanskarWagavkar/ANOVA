## ANCOVA ##

## Analysis of covariance ##

# we basically use regression analysis to create model which describe
# the effect of variation in the predictor variable on the 
# response variable

#if we have a categorial variable with values likes yes/no or
#male/female; simple regression analysis will give mulliple 
#result for each values of the categorial variable.

#in this scenario we can study the effect of the catgorial variable
#by using it along with the predictor variable and comparing the same
#with regression lines for each levels of the categorial variable

#such an analysis is daid to be analysis of covariance

#let's consider a r in-buit dataset "MTCARS"

#in this data you will observe that the filed "am" represent the type
#of transmission (automatic or manual)

#now we will study the effect of the values "AM" on the regression 
#between "mpg" & "hp"

#we will use a function called "avo()" and we follow it up with another
#function "anova()" to compare the muliple regression

#input data

#here we will take "mpg" as the response variable
#"hp" as the predictor variable
#"am" as the categorial variable

input_data_1 = mtcars[,c("am","mpg","hp")] 

head(input_data_1)

#Analysis

# we will create a regression model taking "hp" as predictor variable
# and "mpg" as the response variable taking into account the
# interacion between "am" and "hp" 

input = mtcars

result = aov(mpg ~ hp*am, data = input)

summary(result)

#comparing two models

# we will compare the models to conclude if the 
# interaction of the variable is truely in-significant.

#for comparision we will use ANOVA()

input_2 = mtcars

result1 = aov(mpg ~ hp*am, data = input_2)

result2 = aov(mpg ~ hp+am, data = input_2)

#comparing the two models

print(anova(result1,result2))


