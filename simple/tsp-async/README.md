[](example.gif)

If you are reading this, you already know the power and beauty of Shiny, so I
won’t spend your time explaining this.

Last week I had a task job to async a part of the code because it was freezing
the entire application. For those that don’t know, the Shiny works in a sync
way, which means it executes code in sequence, so if you click on one button and
it has a long operation, the entire application will wait until the operation
ends.

To exemplify, I create a simple app with two extensive operations. The data you
will find here consists of the distance between pairs of each city in the State
of Parana in Brazil, some geographics coordinations and sf things to create
maps. And we will be using the idea of Travel Salesman to illustrate. We will
calculate all the possible routes between the cities you select, considering
that the first one is the origin and seeing which ones have the shortest route.

So, what is the idea? You can select a pool of cities, between a minimum of
three and a max of seven, that is because less than three, no makes sense, and
great than seven will take too much time.

After you choose your cities, a distance matrix between pair of cities will
appear and two spinners. The left of the distance matrix is all the possible
routes in a DT, the first one is the shortest route, and the second spinner
below the distance matrix is a moving plot. The scenario with seven cities will
generate 720 plots, 6!, because, remember, the first city is our origin.

So, we have two async operations, the first one that generates all possible
routes to be taken, and the second one that depends on the previous one to
generate all the plots.

You’ll see that each element appears in Shiny dependable, so no more freezing
problems.