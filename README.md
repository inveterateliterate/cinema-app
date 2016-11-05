# **CINEMA APP**
The **Cinema App** (currently branded for the fictional Clearview Cinemas) is an application designed to allow customers to purchase tickets to movies at the theater.
Additionally, theater management can use the app to manage scheduling of movies and auditorium capacity, as well as track ticket purchase history.
You can view the app live on Heroku at https://clearview-cinemas.herokuapp.com/

**Update:** Additional features are in beta version and can be found in the movie-filter branch, or live at https://cinema-app2.herokuapp.com/.
Updates include additional drop-down filters, fixes for validation and seat availability bugs, and improved rspec tests.

## **Functionalities and Features**

#### *Customers*
* Customers can visit the site and view which movies are showing on a particular date.
* There is a drop-down menu available to navigate to a different date within the week and view showings on that date
* Customers can purchase a ticket to a showing by clicking on the showtime for a given movie.
	* If the showing is sold out, that showtime will be unavailable for ticket purchase
* When customers decide to purchase a ticket, they complete a form with their name, email, credit card number, and expiration date
	* The form will validate that the data entered is appropriate (e.g., an email is an email address, a credit card number is 16 digits, and the expiration date is after today), and notify the user of any problems
	* *Note* This is not a full e-commerce application at this time, and data is not encrypted. Please use dummy data when exploring that application
* Upon successful completion of the form (purchase), the customer will receive an email confirmation of their purchase

#### *Owners*
* The owner can view the auditoriums in her theater and each auditorium’s seating capacity
* The owner can create or edit showings to indicate which movies are playing at which auditorium at a specified date and time
* The owner can view the sales history for all tickets purchased
	* The owner can view the sales history for tickets purchased for a particular movie by clicking on any movie title link

## **Approach**

#### *Models*

The application is designed using four models:

1. Movies – Title, Description, Runtime, Rating
  * Methods added to easily grab a movie’s showings, or a movie’s orders
2. Auditoria – Capacity
3. Showings – Date, Time, Movie (by foreign key movie_id), Auditorium (by foreign key auditorium_id), Available Seats 
4. Orders – Customer First Name, Customer Last Name, Customer Email, Showing (by foreign key showing_id), Credit Card Number, Credit Card Expiration Date, Sale
	* Method added to decrease available seats for a showing when a ticket is purchased
  
The Showings model was used as a pivot to maintain separation of concerns, managing relationships through various associations.
  
#### *Controllers*

Controllers were maintained largely as generated, with a few additions:
* Logic to generate the drop down of dates for the week is included in the Application Controller
* Methods to direct the appropriate customer view of showings added to the Showings controller (based on date)
* Methods to “filter” orders by movie, and to email receipts included in the Orders Controller

#### *Views*
This app uses the Bootswatch Flatly theme to easily manage styles and views. Forms and index views are kept consistent across models, and there is a drop-down menu for ease of navigation.

*Note:* This application does not currently include authentication, but in general, the views would be available or restricted according to whether a viewer is a customer or an administrator (owner):

*Customer:*
* Showings of movies by movie and date
* Order form
* Order confirmation and receipt

*Administrator:*
* List of all showings in the database, and forms to add, edit, or delete showings
* List of all movies in the data base, and forms to add, edit, or delete movies
* List of all auditoria in the data base, and forms to add, edit, or delete auditoria
* List of all orders in the data base, and form to delete orders (will be removed in next iteration, currently here for ease of exploring the application)

*Note:* Due to the included associations, the owner cannot delete auditoriums, or movies without deleting associated showings, nor showings without deleting associated orders.

#### Check back for updated features and functionality (e.g., authentication, validation against conflicts, and purchase of multiple tickets)!
