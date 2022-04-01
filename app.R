library(shiny)
library(bslib)
library(ggplot2)
library(echarts4r)
library(reshape)
library(leaflet)

ui <- shinyUI(
  tags$div(id = "homePage",
  navbarPage(theme = bs_theme(version = 4,
                              primary = "rgba(0, 0, 0, 0.5)", 
                              secondary = "#000000", 
                              success = "#000000", 
                              info = "#000000", 
                              base_font = font_google("Montserrat"), 
                              code_font = font_google("Montserrat"), 
                              heading_font = font_google("Montserrat"), 
                              font_scale = NULL, 
                              `enable-gradients` = TRUE, 
                              bootswatch = "flatly"),
             tags$html(tags$div(class = "title",
                                tags$div("Commonwealth"), 
                                tags$div("Games Analysis"), 
                                ),
                       ),
             tabPanel(tags$div(onclick="changeBG_home()" ,"Home"),
                      fluidPage(
                                column(12,
                                       div(id="intro-head",
                                           h1("The Commonwealth Games"),
                                           h2("An Indepth Analysis and Visualization of Commonwealth Games"),
                                       ),
                                       div(class = "overview",
                                         h3("Overview"),
                                         p("This application provides visualisations on data on the Commonwealth Games, ",
                                           "the international sporting event held every four years between members of the ", 
                                           a("Commonwealth of Nations", href="https://en.wikipedia.org/wiki/Commonwealth_of_Nations"), "."),
                                         p("The project has the following panels:"),
                                         tags$ul(
                                           tags$li(strong("Growth of the Games"), "- shows how the games has grown in numbers since its inception"),
                                           tags$li(strong("Results: Medal Tally"), "- shows the medal results for a selected year or for all years"),
                                           tags$li(strong("Map View"), "- shows the participant countries and medal winnings on a map"),
                                           tags$li(strong("Country Profiles"), "- shows details about a participating country, including medals won and in which sports"),
                                           tags$li(strong("Predict 2022"), "- present the statistical model to predict the medals of top 10 countries for the year 2022 "),
                                           tags$li(strong("Blogs"), "- related sports analytics blogs that we have written"),
                                         ),
                                       ),
                                ),
                                div(class = "footer-content","Webpage made and designed by Kuttans te Kudiyan. Copyright 2022"),
                                div(class = "footer",
                                    img(src = "kklogo.png", alt = "kuttans te kudiyan logo", width = "200"),
                                    img(src = "cwlogo.png", alt = "commonwealth logo", width = "200"),
                                    img(src = "cwflogo.png", alt = "commonwealth federation logo", width = '180'),
                                    )
                      ),
             ),
             tabPanel(tags$div(onclick="changeBG_nothome()" ,"Growth of Games"),
                      fluidPage(
                        tags$h2(class = "growth-heading" ,"Growth throughout the years"),
                        column(class = "grwoth-line-legend" ,12,
                               wellPanel(
                                 radioButtons("growthProp", label="Select category to view: ",
                                              choices=c('Number of Participating Countries', 'Number of Sports Played', 'Number of Events Contested', 'Number of Participating Athletes'), 
                                              selected='Number of Participating Countries')
                                 ),
                               tags$div(class = "plot-style" , echarts4rOutput("growthPlot")),
                        ),
                        column(class = "hoverinfo",12, 
                               
                               tags$div(
                                 tags$div(class = "hist-fact",
                                   tags$h2(style = "text-align: center;margin-bottom: inherit" ,"Historicals Facts About The Commonwealth Games"),
                                   tags$ul(
                                     tags$li(
                                       tags$h4("1930"),
                                       tags$div(
                                         tags$p(
                                           "The first official Commonwealth Games (called the British Empire Games) 
                                           were held in 1930 in Hamilton, Canada. Four hundred athletes from 11 countries 
                                           competed in 59 events across six sports: athletics, boxing, lawn bowls, rowing, 
                                           aquatics (swimming and diving) and wrestling. Interestingly, women only competed 
                                           in swimming events. The competing nations were: Australia, Bermuda, British Guyana, 
                                           Canada, England, Northern Ireland, Newfoundland, New Zealand, Scotland, South Africa 
                                           and Wales. "
                                         ),
                                         tags$img(src = "1930pic.jpg", class = "imgcenter", width = "400", alt = "1930 commonwealth games"),
                                         tags$p(class = "imgcenter", "British Empire Games held in Canada")
                                       )
                                     ),
                                     tags$li(
                                       tags$h4("1934"),
                                       tags$div(
                                         tags$p(
                                           "The 1934 Games were originally awarded to Johannesburg, South Africa, but were 
                                           moved to London to prevent a political crisis concerning the way South Africa 
                                           might greet and treat black and Asian Commonwealth athletes. "
                                         )
                                       )
                                     ),
                                     tags$li(
                                       tags$h4("1942 and 1946"),
                                       tags$div(
                                         tags$p(
                                           "With the exception of 1942 and 1946, which were cancelled due to World War II, 
                                           CWG has taken place every four years since then. "
                                         )
                                       )
                                     ),
                                     tags$li(
                                       tags$h4("1978"),
                                       tags$div(
                                         tags$p(
                                           "Nigeria boycotted the 1978 Games because of New Zealand's sporting contacts with South Africa. "
                                         ),
                                         tags$img(src = "1978pic.jpg", class = "imgcenter", width = "200", alt = "Human Rights and Sporting Contacts book"),
                                         tags$p(class = "imgcenter", "Human Rights and Sporting Contacts: Newzealand attitude to Race Relations in South Africa")
                                       )
                                     ),
                                     tags$li(
                                       tags$h4("1986"),
                                       tags$div(
                                         tags$p(
                                           "Thirty-two nations from Africa, Asia and the Caribbean boycotted the 1986 Games 
                                           because of England's attitude to South African sporting contacts, reducing the number 
                                           of competing nations to twenty-seven. Boycott threats have also hung over the Games 
                                           in 1974, 1982 and 1990 because of South Africa. "
                                         ),
                                         tags$img(src = "1986pic.png", class = "imgcenter", width = "500", alt = "Boycotted Nations"),
                                         tags$p(class = "imgcenter", "Nations that boycotted the 1986 Games")
                                       )
                                     ),
                                     tags$li(
                                       tags$h4("1998"),
                                       tags$div(
                                         tags$p(
                                           "Up until 1998, only individual sports were included on the programme. However, the 
                                           1998 Games in Kuala Lumpur saw the introduction of team sports, with nations taking 
                                           part in Cricket (50 over game), Hockey (men and women), Netball (women) and Rugby 
                                           7s (men). Hockey, Netball and Rugby 7s are now core sports on the programme. "
                                         ),
                                         tags$img(src = "1998pic.jpg", class = "imgcenter", width = "400", alt = "Rugby 1998 Games"),
                                         tags$p(class = "imgcenter", "Rugby got included in the 1998 Games")
                                       )
                                     ),
                                     tags$li(
                                       tags$h4("2002"),
                                       tags$div(
                                         tags$p(
                                           "The 2002 Games in Manchester saw for the first time at any multi-sport event in the 
                                           world, a limited number of full medal events for elite athletes with a disability (EAD), 
                                           in a fully inclusive sports programme. This has continued ever since with the number 
                                           of events growing substantially "
                                         ),
                                         tags$img(src = "2002pic.jpg", class = "imgcenter", width = "500", alt = "Para 2002 Games"),
                                         tags$p(class = "imgcenter", "Introduction of Para Sports and Events")
                                       )
                                     ),
                                     tags$li(
                                       tags$h4("2006"),
                                       tags$div(
                                         tags$p(
                                           "The Melbourne 2006 Queen's Baton Relay was the world's longest, most inclusive relay, 
                                           travelling more than 180,000 kms and visiting all 71 nations that send teams to the 
                                           Commonwealth Games in one year and a day. The Queen's Baton Relay started, as it traditionally 
                                           does, at Buckingham Palace and ended in Melbourne, Australia at the Melbourne Cricket Ground. 
                                           It carried a message from Her Majesty the Queen and was read by her to the Opening Ceremony 
                                           of the Commonwealth Games. "
                                         ),
                                         tags$p(
                                           "The baton contained 71 lights on the front, representing the 71 member nations of the 
                                           Commonwealth Games Federation. A video camera built into the front of the baton recorded 
                                           continuously as the baton travelled, and a GPS tracker was fitted; so that the baton's location 
                                           could be viewed live on the Commonwealth Games Website. "
                                         ),
                                         tags$img(src = "2006pic.jpg", class = "imgcenter", width = "500", alt = "Queen's Batton Relay"),
                                         tags$p(class = "imgcenter", "Queen's Batton Relay")
                                       )
                                     ),
                                     tags$li(
                                       tags$h4("Other facts "),
                                       tags$div(
                                         tags$p(
                                           "The Commonwealth Games represent about 20% of the Earth's land and 32% population of the world."
                                         ),
                                         tags$p(
                                           "Commonwealth Games are the third biggest event of the world after the Olympic Games and Asian games."
                                         )
                                       )
                                     ),
                                   )
                                 )
                               )
                               
                        ),
                      )
             ),
             tabPanel(tags$div(onclick="changeBG_medalTally()"  ,"Results: Medal Tally"),
                      fluidPage(
                        tags$h1(class = "medaltally-heading" ,"Medal Tally throughout the years"),
                        fluidRow(
                                 tags$div(style = "width: 50%" ,
                                        wellPanel( style = "width: 50% !important; margin: 0 10px auto auto; background-color: bisque;",
                                          selectInput("resultsYearInput", "Select Year", "All")
                                        )
                                 ),
                                 tags$div(style = "width: 50%" ,
                                        wellPanel(style = "width: 50% !important; margin: 0 0 auto 10px; background-color: bisque;",
                                          selectInput("resultsRegionInput", "Select Region", "All")
                                        )

                                 ),
                        ),
                        tags$div(class = "table-class",
                          htmlOutput("resultsTally")),
                        )
             ),
             tabPanel(tags$div(onclick="changeBG_mapView()"  ,"Map View"),
                      fluidPage(
                        htmlOutput("mapViewTitle"),
                        div(id="leaflet-map-container",
                            tags$div(class = "map-radio",
                                     wellPanel(class = "map-well",
                                       selectInput("mapYearInput", "Select Year", "All"),
                                       selectInput("mapRegionInput", "Select Region", "All")
                                       ),
                                     wellPanel(class = "map-well",
                                       radioButtons("mapViewInput", "Select Map View",
                                                    choices=c('Participant Countries',
                                                              'Countries that have won Gold Medals', 
                                                              'Countries that have won Silver Medals', 
                                                              'Countries that have won Bronze Medals'),
                                                    selected='Participant Countries'
                                                    )
                                       )
                                     ),
                            leafletOutput("mapLeaflet")
                            ),
                        htmlOutput("mapViewCaption")
                        )
                      ),
             tabPanel(tags$div(onclick="changeBG_countryProfile()"  ,"Country Profile"),
                      fluidPage(
                        div(class = "country-profile", "Growth of Countries throughout the Years"),
                        tags$div(class = "countrypage",
                          wellPanel( style = "width: 25% !important" ,
                            selectInput("countryRegionInput", "Select Region", "All"),
                            selectInput("countryNameInput", "Select Country", "All")
                            ),
                            plotOutput("countryYearResults"),
                        ),
                        tags$div(class = "countrydetails",
                            htmlOutput("countryProfile")
                        )
                      )
             ),
             tabPanel(tags$div(onclick="changeBG_researchPaper()"  ,"Predict 2022"),
                      div(class = "predictPage",
                          div(class = "paper",
                              h2(class = "paperTitle","Commonwealth Games Medal Numbers Predictions with A TWO-STAGE FORECASTING MODEL "),
                              h4(class = "paperSubtitle","Introduction"),
                              div(class = "content",
                                  p("Forecasting the number of commonwealth medals won by each nation is critical for a variety of stakeholders, 
                                    including: Sports betting companies can set the odds in advance, while sponsors and media companies can 
                                    direct their resources to promising teams. To significantly increase the common wealth games medal forecasting
                                    accuracy, we apply machine learning, more specifically a two-staged forecasting model, thus outperforming more traditional naive forecast model."),
                                  ),
                              h4(class = "paperSubtitle","Model Selection"),
                              div(class = "content",
                                  p("As there was an increasing trend in the medal count. we initially choose the naive base model, 
                                    where we use the current year medal as a prediction for the next year. More exploratory data 
                                    analysis helped us understand that taking in historic data would improve the model."),
                                  p("Exponential Smoothing Methods was further used for forecasting as they use weighted averages 
                                    of past observations to forecast new values."),
                                  p("We were able to analyse that Being the host has been associated with a strong positive effect 
                                    on a country's medal count. To in cooperate this effect and the addition of other explanatory 
                                    variables through regression will aid in the prediction of major changes in the trend of the 
                                    forecast variable. Exogenous forecasts of the independent variables are required if the regression 
                                    model uses non-lagged values of these variables. Time series analysis can aid such forecasts. "),
                                  p("The multiple regression along with the time series analysis shows the best performance leading 
                                    to a two-staged forecasting models as model of choice."),
                              ),
                              h4(class = "paperSubtitle","Description of the Two-Stage Model"),
                              div(class = "content",
                                  p(class = "paperSubtitle","1). Exponentially Weighted Moving Average Forecast Model"),
                                  p(class = "subtitleSub","To forecast the variable of interest and selected independent or related variables, an exponentially 
                                    weighted moving average procedure is used. These forecasts are fed into a multiple regression model, 
                                    which relates actual values of the variable of interest, as well as other lagged variables, to these 
                                    forecasts. Using exponentially weighted moving averages, it forecasts trends and seasonals. The 
                                    forecasted time series is assumed to have a permanent component as well as a multiplicative seasonal 
                                    component in this approach. In addition, the model allows for a linear trend in the permanent component. 
                                    Current values for these time series components are calculated for each time period by correcting 
                                    observed errors in the previous forecast. Forecasts are then made based on the current values."),
                              ),
                              div(class = "content",
                                  p(class = "paperSubtitle","2). Multiple Regression Model "),
                                  p(class = "subtitleSub","The second stage of model includes Multiple Regression. Multiple linear regression 
                                    is a statistical technique used to predict the outcome of a response variable through several explanatory 
                                    variables and model the relationships between them. Confidence in the predictive accuracy of the regression 
                                    model will not be affected by multicollinearity among the independent variables, provided their pattern of 
                                    comovement is reasonably consistent over time. The second stage handles the data sequentially across time 
                                    in order to provide an assessment of the regression model's genuine forecasting capabilities. This 
                                    sequential process ensures that the regression model could have provided all forecasts at the moment the 
                                    forecast was needed. That is, the regression equation's estimation would have been possible at the time the 
                                    forecast was made. "),
                              ),
                              h4(class = "paperSubtitle","Variables"),
                              div(class = "content",
                                  p("What's fascinating about this method is that it doesn't rely on any knowledge about the sports 
                                    or athletes themselves. Instead, it mostly comes down to economics. "),
                                  p("The forecast medal totals based on four factors: A country's population, its comparative level 
                                    of wealth, its performance in previous Common wealth Games, and whether it is hosting that year's 
                                    Common wealth Games. "),
                                  p("The first variable is population density. If natural athletic talent is uniformly distributed 
                                    over the world's population, then it follows that larger countries will have more athletes with 
                                    the greatest natural ability. "),
                                  p("The second variable is GDP per capita. In countries with higher GDP per capita, the population 
                                    is likely to have more leisure time to devote to sports and there will be better infrastructure 
                                    and more funding for training elite athletes."),
                                  p("The third variable is whether a country is the host of the commonwealth. Being the host has 
                                    been associated with a strong positive effect on a country's medal count (in the Common wealth 
                                    before and after hosting, as well as at the Games hosted). "),
                                  p("The fourth variable is National income which means the value of goods and services produced by 
                                    a country during a financial year. It includes payments made to all resources either in the 
                                    form of wages, interest, rent, and profits. "),
                                  p("The fifth variable is Human Development index (HDI). Health, literacy and standards of living 
                                    are all important factors too. So, it's not surprising that the top 10 countries in the medal's 
                                    standings, have better HDI "),
                                  p("And last one is Exponential Smooth. It is a Lagged variable calculated based on the performance 
                                    in the preceding years. "),
                                  img(src = "paper-1.png", alt = "Variable Names", class = "imgcenter", width = "400")
                              ),
                              h4(class = "paperSubtitle","Forecasting process"),
                              div(class = "content",
                                  p("We collected the data for top 10 countries (India, Australia, Canada, South Africa, New Zealand, 
                                    Kenya, Nigeria, Malaysia, Jamaica, Singapore) from year 1990-2018 to predict the medal tally for 2022."),
                                  p("Overfitting the given data when using both statistical models and machine learning invariably results 
                                    in erroneous predictions. This is especially true when only a limited amount of data is accessible. As a 
                                    result, we use a strict time-consistent data separation to minimise overfitting and produce fair and 
                                    reliable findings. To fit models during model selection, we use data collected from 1990 to 2014 as the 
                                    training set. We also use data from the 2018 Common Wealth Games as a test set to evaluate and compare 
                                    the models' performance during the model selection process. The results we got for the following are: "),
                                  p("The null hypothesis we took was there is no relationship between the total medal count of a country with 
                                    the other variables we choose and the alternative hypothesis was there is a relationship. As the p-value 
                                    we got is <0.05 so we can reject the null hypothesis. Also, the adjusted r-square value we got is 0.92 
                                    which depicts that 92% variance is explained by the model we used.  The regression model predicts the 
                                    total medal count with an average error about 14.98. "),
                                  img(src = "paper-2.png", alt = "Summary", class = "imgcenter", width = "800"),
                                  p("The null hypothesis we took was there is no relationship between the total medal count of a country with 
                                    the other variables we choose and the alternative hypothesis was there is a relationship. As the p-value 
                                    we got is <0.05 so we can reject the null hypothesis. Also, the adjusted r-square value we got is 0.92 
                                    which depicts that 92% variance is explained by the model we used.  The regression model predicts the 
                                    total medal count with an average error about 14.98. "),
                                  img(src = "paper-3.png", alt = "Medal count prediction", class = "imgcenter", width = "500"),
                                  img(src = "paper-4.png", alt = "density plot", class = "imgcenter", width = "800"),
                                  img(src = "paper-5.png", alt = "residual", class = "imgcenter", width = "800"),
                                  img(src = "paper-6.png", alt = "Line of best fit", class = "imgcenter", width = "600"),
                                  p("Finally, we make predictions for the 2022 Common wealth Games (forecasting) this time, we use data containing 
                                    the 2018 as well.  "),
                                  img(src = "paper-7.png", alt = "Predicted medal count", class = "imgcenter", width = "500"),
                              ),
                              div(class = "content",
                                  h4(class = "paperSubtitle","Conclusion "),
                                  p("The two-stage forecasting model is a good way to combine knowledge from the dependent 
                                    variable's previous patterns with information from causally connected variables. Initially while deciding the 
                                    variables, we thought that GDP per capita and National Income will have the positive impact on the medal count 
                                    of a country. But through the actual model we got to know that it has a negative impact. Moreover, when our 
                                    data was small (i.e., 5 countries) we got the higher accuracy as compared to current model. In addition, there 
                                    are other features not in this dataset that could have improved our model for instance Including exp smooth as 
                                    variable helped a lot in the prediction model. Finding such lagged variable would help enhance the performance 
                                    of the model. "),
                                  p("A better model could be made with the inclusion of England. As socio economic data for England isn't available 
                                    and only that of the entire UK is available. 
                                    Let's wait till July 2022 to see how our model performed . "),
                              ),
                              )
                          )
             ),
             tabPanel(tags$div(onclick="changeBG_blogs()"  ,"Blogs"),
                      fluidPage(class = "blogpage",
                                div(class = "blogs",
                                    div(class="post",
                                        div(tags$a(href = "https://medium.com/@alanthomas13071999/commonwealth-the-friendly-or-the-unfriendly-games-24d14fdf55a1",div(class="postInfo",
                                        span(class="postTitle",
                                        "COMMONWEALTH THE FRIENDLY OR THE UNFRIENDLY GAMES?"
                                        ),
                                        span(class="postDate","Mar 16, 4 min read")
                                        ),),
                                        p(class="postDescription",
                                          "Commonwealth games, the so-called friendly games started in 1930 with its main 
                            objective to bring together the members of the Commonwealth of Nations in an 
                            effort to raise the bar of sport for all humanity and provide a level playing 
                            field where athletes compete in a spirit of friendship and fair play. From the 
                            beginning itself there were several incidents which effected the good going of 
                            the games."),),
                                        div(class = "postImagediv",img(class="postImage" ,src="blog-1.png" ,alt="globe")),
                                    ),
                                    div(class="post",
                                        div(tags$a(href = "https://medium.com/@alwinjohn31/will-covid-have-an-impact-on-commonwealth-games-2022-medal-tally-a1b0b94a2012",div(class="postInfo",
                                                                                                                                                                              span(class="postTitle",
                                                                                                                                                                                   "WILL COVID HAVE AN IMPACT ON COMMONWEALTH GAMES 2022 MEDAL TALLY?"
                                                                                                                                                                              ),
                                                                                                                                                                              span(class="postDate","Mar 16, 6 min read")
                                        ),),
                                        p(class="postDescription",
                                          "The 2022 Commonwealth games is the first CW games post covid, so we don't have 
                              a dataset containing the post covid influence on medal tally, but taking the 2020 
                              Tokyo Olympics into consideration even the highly covid effected countries grabbed 
                              positions in the medal tally much similar to the previous years, in fact the 
                              highest Covid effected country-America was able to retain its first position in 
                              Medal tally in 2020 Olympics too."),),
                                        div(class = "postImagediv",img(class="postImage" ,src="blog-2.png" ,alt="pandemic")),
                                    ),
                                    div(class="post",
                                        div(tags$a(href = "https://medium.com/@lakshitasethi111/contrasting-facts-about-indias-performance-in-cwg-asian-games-olympics-742f6360cc2f",div(class="postInfo",
                                                                                                                                                                                         span(class="postTitle",
                                                                                                                                                                                              "Contrasting facts about India's performance in CWG, ASIAN GAMES & OLYMPICS"
                                                                                                                                                                                         ),
                                                                                                                                                                                         span(class="postDate","Mar 16, 5 min read")
                                        ),),
                                        p(class="postDescription",
                                          "India's constant mediocre performance in the Olympics, whereas it's relatively better in CWG. 
                              Let's Study why!
                              India is currently ranked 4th in the Commonwealth Games.
                              Lately, because it has performed evidently well in the Commonwealth Games, but the performance 
                              bar hasn't improved in case of Olympics and Asian Games.
                              Our analysis below shows the average medal tally of India in different International Games with 
                              respect to years:"),),
                                        div(class = "postImagediv",img(class="postImage" ,src="blog-3.jpg" ,alt="Indian flag")),
                                    ),
                                    div(class="post",
                                        div(tags$a(href = "https://medium.com/@deonsaju1998/host-effect-in-sports-events-pros-and-cons-f225c7b342d",div(class="postInfo",
                                                                                                                                                        span(class="postTitle",
                                                                                                                                                             "Host Effect in Sports Events: Pros and Cons"
                                                                                                                                                        ),
                                                                                                                                                        span(class="postDate","Mar 16, 5 min read")
                                        ),),
                                        p(class="postDescription",
                                          "Hosting games such as Olympics, Asian Games or CWG often serve as a pride to a country. 
                              Countries often take turns to host such games and often spend billions for preparation and 
                              running the event. For athletes and viewers, the Commonwealth Games creates a time of elite 
                              competition; however, the event often has different effects on the host nation's impoverished. 
                              Host Effect can be defined as the change in the performance of athletes and other factors 
                              that the countries experience when the event is held in their own country."),),
                                        div(class = "postImagediv",img(class="postImage" ,src="blog-4-1.png" ,alt="Host Effect")),
                                    ),
                                ),
                                div(class="sidebar",
                                    div(class="sidebarItem",
                                        span(class="sidebarTitle","ABOUT US"),
                                        p(class = "paperSubtitle2",style = "font-size: 22px;padding-bottom: 0px;","We are the 'Kuttans Te Kudiyan'"),
                                        p(
                                          "'Kuttans Te Kudiyan' is derived from two languages, in which 'Kuttan' is taken from 
                                          Malayalam meaning 'boy' and 'Kudiyan' is taken from Punjabi meaning 'girls'. Five Kuttans 
                                          from Kerela and two Kudiyan from North India, together formed this group. We are M.Sc. 
                                          BDA students from St. Joseph's College(Autonomous), Bangalore. The initial thought in 
                                          mind was to prepare an easily accessible user-interface on 'Commonwealth Games Analysis'. 
                                          Our motive while working on this project was to build a model to predict the medal tally 
                                          for 2022 CWG which will be useful for sports betting companies to set the odds in advance, 
                                          while sponsors and media companies can direct their resources to promising teams.
                                          We are trying to publish a research paper based on the findings we made through this project. 
                                          We would really like to know your views on this."),
                                    ),
                                    div(class="sidebarItem",
                                        span(class="sidebarTitle","FOLLOW US"),
                                        div(class="sidebarSocial",
                                            tags$i(class="sidebarIcons fab fa-instagram"),
                                            tags$i(class="sidebarIcons fab fa-facebook"),
                                            tags$i(class="sidebarIcons fab fa-linkedin"),
                                            tags$i(class="sidebarIcons fab fa-twitter"),
                                        )
                                    )
                                )
                      )
             ),
             tags$head(
               tags$script(src = "scripts.js"),
               tags$link(rel="stylesheet", type="text/css", href="styles.css"),
               tags$link(rel="stylesheet" ,href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css",integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==",crossorigin="anonymous",referrerpolicy="no-referrer"),
             )
  ))
)

growth.df <- read.csv(file="data/growth_of_the_games.csv",
                      head=TRUE, fileEncoding='UTF-8-BOM')

results.df <- read.csv(file="data/results_all_per_year_with_code.csv",
                       head=TRUE, fileEncoding='UTF-8-BOM', stringsAsFactors=FALSE)

sports.df <- read.csv(file="data/results_all_per_sport.csv",
                      head=TRUE, fileEncoding='UTF-8-BOM')
sports.df$total <- (sports.df$gold + sports.df$silver + sports.df$bronze)

# years
uniqueYears <- as.list(sort(unique(results.df$year), decreasing=T)) # decreasing

# sports
uniqueSports <- as.list(sort(unique(sports.df$sport)))

# regions/continents
uniqueRegions <- as.list(sort(unique(results.df$continent)))
uniqueRegions <- c('All', uniqueRegions)

# changed to local subdir under www
flagBaseUrl <- 'flags/'


server <- function(input,output,session){
  
  
  ###################################
  # Growth data
  ###################################
  
  growth.misc.data <- reactive({
    if (input$growthProp=='Number of Participating Countries') {
      y <- growth.df$participating.countries
      y.name <- 'participating.countries'
      subtitle <- 'Number of Participating Countries'
      color <- 'red'
      styles <- list(countries=paste0('color:', color, '; font-style:italic'))
    } else if (input$growthProp=='Number of Sports Played') {
      y <- growth.df$sports
      y.name <- 'sports'
      subtitle <- 'Number of Sports Played'
      color <- 'blue'
      styles <- list(sports=paste0('color:', color, '; font-style:italic'))
    } else if (input$growthProp=='Number of Events Contested') {
      y <- growth.df$events
      y.name <- 'events'
      subtitle <- 'Number of Events Contested'
      color <- 'green'
      styles <- list(events=paste0('color:', color, '; font-style:italic'))
    } else {
      y <- growth.df$athletes
      y.name <- 'athletes'
      subtitle <- 'Number of Participating Athletes'
      color <- 'orange'
      styles <- list(athletes=paste0('color:', color, '; font-style:italic'))
    }
    
    # save to a list
    list(y=y, y.name=y.name, subtitle=subtitle, color=color, styles=styles)
  })
  
  output$growthPlot <- renderEcharts4r({ 
    growth.df$year = as.character(growth.df$year)
    if(growth.misc.data()[['y.name']] == 'participating.countries'){
      growth.df |>
      e_chart( x = year ) |>
      e_line(serie = participating.countries , name = "Number of Countries Participating"  ) |>
      e_tooltip(trigger = 'axis') |>
      e_datazoom(x_index = c(0, 1))
    } else if (growth.misc.data()[['y.name']] == 'sports'){
      growth.df |>
      e_chart( x = year ) |>
      e_line(serie = sports , name = "Number of Sports Played"  ) |>
      e_tooltip(trigger = 'axis') |>
      e_datazoom(x_index = c(0, 1))
    } else if (growth.misc.data()[['y.name']] == 'events'){
      growth.df |>
      e_chart( x = year ) |>
      e_line(serie = events , name = "Number of Events Contested"  ) |>
      e_tooltip(trigger = 'axis') |>
      e_datazoom(x_index = c(0, 1))
    } else {
      growth.df |>
      e_chart( x = year) |>
      e_line(serie = athletes , name = "Number of Participating Athletes"  ) |>
      e_tooltip(trigger = 'axis') |>
      e_datazoom(x_index = c(0, 1))
    }
  })

  ###################################
  # Results Tally
  ###################################
  
  # update input dropdowns
  updateSelectInput(session, "resultsYearInput", choices=uniqueYears)
  updateSelectInput(session, "resultsRegionInput", choices=uniqueRegions)
  
  results.data <- reactive({
    data <- results.df
    # filters
    data <- data[data$year == input$resultsYearInput, ] 
    if (input$resultsRegionInput != 'All') {
      data <- data[data$continent == input$resultsRegionInput, ]
    }
    # sort: gold, silver, bronze
    data <- data[with(data, order(-gold, -silver, -bronze)), ]
    data
  })
  
  output$resultsTally <- renderUI({
    if (nrow(results.data()) != 0) {
      
      resultsTable <- tags$table( style = "width:100%",
                                  tags$tr(class="results-header",
                                          tags$th(class="results-rank", "Rank"), 
                                          tags$th(class="results-flag", "Flag"),
                                          tags$th(class="results-country", "Country"),
                                          tags$th(class="results-gold", "Gold"),
                                          tags$th(class="results-silver", "Silver"),
                                          tags$th(class="results-bronze", "Bronze"),
                                          tags$th(class="results-total", "Total")
                                  )
      )
      
      for(i in 1:nrow(results.data())) {
        row <- results.data()[i,]
        resultsTable <- tagAppendChild(resultsTable,
                                       tags$tr(class="results-row",
                                               tags$td(class="results-rank", i),
                                               tags$td(class="results-flag", 
                                                       img(src=paste0(flagBaseUrl, row[2], '.png'),
                                                           alt=paste0(row[3], ' flag'),
                                                           width=80)),
                                               tags$td(class="results-country", row[3]),
                                               tags$td(class="results-gold", row[7]),
                                               tags$td(class="results-silver", row[8]),
                                               tags$td(class="results-bronze", row[9]),
                                               tags$td(class="results-total", row[11])
                                       )
        )        
      }      
      
      if (input$resultsYearInput == 'All') {
        medalTallyTitle <- "Medal Tally (All years)"
      } else {
        medalTallyTitle <- paste0("Medal Tally in ", input$resultsYearInput) 
      }
      
      div(
        h2(id="medal-tally-title", medalTallyTitle),
        div(id="results-tally", style = "width: 100%", resultsTable)
      )
    }
  })  
  ###################################
  # Results Map
  ###################################  
  
  # update input dropdowns
  updateSelectInput(session, "mapYearInput", choices=uniqueYears)
  updateSelectInput(session, "mapRegionInput", choices=uniqueRegions)
  
  map.data <- reactive({
    data <- results.df
    # filters
    data <- data[data$year == input$mapYearInput, ] 
    if (input$mapRegionInput != 'All') {
      data <- data[data$continent == input$mapRegionInput, ]
    }
    data
  })
  
  map.medals.data <- reactive({
    data <- map.data()
    if (nrow(data) > 0) {
      if (grepl('Gold', input$mapViewInput)) {
        data$popup <- paste0(data$gold, ' medals')
        data <- data[data$gold > 0, ]
      } else if (grepl('Silver', input$mapViewInput)) {
        data$popup <- paste0(data$silver, ' medals')
        data <- data[data$silver > 0, ]
      } else {
        data$popup <- paste0(data$bronze, ' medals')
        data <- data[data$bronze > 0, ]
      }
    }
    data
  })
  
  output$mapLeaflet <- renderLeaflet({
    leaflet.map <- leaflet(data=map.data()) %>%
      addTiles()
    
    if (nrow(map.data()) > 0) {
      
      if (input$mapViewInput=='Participant Countries') {
        customIcons <- awesomeIcons(
          icon='flag',
          iconColor='black',
          library='glyphicon'
          #markerColor=getRegionColor(map.data())
        )
        leaflet.map <- leaflet.map %>%
          addAwesomeMarkers(~long, ~lat, label=~country, icon=customIcons)
        
        leaflet.map <- leaflet.map
        
      } else {
        m.data <- map.medals.data()
        
        if (nrow(m.data) > 0) {
          leaflet.map <- leaflet(data=m.data) %>%
            addTiles()
          
          if (grepl('Gold', input$mapViewInput)) {
            icon.url <- 'gold-medal-64.png'
          } else if (grepl('Silver', input$mapViewInput)) {
            icon.url <- 'silver-medal-64.png'
          } else {
            icon.url <- 'bronze-medal-64.png'
          }
          
          # set icon size based on value
          getIconSize <- function(m.data) {
            sapply(m.data$total, function(total) {
              if(total <= 10) {
                16
              } else if(total <= 50) {
                24
              } else if (total <= 100) {
                32
              } else {
                48
              }
            })
          }        
          
          medalIcons <- icons(iconUrl=icon.url, iconWidth=getIconSize(m.data), iconHeight=getIconSize(m.data))
          
          leaflet.map <- leaflet.map %>%
            addMarkers(~long, ~lat, label=~country, 
                       icon=medalIcons, 
                       popup=~popup)
        }
      }
      
    }
    
    leaflet.map
  })
  
  output$mapViewTitle <- renderUI({
    if (input$mapYearInput == 'All') {
      leafletSubtitle <- "(All years)"
    } else {
      hostData <- growth.df[growth.df$year==input$mapYearInput, ]
      leafletSubtitle <- paste0(input$mapYearInput, " Games in ", hostData[1, "city"], ", ", hostData[1, "country"])
    }
    
    div(class = "map-title",
      h1(id="leaflet-map-title", input$mapViewInput),
      h2(id="leaflet-map-subtitle", leafletSubtitle)
    )
  })  
  
  output$mapViewCaption <- renderUI({
    if (nrow(map.data()) == 0) {
      p("No data available for the selected filters")
    } else {
      if (grepl('Medals', input$mapViewInput)) {
        p(class="plot-note", "Click on a medal to find out how many were won")
      }
    }
  })
  ###################################
  # Country Details data
  ###################################  
  
  updateSelectInput(session, "countryRegionInput", choices=uniqueRegions)
  
  region.countries <- reactive({
    if (input$countryRegionInput == 'All') {
      as.list(sort(unique(results.df$country)))
    } else {
      as.list(sort(unique(results.df[results.df$continent==input$countryRegionInput, ]$country)))
    }
  })
  
  observe({
    defaultCountry = NULL
    if (input$countryRegionInput == 'All') {
      defaultCountry='Australia' # default
    }
    updateSelectInput(session, "countryNameInput", choices=region.countries(), selected=defaultCountry)
  })
  
  country.data <- reactive({
    results.df[results.df$country==input$countryNameInput, ]
  })
  
  country.misc.data <- reactive({
    country.df <- country.data()
    country.code <- country.df[1, ]$country.code
    continent <- country.df[1, ]$continent
    years.joined <- nrow(country.df) - 1 # deduct 'All' entry
    first.join.year <- min(country.df$year)
    total.gold <- country.df[country.df$year=='All', ]$gold
    total.silver <- country.df[country.df$year=='All', ]$silver
    total.bronze <- country.df[country.df$year=='All', ]$bronze
    total.medals <- country.df[country.df$year=='All', ]$total
    
    list(country.code=country.code,
         continent=continent,
         years.joined=years.joined,
         first.join.year=first.join.year,
         total.gold=total.gold,
         total.silver=total.silver,
         total.bronze=total.bronze,
         total.medals=total.medals)
  })
  
  output$countryProfile <- renderUI({
    div(id="country-profile-details",
        img(id="country-profile-flag", 
            src=paste0(flagBaseUrl, country.misc.data()[['country.code']], '.png'),
            alt=paste0(input$countryNameInput, ' flag'),
            width=200, style = "margin: 0 auto;"),
        div(class = "country-table",div(id="country-profile-name", input$countryNameInput),
        tags$table(id="country-profile-table", border="1",
                   tags$tr(tags$td(class="country-profile-label", "Region"), tags$td(class="country-profile-value", country.misc.data()[['continent']])),
                   tags$tr(tags$td(class="country-profile-label", "# Years joined"), tags$td(class="country-profile-value", country.misc.data()[['years.joined']])),
                   tags$tr(tags$td(class="country-profile-label", "Year first joined"), tags$td(class="country-profile-value", country.misc.data()[['first.join.year']])),
                   tags$tr(tags$td(class="country-profile-label", "Gold medals"), tags$td(class="country-profile-value", country.misc.data()[['total.gold']])),
                   tags$tr(tags$td(class="country-profile-label", "Silver medals"), tags$td(class="country-profile-value", country.misc.data()[['total.silver']])),        
                   tags$tr(tags$td(class="country-profile-label", "Bronze medals"), tags$td(class="country-profile-value", country.misc.data()[['total.bronze']])),        
                   tags$tr(tags$td(class="country-profile-label", "Total medals"), tags$td(class="country-profile-value", country.misc.data()[['total.medals']]))        
        )  
    ))
  })
  
  output$countryYearResults <- renderPlot({
    year.df <- country.data()
    year.df <- year.df[year.df$year!='All', ]
    year.df <- year.df[, c(1, 7, 8, 9)]
    #cat(file=stderr(), str(year.df))
    year.df <- melt(year.df, id='year')
    names(year.df) <- c('year', 'medal.class', 'medal.count')
    #cat(file=stderr(), str(year.df))
    my_color <- c("#1B9E77", "#D95F02" ,"#7570B3")
    
    ggplot(year.df, aes(x=year, y=medal.count, fill=medal.class)) + 
      geom_bar(stat='identity', color='black') +
      labs(x='Year', y='Medals won',
           title=paste0('Medals won by ', input$countryNameInput, ' by Year')) +
      theme(plot.title=element_text(size=22, hjust=0.5, face="bold")) +
      scale_fill_manual("legend", values=c('gold'='#FFD700', 'silver'='#c0c0c0', 'bronze'='#cd7f32')) +
      scale_y_continuous(labels=function(x) { floor(x) })
  })
  
  country.sports.data <- reactive({
    data <- sports.df[sports.df$country==input$countryNameInput, ]
    # get total
    data$total <- data$gold + data$silver + data$bronze
    # select only needed columns
    data <- data[, c('sport', 'country', 'total')]
    # aggregate: sum
    data.agg <- aggregate(data[3], data[-3], sum)
    if (nrow(data.agg) > 0) {
      # sort descending
      data.agg <- data.agg[with(data.agg, order(-total)), ]
    }
    # return aggregate
    data.agg
  })
  
}

shinyApp(ui,server)

