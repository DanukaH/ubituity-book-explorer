# README

Link to the app: https://ubituity-book-explorer.herokuapp.com

Summary
* Registration: Use of Devise to implement registration and login.
* CSV upload: After the registration, you will be redirected to the home page where you can see a button, which allows you to navigate to the page to upload the CSV file.
The CSV file should contain the following columns:
  * Book title
  * Book author
  * Date published
  * Unique identifier for the book
  * Publisher name
* Validation: During the upload, the unique identifier for the book will be validated and informs the user if the identifier is not valid. The upload will be stopped in such a case.
* File handling: During the upload, the CSV file will be renamed to have a UUID in it and uploaded to the Amazon S3 bucket dedicated to the app. The new name and the S3 URL of the file will be saved in the application database.
* Content management: After the upload, you will be redirected to a page showing a table representing the valid contents of the CSV file. The page title will be the newly created name of the uploaded CSV. When you have logged in to the application again, you can access the contents of each CSV file uploaded in the past by clicking on the "Past Uploads" link on the top nav bar. After the upload, you can access individual books that were created by the process where you can then edit details and delete books.
  

* Requirements fulfilled
    * Use of carrierwave-aws gem to handle the upload as required.
    * Database: MySQL
    * Hosting: The application can be used online as an app hosted in Heroku
  

* Bonus points achieved
  * Look and feel: I have used bootstrap 5 to style the front end. Hope you will like it :)
  * External service integration: I have generated a public HTTP bin with https://requestbin.com/. Therefore every time a CSV file is uploaded, the application will send a notification to this external service, performing a POST request.
  * Super bonus: In the above POST request, it will include the S3 URL of the uploaded file in the POST parameters.

