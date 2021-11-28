# Merchandising
An Application to list the products and on selection of product list the detail of particular product

This application uses VIPER design pattern as architecture and SOLID principle. It has 2 modules named list and details module.
Common Codes are moved to common files

# Common Files
1. HttpClient : Responsible for creating request and making network calls and callback for success and failed cases
2. Utils : Check the internet connection, download the data 
3. AppConstants : Holds constant used across appliction 

# App-Module 
1. List Module 
Module uses viper architecture and SOLID principle to segreate the responsibility
Makes network call to fetch the list of product. 
2. Detaile Module 
Simple module to display the selected product details


# Custom Framework (Can be used in different module)
ImageCache - custom framework created to save the image in cache and next time use it from cache if it exists.
If the image does not exist it saves the image in Image Cache
Source code of Framework can be found at repository https://github.com/Poonam24/ImageCache


# Font Used
Open-Sans Fonts are used in application

# Unit Testing : 
Each Unit testing code is proviced in the module

# UI test : 
Scenario Covered : 
1. App Launches, 
2. table view listed 
3.  on click of cell it goes to details view
4.  On click of back button of navigation bar, comes to first screen 
5.  table view swiped up


# The application is developed on Xcode 12 and has been tested on iPhone 11, 11 Pro, ipod , iPhone SE.
Screenshots from couple of devices

![Simulator Screen Shot - iPhone SE (2nd generation) - 2021-11-25 at 23 13 04](https://user-images.githubusercontent.com/4199763/143764527-8ff1d00e-b3e0-4b70-a4c1-72ea11e09d1b.png)

![Simulator Screen Shot - iPhone SE (2nd generation) - 2021-11-26 at 20 22 42](https://user-images.githubusercontent.com/4199763/143764533-597df536-600b-4f68-ab9d-922bbaddebdd.png)

![Simulator Screen Shot - iPhone 11 - 2021-11-28 at 16 10 47](https://user-images.githubusercontent.com/4199763/143764584-c6549b34-02a5-4f43-b131-38b94ef09d2f.png)
![Simulator Screen Shot - iPhone 11 - 2021-11-28 at 16 12 48](https://user-images.githubusercontent.com/4199763/143764600-6a403078-904b-4382-b3b2-a9b419d58aee.png)



