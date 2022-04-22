# Commonwealth_Games_Analysis
### Project on R Shiny. Dashboard to analyze and predict commonwealth games.
This application provides visualisations on data on the Commonwealth Games, the international sporting event held every four years between members of the Commonwealth of Nations .

## Project: Commonwealth game analysis
## Project Problem Statement:
One of the expanding areas necessitating good predictive accuracy is sport
prediction, due to the large monetary amounts involved in betting. In addition,
coaches and team owners are striving for models so that they can understand and
formulate strategies needed to win. The aim of this project is to develop models for
predicting the number of medals won by each country at the commonwealth games
2022 using information that was available prior to the Games.
This dashboard has been designed to analyze and visualize the performance of
different countries during the past years and illustrate a predictive model to predict
the performance of a country in the future.
There are two main categories of prediction methods: one is predictions based on
competition results leading up to the commonwealth, the other is by using economics
and a range of factors to base their predictions (or a mixture of both of these).

## Source of data
Commonwealth data consists of observation from different countries. The variables
are: Country Name, Total medals won(including gold, silver and bronze) , Country’s
GDP, Country’s HDI, host, and national income .

## Methodology and Model Selection:
Forecasting the number of commonwealth medals won by each nation is critical for a
variety of stakeholders, including: Sports betting companies can set the odds in
advance, while sponsors and media companies can direct their resources to
promising teams. To significantly increase the commonwealth games medal
forecasting accuracy, we apply machine learning, more specifically a two-staged
forecasting model, which outperforms a more traditional naïve forecast model.
As there was an increasing trend in the medal count. We initially choose the naïve
base model, where we use the current year medal as a prediction for the next year.
More exploratory data analysis helped us understand that taking in historic data 

### The socio-economic variables:
A number of socio-economic variables are reliable predictors of CWG success. For
example, a country’s gross domestic product (GDP) and its population size are
strongly correlated with commonwealth success. Of course, the GDP by itself has no
impact on an athlete’s performance. However, it correlates with a large number of
factors that affect an athlete’s ability to train, and as such is a so-called proxy variable
for these other factors: in a wealthy country, the population can dedicate more time to
leisure activities such as sports, is healthier, and can afford professional athletes as
well as a better sports infrastructure for more effective training. Another important
variable is a country’s population size; provided that world-class athletic talent is
uniformly distributed across the world’s population, larger countries should generally
produce more top athletes
### Forecasting process
We collected the data for the top 10 countries (India, Australia, Canada, South Africa, New
Zealand, Kenya, Nigeria, Malaysia, Jamaica, Singapore) from 1990-2018 to predict the medal
tally for 2022.
Overfitting the given data when using both statistical models and machine learning invariably
results in erroneous predictions. This is especially true when only a limited amount of data is
accessible. As a result, we use a strict time-consistent data separation to minimize overfitting
and produce fair and reliable findings. To fit models during model selection, we use data
collected from 1990 to 2014 as the training set. We also use data from the 2018
Commonwealth Games as a test set to evaluate and compare the models' performance during
the model selection process.

## User Interface Development
The dashboard was built up in the R Shiny library. Shiny is a software environment
designed to make it easy to create interactive web applications with a graphical user
interface based on the R programming language. It is also convenient for creating
various online calculators, charts, and infographics. HTML, CSS and JavaScript
were also used to design the webpage for better layouts for the user, so that the user
can feel comfortable with the Web page.
## Detailed Explanation
From wireframing the dashboard till implementing the project it took roughly 3
months. Everyone had a different role to play, from research to development. Each
tab has been designed and ordered in a way that the users could understand and
analyze the games comprehensively.
#### Home - This tab showcases the title and details about other tabs.
#### Growth of the Games - shows how the games has grown in numbers since its
inception. The graph can be viewed with different categories. The categories are
number of participating countries, number of sports played, number of events
contested, and number of participating athletes. This tab also gives us the historical
facts about the commonwealth games.
#### Results: Medal Tally - shows the medal results for a selected year or for all years.
Region wise table is also available to view.
#### Map View - shows the participant countries and medal winnings on a map. The map
can be filtered to specific continents. The countries that have won different medals
and their count are shown.
#### Country Profiles - shows details about a participating country, including medals
won and in which sports
#### Predict 2022 - present the statistical model to predict the medals of top 10 countries
for the year 2022. The tab gives a detailed idea of all the variables needed for the
model and why we chose them.
#### Blogs - related sports analytics blogs that we have written. The tab provides links
with short descriptions on these blogs. A small description about us is also given in
this tab.

## Recommendation:
The team is planning to publish a research paper on the model that we have
developed using economic variables
Furthermore, we have decided to make an interactive tab for our model. Users can
give their own dataset and variables to predict the results of future games.
For the website to have more user interaction we thought of Implementing a way for
users to add their blogs related to commonwealth games and share information with
others

#### Link to the dashboard: <a href = "https://nakulrameshvarma.shinyapps.io/Commonwealth_Games_Analysis/">Commonwealth Games Analysis</a>

### ABOUT US
#### We are the 'Kuttans Te Kudiyan'
'Kuttans Te Kudiyan' is derived from two languages, in which 'Kuttan' is taken from Malayalam meaning 'boy' and 'Kudiyan' is taken from Punjabi meaning 'girls'. Five Kuttans from Kerela and two Kudiyan from North India, together formed this group. We are M.Sc. BDA students from St. Joseph's College(Autonomous), Bangalore. The initial thought in mind was to prepare an easily accessible user-interface on 'Commonwealth Games Analysis'. Our motive while working on this project was to build a model to predict the medal tally for 2022 CWG which will be useful for sports betting companies to set the odds in advance, while sponsors and media companies can direct their resources to promising teams. We are trying to publish a research paper based on the findings we made through this project. We would really like to know your views on this.
