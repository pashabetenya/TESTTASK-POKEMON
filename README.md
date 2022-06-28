# TESTTASK-POKEMON.

This application is as a project on a summer internship from the university, after which - can be applied for an internship program (if, of course, the project and my knowledge to date like).
I would like to enroll in the internship program, where there will be the necessary guys who will be able to share their experiences and help me develop in this direction.

## That about the project (company requirements). 

Instructions:
- Create a simple application to view pokemons.

Minimal functionality:
- List should display pokemon names from REST APi. List should support pagination.
- When a user clicks on cell, then the details screen is opened.
- The Pokemon details page will use the REST API, and show the next information:
  - The Pokemon's name;
  - A single image of the pokemon from the front;
  - The Pokemon's "types" e.g. grass;
  - The Pokemon's weight in kg;
  - The Pokemon's height in cm;
  - The page should also have some form of back button to go back to the list.
- Make sure you consider and handle all possible states of the app (offline, data not loading, errors, etc).
- Data should be cached in the database to support offline mode.

Requirements:
- Clean Architecture.
- Use your own design for the application.
- Code should support Unit-testing.

Result:
- Code should be pushed to a public repository on GitHub.
- Repository should contains commit history instead of a single one.
- Select icons by yourself. App should contain non-default launch icon.
- Link should be provided to interviewer.




## Application Preview.

<!-- <table>
  <tr>
    <td><img src='screenshots/app_preview.gif' width="200"/><td>
  </tr>
</table> -->
<table>
  <tr>
    <th>Home Page</th>
    <th>Detail</th>
    <th>Search</th>
  </tr>
  <tr>
    <td><img src='photos/photo1st.png'/></td>
    <td><img src='photos/photo2nd.png'/></td>
    <td><img src='photos/photo3th.png'/></td>
  </tr>
  
</table>

<br>




## What I supposedly accomplished, and what is planned in the future.

- Design:
   - Home page;
   - Detail;
- REST Api (there is a check for some errors).
- Connected a package that allows you to cache data, that is received from a request from the server.
   - TRIED TO CONNECT THE DATABASE AS A HIVE-DB. BUT SOMETHING DID NOT WORK. IN THE FUTURE I WANT TO UNDERSTAND THIS ISSUE AND TRY TO CONNECT MORE.
- Made a search in my app where you can save time and find the right Pokémon in a matter of time.
- Added an icon for the app, and a splash screen when you open the app for the first time.

Due to the fact that the practice is coming to an end, had time for this.


Eventually I'm going to continue studying, and if I get into an internship program, the process will speed up. The direction is new, and it's very difficult to talk to someone and find help in training.
On a good note, I'd like to see it work out. I realize the responsibility and understand it, I will try my best.

In the future it is planned (these are essentially the defaults, and then we'll see):
- Prescribe the architecture.
- Learn how to prescribe different tests.
- Write the "favorites" section.
- Change the interface language.

I wrote it primitively and didn't include any packages. This is all so that people who will be looking at this project - could catch my logic and make the right choice in terms of evaluation.

